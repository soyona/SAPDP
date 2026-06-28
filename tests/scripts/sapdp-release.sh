#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=tests/scripts/lib/test-repository.sh
source tests/scripts/lib/test-repository.sh
trap cleanup_test_repository EXIT

create_test_repository
prepare_test_candidate
materialize_test_candidate >/dev/null
TEST_CANDIDATE=$(git -C "$TEST_REPO" rev-parse HEAD)
reject_next_remote_update

release_command=(
  ./scripts/sapdp-release
  --version "$TEST_VERSION"
  --audited-commit "$TEST_CANDIDATE"
  --freeze-digest "$TEST_FREEZE_DIGEST"
)

if (
  cd "$TEST_REPO"
  "${release_command[@]}"
) >/dev/null 2>&1; then
  printf 'first Release unexpectedly succeeded\n' >&2
  exit 1
fi

git -C "$TEST_REPO" rev-parse "refs/tags/${TEST_VERSION}" >/dev/null
if git --git-dir="$TEST_REMOTE" rev-parse "refs/tags/${TEST_VERSION}" >/dev/null 2>&1; then
  printf 'rejected tag unexpectedly exists remotely\n' >&2
  exit 1
fi

output=$(
  cd "$TEST_REPO"
  "${release_command[@]}"
)
[[ $output == "https://github.com/soyona/SAPDP/tree/${TEST_VERSION}" ]]

retry_output=$(
  cd "$TEST_REPO"
  "${release_command[@]}"
)
[[ $retry_output == "$output" ]]
[[ $(git --git-dir="$TEST_REMOTE" rev-list -n 1 "$TEST_VERSION") == "$TEST_CANDIDATE" ]]
