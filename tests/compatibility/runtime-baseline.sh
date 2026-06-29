#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=scripts/lib/sapdp-validation.sh
source scripts/lib/sapdp-validation.sh

expected=af6c78c9262bae542aa205f11b1943ca833f69365cfc8702115d5151a8ff2bcb
actual=$(git show v5.0.0:SAPDP.md | shasum -a 256 | awk '{print $1}')
[[ $actual == "$expected" ]]

flow=protocol/flows/product-development.md
dna=protocol/modules/dna/runtime.md
root=SAPDP.md
bootstrap=protocol/flows/bootstrap.md
bootstrap_validation=protocol/flows/bootstrap-validation.md
artifact=protocol/modules/artifact-materialization/design.md
governance=protocol/modules/execution-governance/design.md
commit_audit=protocol/flows/commit-audit.md
evolution_release=protocol/flows/protocol-evolution/release.md

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

grep -Fq 'New Feature begins at Problem' "$flow"
grep -Fq 'Bug Fix reuses the approved upstream chain and begins at Build.' "$flow"
grep -Fq 'Refactor reuses the approved upstream chain and begins at Build.' "$flow"
grep -Fq 'Implementation Verification `FAIL` returns to Build.' "$flow"
grep -Fq 'User Validation `FAIL` returns to MVP Definition.' "$flow"
grep -Fq 'Product Development is a strict artifact dependency chain' "$flow"
grep -Fq 'The artifact commit is the stage closure evidence.' "$flow"
grep -Fq '`PROJECT_STATE.md`, `ROUTE_MANIFEST.md`, and `ARTIFACT_INDEX.md` are not Product' "$flow"
grep -Fq 'stage_schema=sapdp-product-stage-v1' "$flow"
grep -Fq './scripts/sapdp-product-next --project-root' "$flow"
! grep -Fq 'depends_on=module|execution-governance|' "$flow"
! sapdp_context_closure_records product-development 1 |
  grep -Fq 'execution-governance'
grep -Fq 'exactly one Selected Visual DNA' "$dna"
grep -Fq 'exactly one Selected Product DNA' "$dna"
grep -Fq 'Missing either selection returns `BLOCKED`' "$dna"
grep -Fq 'HUMAN_INPUT: Select DNA Type' "$root"
grep -Fq 'route=1|new-product intent|Goal starts Build|bootstrap|main' "$root"
grep -Fq 'route=2|continue-product intent|Goal starts Continue|product-development|entry=continue' "$root"

for heading in \
  '## Required Input' \
  '## Required Output' \
  '## SAPDP Lock' \
  '## Required Templates' \
  '## Forbidden Bootstrap Outputs' \
  '## Execution' \
  '## Idempotency' \
  '## Completion' \
  '## Output'
do
  grep -Fxq "$heading" "$bootstrap"
done

for heading in \
  '## Result Set' \
  '## Validation Order' \
  '## PASS' \
  '## PATCH REQUIRED' \
  '## FAIL' \
  '## Lifecycle Boundary' \
  '## Output'
do
  grep -Fxq "$heading" "$bootstrap_validation"
done

for heading in \
  '## Allowed Actions' \
  '## Forbidden Actions' \
  '## Materialization Audit' \
  '## Repair Rule' \
  '## Stop Conditions'
do
  grep -Fxq "$heading" "$artifact"
done

for field in \
  'Execution Method:' \
  'Invocation:' \
  'Inputs:' \
  'Constraints:' \
  'Validation:' \
  'Output:'
do
  grep -Fq "$field" "$flow"
done

grep -Fq 'Missing product-specific Git automation is not a blocker by itself.' "$flow"
grep -Fq 'Git Commit Diff as implementation source of truth' "$commit_audit"
grep -Fq 'PATCH REQUIRED' "$commit_audit"
grep -Fq 'Implementation Verification `PASS` conclusion' "$flow"
grep -Fq 'User Validation `PASS` conclusion' "$flow"
grep -Fq 'remote `main` to equal Audited Commit' "$evolution_release"
grep -qx 'authority_registry_location=SAPDP.md' "$root"
grep -Fq 'mandatory, self-contained thread handoffs' CHANGELOG.md
grep -Fq 'The source thread stops after the Card' \
  protocol/flows/protocol-evolution/thread-handoff.md
[[ -x scripts/sapdp-product-next ]]
[[ -x tests/flows/product-development.sh ]]
