#!/usr/bin/env bash

set -euo pipefail

core=protocol/flows/protocol-evolution.md

for stage in \
  '1. Evolution Definition - ChatGPT' \
  '2. Design - ChatGPT' \
  '3. Design Audit - ChatGPT' \
  '4. Design Freeze - ChatGPT' \
  '5. Materialization - Codex' \
  '6. Repository Audit - ChatGPT' \
  '7. Release - Codex'
do
  grep -Fxq "$stage" "$core"
done

for component in \
  evolution-definition \
  design \
  design-audit \
  design-freeze \
  materialization \
  repository-audit \
  release
do
  file="protocol/flows/protocol-evolution/${component}.md"
  grep -qx 'authority=normative' "$file"
  grep -qx 'kind=flow' "$file"
  grep -qx 'owner_id=protocol-evolution' "$file"
  grep -qx "component_id=${component}" "$file"
done

grep -Fq 'FAIL appends findings and returns to Design.' \
  protocol/flows/protocol-evolution/design-audit.md
grep -Fq 'local candidate' protocol/flows/protocol-evolution/materialization.md
grep -Fq -- '--expected-freeze-digest' protocol/flows/protocol-evolution/materialization.md
grep -Fq -- '--audited-commit' protocol/flows/protocol-evolution/release.md
grep -Fq 'Repository-Audit: PASS' protocol/flows/protocol-evolution/release.md
grep -Fq 'idempotent' protocol/flows/protocol-evolution/materialization.md
grep -Fq 'idempotent' protocol/flows/protocol-evolution/release.md

handoff=protocol/flows/protocol-evolution/thread-handoff.md
grep -qx 'authority=normative' "$handoff"
grep -qx 'owner_id=protocol-evolution' "$handoff"
grep -qx 'component_id=thread-handoff' "$handoff"
grep -Fq 'design-freeze -> materialization' "$handoff"
grep -Fq 'materialization -> repository-audit' "$handoff"
grep -Fq 'Repository Audit PASS stays in-thread for Release.' "$handoff"
grep -Fq 'sapdp-thread-handoff-v1' "$handoff"
grep -Fq 'codex://threads/new?path=' "$handoff"
grep -Fq 'Commit URL only; then emit the Repository Audit Handoff Card outside script stdout.' "$handoff"
