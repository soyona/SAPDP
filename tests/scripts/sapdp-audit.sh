#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=tests/scripts/lib/test-repository.sh
source tests/scripts/lib/test-repository.sh
trap cleanup_test_repository EXIT

create_test_repository
prepare_test_candidate
materialize_test_candidate >/dev/null
TEST_CANDIDATE=$(git -C "$TEST_REPO" rev-parse HEAD)

invalid=$(
  cd "$TEST_REPO"
  ./scripts/sapdp-audit \
    --commit invalid \
    --freeze-file "$TEST_FREEZE" \
    --expected-freeze-digest "$TEST_FREEZE_DIGEST" 2>&1 || true
)
[[ $invalid == 'ERROR SAPDP_AUDIT_INVALID_CANDIDATE' ]]

(
  cd "$TEST_REPO"
  output=$(./scripts/sapdp-audit \
    --commit "$TEST_CANDIDATE" \
    --freeze-file "$TEST_FREEZE" \
    --expected-freeze-digest "$TEST_FREEZE_DIGEST")
  [[ $output == PASS ]]
)

git --git-dir="$TEST_REMOTE" update-ref refs/heads/main "$TEST_BASE"
if (
  cd "$TEST_REPO"
  ./scripts/sapdp-audit \
    --commit "$TEST_CANDIDATE" \
    --freeze-file "$TEST_FREEZE" \
    --expected-freeze-digest "$TEST_FREEZE_DIGEST"
) >/dev/null 2>&1; then
  printf 'Audit unexpectedly accepted remote drift\n' >&2
  exit 1
fi
