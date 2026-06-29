#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=scripts/lib/sapdp-validation.sh
source scripts/lib/sapdp-validation.sh

sapdp_validate_registry

[[ $(sapdp_registry_records | LC_ALL=C sort | uniq -d | wc -l | tr -d ' ') -eq 0 ]]
sapdp_authority_path flow protocol-evolution main >/dev/null
sapdp_authority_path module execution-governance repository-evolution >/dev/null
