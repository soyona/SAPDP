#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=tests/scripts/lib/test-repository.sh
source tests/scripts/lib/test-repository.sh
trap cleanup_test_repository EXIT

create_test_repository

output=$(
  cd "$TEST_REPO"
  ./scripts/sapdp-context \
    --ref HEAD \
    --flow protocol-evolution \
    --stage 1
)

grep -Fxq 'SAPDP_CONTEXT_V1' <<<"$output"
grep -Fxq 'flow=protocol-evolution' <<<"$output"
grep -Fxq 'stage=1' <<<"$output"
grep -Fq 'authority_begin=flow|protocol-evolution|main|' <<<"$output"
grep -Fq 'authority_begin=flow|protocol-evolution|evolution-definition|' <<<"$output"
! grep -Fq 'authority_begin=flow|protocol-evolution|design|' <<<"$output"
grep -Fxq 'END_SAPDP_CONTEXT' <<<"$output"
[[ $(printf '%s\n' "$output" | wc -c | tr -d ' ') -le 16384 ]]

usage=$(
  cd "$TEST_REPO"
  ./scripts/sapdp-context 2>&1 || true
)
[[ $usage == 'ERROR SAPDP_CONTEXT_USAGE' ]]

(
  cd "$TEST_REPO"
  sed -i.bak '/capsule_schema=/d' SAPDP.md
  rm -f SAPDP.md.bak
  git add SAPDP.md
  git commit --quiet -m "Break capsule"
)

invalid=$(
  cd "$TEST_REPO"
  ./scripts/sapdp-context \
    --ref HEAD \
    --flow protocol-evolution \
    --stage 1 2>&1 || true
)
[[ $invalid == 'BLOCKED RUNTIME_CAPSULE_INVALID' ]]
