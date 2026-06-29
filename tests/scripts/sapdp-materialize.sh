#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=tests/scripts/lib/test-repository.sh
source tests/scripts/lib/test-repository.sh
trap cleanup_test_repository EXIT

create_test_repository
prepare_test_candidate
reject_next_remote_update

usage=$(
  cd "$TEST_REPO"
  ./scripts/sapdp-materialize 2>&1 || true
)
[[ $usage == 'ERROR SAPDP_MATERIALIZE_USAGE' ]]

if materialize_test_candidate >/dev/null 2>&1; then
  printf 'first Materialization unexpectedly succeeded\n' >&2
  exit 1
fi

candidate=$(git -C "$TEST_REPO" rev-parse HEAD)
[[ $candidate != "$TEST_BASE" ]]
[[ -z $(git -C "$TEST_REPO" status --porcelain) ]]
[[ $(git --git-dir="$TEST_REMOTE" rev-parse refs/heads/main) == "$TEST_BASE" ]]

output=$(materialize_test_candidate)
candidate=$(git -C "$TEST_REPO" rev-parse HEAD)
[[ $output == "https://github.com/soyona/SAPDP/commit/${candidate}" ]]
[[ $(git --git-dir="$TEST_REMOTE" rev-parse refs/heads/main) == "$candidate" ]]

retry_output=$(materialize_test_candidate)
[[ $retry_output == "$output" ]]
[[ $(git -C "$TEST_REPO" rev-list --count "${TEST_BASE}..HEAD") -eq 1 ]]
