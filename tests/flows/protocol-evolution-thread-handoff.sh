#!/usr/bin/env bash

set -euo pipefail

authority=protocol/flows/protocol-evolution/thread-handoff.md

[[ $(wc -c <"$authority" | tr -d ' ') -le 4096 ]]
grep -qx 'authority_registry_location=SAPDP.md' SAPDP.md
grep -Fxq \
  'authority|flow|protocol-evolution|thread-handoff|protocol/flows/protocol-evolution/thread-handoff.md' \
  SAPDP.md

for stage in design-freeze materialization repository-audit; do
  grep -Fxq 'depends_on=flow|protocol-evolution|thread-handoff' \
    "protocol/flows/protocol-evolution/${stage}.md"
done

for record in \
  'handoff_schema=sapdp-thread-handoff-v1' \
  'source_stage=<design-freeze|materialization>' \
  'target_stage=<materialization|repository-audit>' \
  'candidate_commit=<required only for repository-audit>' \
  'task=<fixed target task>' \
  'output=<fixed target output>'
do
  grep -Fq "$record" "$authority"
done

for code in \
  USAGE ARGUMENT_INVALID TRANSITION_INVALID CONTRACT_INVALID \
  ENCODING_FAILED RENDER_FAILED ORIGIN_MISMATCH REF_UNAVAILABLE \
  ROOT_AUTHORITY_INVALID WORKSPACE_UNAVAILABLE BRANCH_MISMATCH \
  HEAD_MISMATCH REMOTE_MAIN_UNAVAILABLE REMOTE_MAIN_MISMATCH \
  FREEZE_PATH_INVALID FREEZE_DIGEST_MISMATCH CANDIDATE_INVALID \
  TARGET_AUTHORITY_INVALID BUDGET_EXCEEDED
do
  grep -Fq "$code" "$authority"
done

grep -Fq 'prompt 2048, URL 6144, Card 8192' "$authority"
grep -Fq 'The source thread stops after the Card' "$authority"
grep -Fq 'FAIL or BLOCKED never hands off.' "$authority"
