#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=scripts/lib/sapdp-validation.sh
source scripts/lib/sapdp-validation.sh

sapdp_validate_capsule
sapdp_validate_stage_authority
sapdp_validate_context_budgets

bundle=$(mktemp)
trap 'rm -f "$bundle"' EXIT
{
  printf 'SAPDP_CONTEXT_V1\n'
  printf 'ref=%040d\n' 0
  printf 'root_blob=%040d\n' 0
  printf 'version=v5.0.0\n'
  printf 'authority_digest=sha256:%064d\n' 0
  printf 'flow=protocol-evolution\n'
  printf 'stage=1\n'
  printf 'working_tree=clean\n'
  printf 'remote_main=%040d\n' 0
  sapdp_context_authority_envelopes protocol-evolution 1
  printf 'END_SAPDP_CONTEXT\n'
} >"$bundle"
[[ $(wc -c <"$bundle" | tr -d ' ') -le 16384 ]]

[[ $(sapdp_runtime_capsule | wc -c | tr -d ' ') -le 4096 ]]
[[ $(wc -c <protocol/flows/protocol-evolution.md | tr -d ' ') -le 3072 ]]

for file in protocol/flows/protocol-evolution/*.md; do
  [[ $(wc -c <"$file" | tr -d ' ') -le 4096 ]]
done

stage_one=$(sapdp_context_closure_records protocol-evolution 1)
grep -Fxq 'flow|protocol-evolution|evolution-definition' <<<"$stage_one"
grep -Fxq 'architecture|repository|root' <<<"$stage_one"
! grep -Fq 'artifact-materialization' <<<"$stage_one"

stage_five=$(sapdp_context_closure_records protocol-evolution 5)
grep -Fxq 'flow|protocol-evolution|materialization' <<<"$stage_five"
! grep -Fq 'architecture|repository|root' <<<"$stage_five"
