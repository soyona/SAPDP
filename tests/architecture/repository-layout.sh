#!/usr/bin/env bash

set -euo pipefail

grep -Fxq '/engine/runtime/' .gitignore

for file in protocol/flows/protocol-evolution/*.md; do
  [[ -f $file && ! -L $file ]]
done

allowed='
.github
.gitattributes
.gitignore
AGENTS.md
CHANGELOG.md
DEVELOPER.md
LICENSE
README.md
SAPDP.md
docs
engine
library
protocol
scripts
templates
tests
'

actual=$(mktemp)
expected=$(mktemp)
trap 'rm -f "$actual" "$expected"' EXIT

{
  git ls-files
  git ls-files --others --exclude-standard
} | awk -F/ '{print $1}' | LC_ALL=C sort -u >"$actual"
printf '%s\n' "$allowed" | sed '/^$/d' | LC_ALL=C sort -u >"$expected"

while IFS= read -r entry; do
  grep -qx "$entry" "$expected" || {
    printf 'unexpected repository root entry: %s\n' "$entry" >&2
    exit 1
  }
done <"$actual"

if find protocol engine docs scripts tests -type d \( -name misc -o -name common -o -name temp -o -name new \) | grep -q .; then
  printf 'prohibited catch-all directory exists\n' >&2
  exit 1
fi

if grep -RIl '^authority=normative$' engine scripts templates library tests docs | grep -q .; then
  printf 'normative authority exists outside SAPDP.md or protocol/\n' >&2
  exit 1
fi
