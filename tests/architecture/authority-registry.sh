#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=scripts/lib/sapdp-validation.sh
source scripts/lib/sapdp-validation.sh

sapdp_validate_registry

owners=$(mktemp)
edges=$(mktemp)
trap 'rm -f "$owners" "$edges"' EXIT

awk -F'|' '
  /^authority\|/ { print $3 }
' SAPDP.md | LC_ALL=C sort -u >"$owners"

while IFS= read -r file; do
  owner=$(sed -n 's/^owner_id=//p' "$file")
  while IFS= read -r dependency; do
    grep -qx "$dependency" "$owners" || {
      printf 'unknown authority dependency: %s -> %s\n' "$owner" "$dependency" >&2
      exit 1
    }
    [[ $owner != "$dependency" ]] || exit 1
    printf '%s %s\n' "$owner" "$dependency" >>"$edges"
  done < <(sed -n 's/^depends_on=//p' "$file")
done < <(sapdp_registry_paths)

if [[ -s $edges ]]; then
  tsort "$edges" >/dev/null
fi
