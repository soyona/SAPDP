#!/usr/bin/env bash

set -euo pipefail

expected=14827c81d26abf2b5661e87dc0032927713fe9565d031b38a0d28be0dda73f5c
actual=$(git show v3.0.6:SAPDP.md | shasum -a 256 | awk '{print $1}')
[[ $actual == "$expected" ]]

flow=protocol/flows/product-development.md
dna=protocol/modules/dna/runtime.md
root=SAPDP.md

for stage in \
  '1. Problem - ChatGPT' \
  '2. Solution - ChatGPT' \
  '3. DNA Selection - Human + ChatGPT' \
  '4. Product Representation - ChatGPT' \
  '5. Product Requirement - ChatGPT' \
  '6. UX Specification - ChatGPT' \
  '7. Visual Design Specification - ChatGPT' \
  '8. MVP Definition - ChatGPT' \
  '9. Task Package - ChatGPT' \
  '10. Build - Codex' \
  '11. Implementation Verification - ChatGPT + Codex evidence' \
  '12. User Validation - Human + ChatGPT' \
  '13. Release - Codex after approval'
do
  grep -Fxq "$stage" "$flow"
done

grep -Fq 'New Feature enters Problem.' "$flow"
grep -Fq 'Bug Fix enters Implementation Verification.' "$flow"
grep -Fq 'Refactor enters Build.' "$flow"
grep -Fq 'Failure returns to Build.' "$flow"
grep -Fq 'Failure returns to MVP Definition.' "$flow"
grep -Fq 'exactly one Selected Visual DNA' "$dna"
grep -Fq 'exactly one Selected Product DNA' "$dna"
grep -Fq 'Missing either selection returns `BLOCKED`' "$dna"
grep -Fq 'HUMAN_INPUT: Select DNA Type' "$root"
