#!/usr/bin/env bash

set -euo pipefail

expected_commit=32dd6381df7944588bccc58cd28715a44f072b07
expected_digest=f70546726f4f1d4e9721da841fd8c82d9617f278a01e917d9552c90ed6818775

[[ $(git rev-list -n 1 v4.0.0) == "$expected_commit" ]]
actual=$(
  git show v4.0.0:SAPDP.md |
    LC_ALL=C LC_CTYPE=C LANG=C shasum -a 256 |
    awk '{print $1}'
)
[[ $actual == "$expected_digest" ]]

grep -Fxq '# SAPDP v5.0.0 Protocol' SAPDP.md
grep -Fq 'mode=home|' SAPDP.md
grep -Fq 'mode=router|' SAPDP.md
grep -Fq 'structured=SAPDP followed by Goal: <goal>' SAPDP.md
grep -Fq 'literal=generic Add DNA without type|HUMAN_INPUT: Select DNA Type' SAPDP.md
grep -Fq 'AI-Assisted Solo Product Development Protocol' SAPDP.md

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
grep -Fq 'Only an immutable Git tag releases a version.' protocol/flows/protocol-evolution/design-freeze.md
