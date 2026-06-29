# SAPDP Protocol Evolution Design Freeze

> Immutable governance evidence for this candidate. This file is not current SAPDP runtime authority.

Status: FROZEN
Freeze Digest: sha256:62d5a2d274dfb1ed80140ccab227bc2756ba093032b57ab22001b2c2b63f7aa3

<!-- Frozen Payload Start -->
base_commit_sha=5e70608c2b62b02a9f985e01eb965f4222e74385
current_version=v5.0.0
target_version=v5.0.0
runtime_baseline_source_ref=v4.0.0
runtime_baseline_source_commit=32dd6381df7944588bccc58cd28715a44f072b07
runtime_baseline_digest=sha256:f70546726f4f1d4e9721da841fd8c82d9617f278a01e917d9552c90ed6818775
dependency_schema=sapdp-authority-dependency-v2
runtime_capsule_schema=sapdp-runtime-capsule-v1
context_schema=sapdp-context-v1
findings_snapshot_path=docs/history/protocol-evolution/v5.0.0/findings.md
findings_snapshot_digest=sha256:86487ddccb9c7975f493102d40c8c7257de878765999432cfb0ae7efd836db74
approved_behavior_change=Repair Stage 1 context budget enforcement without changing approved v5.0.0 runtime behavior.
frozen_file=SAPDP.md
frozen_file=docs/history/protocol-evolution/v5.0.0/design-freeze.md
frozen_file=docs/history/protocol-evolution/v5.0.0/findings.md
frozen_file=protocol/flows/protocol-evolution.md
frozen_file=protocol/modules/execution-governance/repository-evolution.md
frozen_file=protocol/modules/execution-governance/runtime.md
frozen_file=scripts/lib/sapdp-validation.sh
frozen_file=tests/flows/protocol-evolution-stage-loading.sh
required_change=Reduce the real sapdp-context-v1 Protocol Evolution Stage 1 bundle from 17352 bytes to at most 16384 bytes by compacting only the frozen authority files without semantic loss.
required_change=Preserve all stage_authority records, exact dependency tuples, closure rules, findings rules, readiness behavior, and public interfaces from candidate 5e70608c2b62b02a9f985e01eb965f4222e74385.
required_change=Fix sapdp_validate_context_budgets so a failed size predicate remains failure after temporary-file cleanup.
required_change=Add a regression assertion that measures the real Stage 1 authority envelope and fails above 16384 bytes independently of cleanup behavior.
required_change=Update Authority Digest deterministically and keep the findings snapshot raw-byte digest consistent with this Freeze.
validation=./scripts/sapdp-validate
validation=bash -n scripts/lib/sapdp-validation.sh
validation=tests/flows/protocol-evolution-stage-loading.sh
validation=./scripts/sapdp-context --ref HEAD --flow protocol-evolution --stage 1
validation=git diff --check
constraint=Do not change v5.0.0 Home, Router, stage order, stage ownership, dependencies, script invocations, success outputs, compatibility baseline, or release binding.
constraint=Do not modify files outside Frozen Files or stage engine/runtime.
constraint=Do not raise or remove the 16384-byte Stage 1 context budget.
constraint=Do not weaken or bypass Authority Digest, Freeze Digest, findings digest, or validation.
constraint=All PE-001 through PE-012 findings remain RESOLVED in the immutable snapshot.
constraint=Materialization success output is the Commit URL only.
commit_message=Repair SAPDP v5.0.0 context budget enforcement
<!-- Frozen Payload End -->

Execution Method: Script

Invocation:

```bash
./scripts/sapdp-materialize \
  --freeze-file "docs/history/protocol-evolution/v5.0.0/design-freeze.md" \
  --expected-freeze-digest "sha256:62d5a2d274dfb1ed80140ccab227bc2756ba093032b57ab22001b2c2b63f7aa3"
```

Output:

Commit URL or Blocker
