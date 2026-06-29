# SAPDP Protocol Evolution Design Freeze

> Immutable governance evidence for this candidate. This file is not current SAPDP runtime authority.

Status: FROZEN
Freeze Digest: sha256:b762b23bc013cf9833d9d402d5beecc50aec2f2982ab3e0e6d38bbe0fc1cf38a

<!-- Frozen Payload Start -->
base_commit_sha=a675e3603964e81c67eb661cb2ff579b5bc222e8
current_version=v6.0.0
target_version=v7.0.0
runtime_baseline_source_ref=v6.0.0
runtime_baseline_source_commit=a675e3603964e81c67eb661cb2ff579b5bc222e8
runtime_baseline_digest=sha256:611e39fa431e85771cdc86b954e1abd9e1404e6a14108a9cf8215a8f83f3db70
dependency_schema=sapdp-authority-dependency-v2
runtime_capsule_schema=sapdp-runtime-capsule-v1
context_schema=sapdp-context-v1
stage_schema=sapdp-product-stage-v1
lock_schema=sapdp-lock-v1
findings_snapshot_path=docs/history/protocol-evolution/v7.0.0/findings.md
findings_snapshot_digest=sha256:9bae51f9aa1eae9ba90fab4b5f080ea19d8ea83172b2ba7ff2e6e4b91a838b37
approved_behavior_change=Keep the thirteen Product Development stages, order, owners, rework routes, and complete content standards.
approved_behavior_change=Replace persisted Product Development state and route synchronization with a strict canonical artifact dependency chain.
approved_behavior_change=Make each committed stage conclusion artifact its closure evidence.
approved_behavior_change=Require every stage after Problem to bind the latest commit of its direct predecessor.
approved_behavior_change=Allow Human edits and additions that preserve the stage template and scope.
approved_behavior_change=Require independent DNA Selection and Visual Design Specification artifacts for every product.
approved_behavior_change=Represent non-UI Visual Design with explicit applicability, presentation rules, and non-applicability rationales.
approved_behavior_change=Integrate Technical Constraints into Product Requirement because Technical Constraint is not a lifecycle stage.
approved_behavior_change=Add explicit DNA Selection and Build Result templates.
approved_behavior_change=Add a read-only Product Development resolver with deterministic restart, stale-chain, rework, and completion behavior.
approved_behavior_change=Replace Product Bootstrap state, route, index, result, handoff, and protocol snapshot files with SAPDP.lock, stage templates, and an on-demand scaffold.
approved_behavior_change=Route new-product intent to Bootstrap and continue-product intent directly to Product Development.
approved_behavior_change=Remove Product Development direct and transitive Execution Governance dependencies.
approved_behavior_change=Allow standard non-destructive Git commands when a product-specific Git script is absent.
frozen_file=CHANGELOG.md
frozen_file=DEVELOPER.md
frozen_file=README.md
frozen_file=SAPDP.md
frozen_file=docs/history/protocol-evolution/v7.0.0/design-freeze.md
frozen_file=docs/history/protocol-evolution/v7.0.0/findings.md
frozen_file=engine/flows/bootstrap/ARTIFACT_INDEX_TEMPLATE.md
frozen_file=engine/flows/bootstrap/BOOTSTRAP.md
frozen_file=engine/flows/bootstrap/BOOTSTRAP_RESULT_Template.md
frozen_file=engine/flows/bootstrap/POST_BOOTSTRAP_ENTRY_Template.md
frozen_file=engine/flows/bootstrap/PROJECT_BOOTSTRAP_TEMPLATE.md
frozen_file=engine/flows/bootstrap/ROUTE_MANIFEST_TEMPLATE.md
frozen_file=engine/flows/bootstrap/bootstrap_manifest.json
frozen_file=protocol/flows/bootstrap-validation.md
frozen_file=protocol/flows/bootstrap.md
frozen_file=protocol/flows/product-development.md
frozen_file=protocol/modules/artifact-materialization/module.md
frozen_file=protocol/modules/artifact-materialization/runtime.md
frozen_file=protocol/modules/dna/module.md
frozen_file=protocol/modules/dna/runtime.md
frozen_file=protocol/modules/execution-governance/module.md
frozen_file=scripts/sapdp-product-next
frozen_file=scripts/sapdp-validate
frozen_file=templates/build/BuildResult_Template.md
frozen_file=templates/mvp/MVPDefinition_Template.md
frozen_file=templates/problem/ProblemDefinition_Template.md
frozen_file=templates/product/DNASelection_Template.md
frozen_file=templates/product/ProductRepresentation_Template.md
frozen_file=templates/product/ProductRequirement_Template.md
frozen_file=templates/product/TechnicalConstraint_Template.md
frozen_file=templates/product/UXSpecification_Template.md
frozen_file=templates/product/VisualDesignSpecification_Template.md
frozen_file=templates/release/ReleaseResult_Template.md
frozen_file=templates/solution/SolutionDefinition_Template.md
frozen_file=templates/state/PROJECT_STATE_TEMPLATE.md
frozen_file=templates/tasks/TaskPackage_Template.md
frozen_file=templates/validation/UserValidation_Template.md
frozen_file=templates/verification/ImplementationVerification_Template.md
frozen_file=tests/compatibility/authority-migration-map.json
frozen_file=tests/compatibility/dependency-migration-v4.0.0.json
frozen_file=tests/compatibility/runtime-baseline-v4.0.0.json
frozen_file=tests/compatibility/runtime-baseline-v4.0.0.sh
frozen_file=tests/compatibility/runtime-baseline-v5.0.0.json
frozen_file=tests/compatibility/runtime-baseline-v5.0.0.sh
frozen_file=tests/compatibility/runtime-baseline.json
frozen_file=tests/compatibility/runtime-baseline.sh
frozen_file=tests/flows/product-development.sh
required_change=Define the thirteen canonical Product Development output paths and a bounded sapdp-product-stage-v1 contract.
required_change=Validate direct predecessor artifact path and latest artifact commit before every transition.
required_change=Treat the stage artifact commit as closure and prohibit separate product transition, route, index, README, Closure Artifact, or Findings Registry updates.
required_change=Preserve all existing stage content sections while removing Required Load Set and Artifact Routing boilerplate from templates.
required_change=Create mandatory DNA Selection and Build Result templates and make Visual Design mandatory for UI and non-UI products.
required_change=Move Technical Constraints into Product Requirement and remove the non-stage Technical Constraint template.
required_change=Implement a read-only product resolver with exact canonical ordering, required heading validation, unresolved-placeholder detection, Git tracking, dirty-path detection, direct commit equality, result handling, tag validation, and deterministic next actions.
required_change=Cover normal progression, Human completion, missing content, restart, DNA, UI and non-UI Visual Design, upstream revision, Build rework, MVP rework, Release retry, migration, and maintenance baseline reuse in executable tests.
required_change=Reduce Bootstrap to SAPDP.lock, static README, stage templates, directories, and one local commit.
required_change=Delete obsolete Bootstrap state, route, index, result, handoff, protocol snapshot, and state-template implementation assets.
required_change=Remove Product Development direct and transitive dependencies on Execution Governance and Add DNA Flow.
required_change=Advance the protocol version to v7.0.0, update Authority Digest, changelog, developer guidance, compatibility baselines, and validation runner.
validation=tests/flows/product-development.sh
validation=tests/compatibility/runtime-baseline.sh
validation=tests/compatibility/runtime-baseline-v5.0.0.sh
validation=tests/compatibility/runtime-baseline-v4.0.0.sh
validation=tests/compatibility/dependency-migration-v4.0.0.sh
validation=tests/architecture/authority-dependencies.sh
validation=./scripts/sapdp-validate
validation=git diff --check
constraint=Do not add, remove, reorder, or rename Product Development stages.
constraint=Do not weaken any stage content standard.
constraint=Do not permit missing DNA Selection or Visual Design Specification artifacts.
constraint=Do not persist normal Product Development progress outside the owning stage artifact.
constraint=Do not require Execution Governance for Product Development directly or transitively.
constraint=Do not infer completion from file existence without schema, content, Git, predecessor, and result validation.
constraint=Do not delete stale downstream product evidence during rework.
constraint=Do not modify files outside Frozen Files or stage engine/runtime.
constraint=All PE7-001 through PE7-005 findings remain RESOLVED in the immutable snapshot.
commit_message=Simplify Product Development progression
execution_method=Frozen Materialization script
<!-- Frozen Payload End -->

Execution Method: Script

Invocation:

```bash
./scripts/sapdp-materialize \
  --freeze-file "docs/history/protocol-evolution/v7.0.0/design-freeze.md" \
  --expected-freeze-digest "sha256:b762b23bc013cf9833d9d402d5beecc50aec2f2982ab3e0e6d38bbe0fc1cf38a"
```

Output:

Commit URL only on success; otherwise one deterministic blocker.
