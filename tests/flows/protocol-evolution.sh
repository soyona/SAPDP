#!/usr/bin/env bash

set -euo pipefail

flow=protocol/flows/protocol-evolution.md

for stage in \
  '1. Evolution Definition - ChatGPT' \
  '2. Design - ChatGPT' \
  '3. Design Audit - ChatGPT' \
  '4. Design Freeze - ChatGPT' \
  '5. Materialization - Codex' \
  '6. Repository Audit - ChatGPT' \
  '7. Release - Codex'
do
  grep -Fxq "$stage" "$flow"
done

grep -Fq 'Design Audit FAIL returns to Design' "$flow" || grep -Fq 'FAIL returns to Design.' "$flow"
grep -Fq 'Candidate Commit Policy' "$flow"
grep -Fq -- '--expected-freeze-digest' "$flow"
grep -Fq -- '--audited-commit' "$flow"
grep -Fq 'Repository-Audit: PASS' "$flow"
grep -Fq 'idempotent' "$flow"
