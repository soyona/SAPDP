#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=scripts/lib/sapdp-validation.sh
source scripts/lib/sapdp-validation.sh

sapdp_validate_dependencies
sapdp_validate_stage_authority

while IFS= read -r path; do
  while IFS= read -r dependency; do
    [[ $dependency =~ ^[^|]+\|[^|]+\|[^|]+$ ]]
  done < <(sapdp_dependency_records "$path")
done < <(sapdp_registry_paths)

core=protocol/flows/protocol-evolution.md
grep -Fxq 'depends_on=module|execution-governance|repository-evolution' "$core"
! grep -Fq 'artifact-materialization' "$core"

expected=$(
  cat <<'EOF'
architecture|repository|root
flow|protocol-evolution|evolution-definition
flow|protocol-evolution|main
module|execution-governance|repository-evolution
module|execution-governance|runtime
EOF
)
actual=$(sapdp_context_closure_records protocol-evolution 1)
[[ $actual == "$expected" ]]
