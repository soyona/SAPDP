#!/usr/bin/env bash

set -euo pipefail

expected_commit=296ca7bf176df130b17a4cde34161f6c58332268
expected_digest=af6c78c9262bae542aa205f11b1943ca833f69365cfc8702115d5151a8ff2bcb

[[ $(git rev-list -n 1 v5.0.0) == "$expected_commit" ]]
actual=$(
  git show v5.0.0:SAPDP.md |
    LC_ALL=C LC_CTYPE=C LANG=C shasum -a 256 |
    awk '{print $1}'
)
[[ $actual == "$expected_digest" ]]

grep -Fxq '# SAPDP v7.0.0 Protocol' SAPDP.md
grep -qx 'authority_registry_location=SAPDP.md' SAPDP.md
grep -Fq 'mode=home|' SAPDP.md
grep -Fq 'mode=router|' SAPDP.md

for stage in \
  '1. Evolution Definition - ChatGPT' \
  '2. Design - ChatGPT' \
  '3. Design Audit - ChatGPT' \
  '4. Design Freeze - ChatGPT' \
  '5. Materialization - Codex' \
  '6. Repository Audit - ChatGPT' \
  '7. Release - Codex'
do
  grep -Fxq "$stage" protocol/flows/protocol-evolution.md
done

grep -Fq -- '--expected-freeze-digest' protocol/flows/protocol-evolution/materialization.md
grep -Fq -- '--commit "<candidate-sha>"' protocol/flows/protocol-evolution/repository-audit.md
grep -Fq -- '--audited-commit "<sha>"' protocol/flows/protocol-evolution/release.md
grep -Fq 'Print the Commit URL only.' protocol/flows/protocol-evolution/materialization.md
grep -Fq 'print the Tag URL only.' protocol/flows/protocol-evolution/release.md
grep -Fq 'Design Freeze PASS requires `design-freeze -> materialization`.' \
  protocol/flows/protocol-evolution/thread-handoff.md
