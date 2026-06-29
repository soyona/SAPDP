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
