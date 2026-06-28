#!/usr/bin/env bash

set -euo pipefail

for file in \
  protocol/modules/dna/module.md \
  protocol/modules/dna/design.md \
  protocol/modules/dna/runtime.md \
  protocol/modules/dna/flows/add-dna.md
do
  [[ -f $file ]]
  grep -qx 'authority=normative' "$file"
  grep -qx 'owner_id=dna' "$file"
done

grep -Fq 'library/dna/visual/' protocol/modules/dna/module.md
grep -Fq 'library/dna/product/' protocol/modules/dna/module.md
grep -Fq 'library/dna/evidence/' protocol/modules/dna/design.md
grep -Fq 'HUMAN_INPUT: Select DNA Type' protocol/modules/dna/flows/add-dna.md

for stage in \
  '1. DNA Intake - Human + ChatGPT' \
  '2. Evidence Validation - Codex' \
  '3. DNA Design - ChatGPT' \
  '4. Design Audit - ChatGPT' \
  '5. Materialization - Codex' \
  '6. Repository Audit - ChatGPT' \
  '7. Release - Codex'
do
  grep -Fxq "$stage" protocol/modules/dna/flows/add-dna.md
done
