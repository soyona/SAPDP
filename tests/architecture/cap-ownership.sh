#!/usr/bin/env bash

set -euo pipefail

file=protocol/repository-architecture.md

for number in $(seq -w 1 45); do
  cap="CAP-0${number}"
  [[ $(grep -c "^| ${cap} | \\(OWNED\\|RESERVED\\) |" "$file") -eq 1 ]] || {
    printf 'invalid CAP ownership: %s\n' "$cap" >&2
    exit 1
  }
done

grep -q '^| CAP-038 | RESERVED | none | none |$' "$file"
grep -q '^| CAP-042 | OWNED | goal-system | `protocol/modules/goal-system/runtime.md` |$' "$file"
grep -q '^| CAP-044 | OWNED | dna | `protocol/modules/dna/module.md` |$' "$file"
grep -q '^| CAP-045 | OWNED | repository | `protocol/repository-architecture.md` |$' "$file"
