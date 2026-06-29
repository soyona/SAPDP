# SAPDP Protocol Evolution Design Freeze

> Immutable governance evidence for this candidate. This file is not current SAPDP runtime authority.

Status: FROZEN
Freeze Digest: sha256:9ae7b90da4176163f3eaf7e0af0fbdc5a5994c60aa80898046732efdb7581def

<!-- Frozen Payload Start -->
base_commit_sha=32dd6381df7944588bccc58cd28715a44f072b07
current_version=v4.0.0
target_version=v5.0.0
runtime_baseline_source_ref=v4.0.0
runtime_baseline_source_commit=32dd6381df7944588bccc58cd28715a44f072b07
runtime_baseline_digest=sha256:f70546726f4f1d4e9721da841fd8c82d9617f278a01e917d9552c90ed6818775
dependency_schema=sapdp-authority-dependency-v2
runtime_capsule_schema=sapdp-runtime-capsule-v1
context_schema=sapdp-context-v1
findings_snapshot_path=docs/history/protocol-evolution/v5.0.0/findings.md
findings_snapshot_digest=sha256:47e22c68f4097b0fc3b55efeffef57d77dfd4254ba792b12e3a79dfcc02c84b6
approved_behavior_change=Replace owner-only authority dependencies with exact kind, owner, and component tuples.
approved_behavior_change=Load Protocol Evolution core plus only the active stage authority and its exact dependency closure.
approved_behavior_change=Remove Protocol Evolution dependency on exact-copy Artifact Materialization.
approved_behavior_change=Add a repository-evolution Execution Governance profile for pre-candidate and candidate stages.
approved_behavior_change=Replace the non-authoritative Runtime Summary loading path with one bounded normative Runtime Capsule inside SAPDP.md.
approved_behavior_change=Add the read-only sapdp-context command with deterministic bounded output and failure codes.
approved_behavior_change=Persist local findings as an immutable Design Freeze findings snapshot.
approved_behavior_change=Enforce authority context byte budgets and deterministic script blocker codes.
frozen_file=.gitignore
frozen_file=AGENTS.md
frozen_file=CHANGELOG.md
frozen_file=DEVELOPER.md
frozen_file=SAPDP.md
frozen_file=docs/history/protocol-evolution/v5.0.0/design-freeze.md
frozen_file=docs/history/protocol-evolution/v5.0.0/findings.md
frozen_file=protocol/flows/bootstrap-validation.md
frozen_file=protocol/flows/bootstrap.md
frozen_file=protocol/flows/commit-audit.md
frozen_file=protocol/flows/product-development.md
frozen_file=protocol/flows/protocol-evolution.md
frozen_file=protocol/flows/protocol-evolution/design-audit.md
frozen_file=protocol/flows/protocol-evolution/design-freeze.md
frozen_file=protocol/flows/protocol-evolution/design.md
frozen_file=protocol/flows/protocol-evolution/evolution-definition.md
frozen_file=protocol/flows/protocol-evolution/materialization.md
frozen_file=protocol/flows/protocol-evolution/release.md
frozen_file=protocol/flows/protocol-evolution/repository-audit.md
frozen_file=protocol/modules/artifact-materialization/module.md
frozen_file=protocol/modules/artifact-materialization/runtime.md
frozen_file=protocol/modules/dna/flows/add-dna.md
frozen_file=protocol/modules/dna/module.md
frozen_file=protocol/modules/dna/runtime.md
frozen_file=protocol/modules/execution-governance/design.md
frozen_file=protocol/modules/execution-governance/module.md
frozen_file=protocol/modules/execution-governance/repository-evolution.md
frozen_file=protocol/modules/execution-governance/runtime.md
frozen_file=protocol/repository-architecture.md
frozen_file=scripts/lib/sapdp-validation.sh
frozen_file=scripts/sapdp-audit
frozen_file=scripts/sapdp-context
frozen_file=scripts/sapdp-materialize
frozen_file=scripts/sapdp-release
frozen_file=scripts/sapdp-validate
frozen_file=tests/architecture/authority-dependencies.sh
frozen_file=tests/architecture/authority-registry.sh
frozen_file=tests/architecture/repository-layout.sh
frozen_file=tests/compatibility/authority-migration-map.json
frozen_file=tests/compatibility/dependency-migration-v4.0.0.json
frozen_file=tests/compatibility/dependency-migration-v4.0.0.sh
frozen_file=tests/compatibility/runtime-baseline-v4.0.0.json
frozen_file=tests/compatibility/runtime-baseline-v4.0.0.sh
frozen_file=tests/compatibility/runtime-baseline.sh
frozen_file=tests/flows/protocol-evolution-stage-loading.sh
frozen_file=tests/flows/protocol-evolution.sh
frozen_file=tests/scripts/lib/test-repository.sh
frozen_file=tests/scripts/sapdp-audit.sh
frozen_file=tests/scripts/sapdp-context.sh
frozen_file=tests/scripts/sapdp-materialize.sh
frozen_file=tests/scripts/sapdp-release.sh
required_change=Set SAPDP.md version to v5.0.0 and make one Runtime Capsule the sole normative owner of compact invocation, routing, loading, output, precedence, and undefined-behavior records.
required_change=Update AGENTS.md to load the Runtime Capsule from FETCH_HEAD without emitting the complete SAPDP.md body and without changing silent loader behavior.
required_change=Register Protocol Evolution core, seven stage authorities, and the repository-evolution governance component with unique Registry tuples and Authority Metadata.
required_change=Define depends_on metadata as depends_on=<kind>|<owner-id>|<component-id> and migrate all seventeen v4.0.0 owner-only dependency records according to the frozen migration map.
required_change=Keep all non-Protocol-Evolution dependency closures behaviorally equivalent to their v4.0.0 owner expansion.
required_change=Keep the seven Protocol Evolution stages and move each stage contract into its registered stage authority without semantic loss.
required_change=Remove Protocol Evolution Artifact Materialization dependency and use repository-evolution governance closure rules with Base, Candidate, and Audited Commit references.
required_change=Add stage_authority=<stage-number>|flow|protocol-evolution|<component-id> records and reject missing, duplicate, conflicting, or cyclic stage closure.
required_change=Add scripts/sapdp-context with the exact sapdp-context-v1 invocation, ordered authority envelope, Git-ref reads, no repository writes, safe rerun behavior, and deterministic error or blocker codes.
required_change=Validate one Runtime Capsule marker pair, exact capsule schema, Authority Digest coverage, and no full-root fallback when the capsule is invalid.
required_change=Ignore engine/runtime while validating and committing the immutable findings snapshot path and raw-byte SHA-256 digest declared by this Freeze.
required_change=Enforce maximum sizes of 4096 bytes for Runtime Capsule, 3072 bytes for Protocol Evolution core, 4096 bytes per stage authority, and 16384 bytes for the Stage 1 context bundle.
required_change=Preserve Materialization, Audit, and Release public success invocations and outputs while making script precondition failures deterministic and consistent with the owning stage contracts.
required_change=Bind v4.0.0 compatibility tests to commit 32dd6381df7944588bccc58cd28715a44f072b07 and SAPDP.md digest f70546726f4f1d4e9721da841fd8c82d9617f278a01e917d9552c90ed6818775.
required_change=Update migration, architecture, flow, context, script integration, documentation, changelog, and byte-budget tests for the complete v5.0.0 behavior.
validation=./scripts/sapdp-validate
validation=bash -n scripts/lib/sapdp-validation.sh scripts/sapdp-context scripts/sapdp-materialize scripts/sapdp-audit scripts/sapdp-release scripts/sapdp-validate
validation=tests/architecture/authority-dependencies.sh
validation=tests/compatibility/dependency-migration-v4.0.0.sh
validation=tests/compatibility/runtime-baseline-v4.0.0.sh
validation=tests/flows/protocol-evolution-stage-loading.sh
validation=tests/scripts/sapdp-context.sh
validation=git diff --check
constraint=Do not change the seven Protocol Evolution stages or their execution environments.
constraint=Do not add SAPDP_RUNTIME.md or another root authority.
constraint=Do not change Home, Router, structured input, Commit URL success, Tag URL success, Git tag release, or audit-to-release commit binding behavior.
constraint=Do not narrow non-Protocol-Evolution legacy dependency closures during migration.
constraint=Do not make scripts decide semantic version, governance PASS, authority ownership, stage transitions, or finding disposition.
constraint=Do not load an invalid capsule by falling back to unbounded root text.
constraint=Do not source or evaluate Freeze payload values, use eval, force push, git add --all, path traversal, symlinks, or unregistered normative files.
constraint=Do not stage engine/runtime or unrelated working-tree changes.
constraint=All PE-001 through PE-011 findings remain RESOLVED in the immutable snapshot.
constraint=Materialization success output is the Commit URL only.
constraint=Release success output is the Tag URL only.
commit_message=Implement SAPDP v5.0.0 bounded authority loading
<!-- Frozen Payload End -->

Execution Method: Script

Invocation:

```bash
./scripts/sapdp-materialize \
  --freeze-file "docs/history/protocol-evolution/v5.0.0/design-freeze.md" \
  --expected-freeze-digest "sha256:9ae7b90da4176163f3eaf7e0af0fbdc5a5994c60aa80898046732efdb7581def"
```

Output:

Commit URL or Blocker
