#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=scripts/lib/sapdp-validation.sh
source scripts/lib/sapdp-validation.sh

sapdp_validate_capsule
sapdp_validate_stage_authority
sapdp_validate_context_budgets

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
