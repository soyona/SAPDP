#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=tests/scripts/lib/test-repository.sh
source tests/scripts/lib/test-repository.sh

trap cleanup_test_repository EXIT
create_test_repository
prepare_test_candidate

materialization_task='Execute Protocol Evolution Materialization from the validated Design Freeze.'
materialization_output='Commit URL only; then emit the Repository Audit Handoff Card outside script stdout.'

card=$(
  cd "$TEST_REPO"
  ./scripts/sapdp-handoff render \
    --source-stage design-freeze \
    --target-stage materialization \
    --protocol-ref "$TEST_BASE" \
    --freeze-file "$TEST_FREEZE" \
    --freeze-digest "$TEST_FREEZE_DIGEST"
)
grep -Fq 'codex://threads/new?path=' <<<"$card"
grep -Fq 'originUrl=https%3A%2F%2Fgithub.com%2Fsoyona%2FSAPDP' <<<"$card"
grep -Fq 'SAPDP_THREAD_HANDOFF_START' <<<"$card"
grep -Fq 'CLI: run `/new`' <<<"$card"

validation=$(
  cd "$TEST_REPO"
  ./scripts/sapdp-handoff validate \
    --source-stage design-freeze \
    --target-stage materialization \
    --origin-url "$TEST_EXPECTED_ORIGIN" \
    --protocol-ref "$TEST_BASE" \
    --freeze-file "$TEST_FREEZE" \
    --freeze-digest "$TEST_FREEZE_DIGEST" \
    --task "$materialization_task" \
    --output "$materialization_output"
)
[[ $validation == PASS ]]

set +e
error_output=$(
  cd "$TEST_REPO"
  ./scripts/sapdp-handoff validate 2>&1
)
status=$?
set -e
[[ $status -eq 1 ]]
[[ $error_output == 'ERROR SAPDP_HANDOFF_USAGE' ]]

commit_url=$(materialize_test_candidate)
candidate=${commit_url##*/}
audit_task='Execute Protocol Evolution Repository Audit for the validated Candidate Commit.'
audit_output='Repository Audit Result contract; PASS continues directly to Release in this thread.'

audit_card=$(
  cd "$TEST_REPO"
  ./scripts/sapdp-handoff render \
    --source-stage materialization \
    --target-stage repository-audit \
    --protocol-ref "$candidate" \
    --freeze-file "$TEST_FREEZE" \
    --freeze-digest "$TEST_FREEZE_DIGEST" \
    --candidate-commit "$candidate"
)
grep -Fq "candidate_commit=${candidate}" <<<"$audit_card"

audit_validation=$(
  cd "$TEST_REPO"
  ./scripts/sapdp-handoff validate \
    --source-stage materialization \
    --target-stage repository-audit \
    --origin-url "$TEST_EXPECTED_ORIGIN" \
    --protocol-ref "$candidate" \
    --freeze-file "$TEST_FREEZE" \
    --freeze-digest "$TEST_FREEZE_DIGEST" \
    --candidate-commit "$candidate" \
    --task "$audit_task" \
    --output "$audit_output"
)
[[ $audit_validation == PASS ]]
