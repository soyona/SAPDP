# SAPDP Protocol Evolution Design Freeze

> Immutable governance evidence for this candidate. This file is not current SAPDP runtime authority.

Status: FROZEN
Freeze Digest: sha256:0aae776ae515b2d25bd2f6ae124c4a87642251f954ed8d6a789c7376f36eef26

<!-- Frozen Payload Start -->
base_commit_sha=58d4f5e492fdf78cfc2d2bded9588fb37b428141
current_version=v3.0.6
target_version=v4.0.0
runtime_baseline_source_ref=v3.0.6
runtime_baseline_source_commit=6e5960e2b78b16e86892441af6033c29e0fe0397
runtime_baseline_digest=sha256:14827c81d26abf2b5661e87dc0032927713fe9565d031b38a0d28be0dda73f5c
approved_behavior_change=Replace single-file authority with SAPDP root authority plus registered Flow and Module authorities.
approved_behavior_change=Apply the thirteen audited Protocol Evolution correctness and recovery fixes.
approved_behavior_change=Replace conflicting Add DNA governance definitions with the approved seven-stage Add DNA flow.
frozen_file=SAPDP.md
frozen_file=docs/history/protocol-evolution/v4.0.0/design-freeze.md
frozen_file=protocol/flows/bootstrap-validation.md
frozen_file=protocol/flows/bootstrap.md
frozen_file=protocol/flows/product-development.md
frozen_file=protocol/repository-architecture.md
frozen_file=scripts/lib/sapdp-validation.sh
frozen_file=scripts/sapdp-audit
frozen_file=scripts/sapdp-materialize
frozen_file=scripts/sapdp-release
frozen_file=scripts/sapdp-validate
frozen_file=tests/compatibility/authority-migration-map.json
frozen_file=tests/compatibility/authority-migration-map.sh
frozen_file=tests/compatibility/runtime-baseline.json
frozen_file=tests/compatibility/runtime-baseline.sh
frozen_file=tests/scripts/lib/test-repository.sh
frozen_file=tests/scripts/sapdp-audit.sh
frozen_file=tests/scripts/sapdp-materialize.sh
frozen_file=tests/scripts/sapdp-release.sh
required_change=Restore the complete v3.0.6 Bootstrap validation contract as a registered Bootstrap validation authority without dropping validation criteria.
required_change=Expand Product Development and Runtime compatibility assertions to cover Bootstrap, artifact contracts, handoff, product Git, Commit Audit, and Release invariants.
required_change=Add a source-ref-bound authority migration map covering every v3.0.6 normative source and its v4 owner.
required_change=Add real temporary Git repository tests for Materialization push interruption and retry, Audit remote drift, and Release tag interruption and retry.
required_change=Modify protocol scripts only when required for the frozen integration scenarios and preserve their public v4 invocation contracts.
required_change=Update the Authority Registry, Authority Digest, repository architecture, and this Design Freeze evidence consistently.
validation=./scripts/sapdp-validate
validation=bash -n scripts/sapdp-materialize scripts/sapdp-audit scripts/sapdp-release scripts/sapdp-validate scripts/lib/sapdp-validation.sh tests/scripts/lib/test-repository.sh
validation=git diff --check
constraint=Do not change the Target Version or create a release tag.
constraint=Do not modify templates, library assets, historical DNA records, or unrelated Flow and Module authorities.
constraint=Do not change Product Development runtime behavior outside the previously approved behavior changes.
constraint=Do not weaken tests, bypass Authority Digest, or replace integration scenarios with static source checks.
constraint=Do not use force push, git add --all, eval, sourced Freeze payload, path traversal, or symlinks.
constraint=Materialization success output is the Commit URL only.
commit_message=Complete v4.0.0 audit remediation
<!-- Frozen Payload End -->

Execution Method: Script

Invocation:

```bash
./scripts/sapdp-materialize \
  --freeze-file "docs/history/protocol-evolution/v4.0.0/design-freeze.md" \
  --expected-freeze-digest "sha256:0aae776ae515b2d25bd2f6ae124c4a87642251f954ed8d6a789c7376f36eef26"
```

Output:

Commit URL or Blocker
