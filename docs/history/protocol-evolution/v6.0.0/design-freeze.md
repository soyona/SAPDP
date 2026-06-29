# SAPDP Protocol Evolution Design Freeze

> Immutable governance evidence for this candidate. This file is not current SAPDP runtime authority.

Status: FROZEN
Freeze Digest: sha256:ac6b27ccaab20b9d3033846c3f213671ba1906b538be3772dbf35135d5c8bdcb

<!-- Frozen Payload Start -->
base_commit_sha=296ca7bf176df130b17a4cde34161f6c58332268
current_version=v5.0.0
target_version=v6.0.0
runtime_baseline_source_ref=v5.0.0
runtime_baseline_source_commit=296ca7bf176df130b17a4cde34161f6c58332268
runtime_baseline_digest=sha256:af6c78c9262bae542aa205f11b1943ca833f69365cfc8702115d5151a8ff2bcb
dependency_schema=sapdp-authority-dependency-v2
runtime_capsule_schema=sapdp-runtime-capsule-v1
context_schema=sapdp-context-v1
handoff_schema=sapdp-thread-handoff-v1
findings_snapshot_path=docs/history/protocol-evolution/v6.0.0/findings.md
findings_snapshot_digest=sha256:e6b3b2810898b6bc7a05da038e11885a4e059628d81c9becf7facb587a9b9fea
approved_behavior_change=Require a new Materialization thread after Design Freeze PASS.
approved_behavior_change=Require a new Repository Audit thread after Materialization PASS.
approved_behavior_change=Keep Repository Audit PASS and Release in the same thread.
approved_behavior_change=Render a Codex App deep link with path, originUrl, and a URL-encoded self-contained prompt.
approved_behavior_change=Render CLI and IDE fallbacks with a complete self-contained prompt.
approved_behavior_change=Validate origin, protocol ref, HEAD, remote main, Freeze path and digest, Candidate Commit when present, and target-stage authority closure.
approved_behavior_change=Return only the first deterministic handoff error or blocker.
approved_behavior_change=Use a one-time same-thread v5.0.0 Materialization bootstrap before the v6.0.0 handoff authority, renderer, and registry-location record exist in a committed candidate.
approved_behavior_change=Declare authority_registry_location=SAPDP.md in the Runtime Capsule so bounded loaders can resolve the same-ref Authority Registry without root-body fallback or repository scanning.
approved_behavior_change=Preserve existing Materialization, Audit, and Release script stdout contracts.
approved_behavior_change=Keep staged authority loading and all v5.0.0 context budgets.
frozen_file=CHANGELOG.md
frozen_file=DEVELOPER.md
frozen_file=SAPDP.md
frozen_file=docs/history/protocol-evolution/v6.0.0/design-freeze.md
frozen_file=docs/history/protocol-evolution/v6.0.0/findings.md
frozen_file=protocol/flows/protocol-evolution/design-freeze.md
frozen_file=protocol/flows/protocol-evolution/materialization.md
frozen_file=protocol/flows/protocol-evolution/repository-audit.md
frozen_file=protocol/flows/protocol-evolution/thread-handoff.md
frozen_file=protocol/repository-architecture.md
frozen_file=scripts/sapdp-handoff
frozen_file=scripts/sapdp-validate
frozen_file=tests/architecture/cap-ownership.sh
frozen_file=tests/compatibility/runtime-baseline-v4.0.0.sh
frozen_file=tests/compatibility/runtime-baseline-v5.0.0.json
frozen_file=tests/compatibility/runtime-baseline-v5.0.0.sh
frozen_file=tests/compatibility/runtime-baseline.json
frozen_file=tests/compatibility/runtime-baseline.sh
frozen_file=tests/flows/protocol-evolution-stage-loading.sh
frozen_file=tests/flows/protocol-evolution-thread-handoff.sh
frozen_file=tests/flows/protocol-evolution.sh
frozen_file=tests/scripts/lib/test-repository.sh
frozen_file=tests/scripts/sapdp-handoff.sh
required_change=Register flow|protocol-evolution|thread-handoff as the sole Protocol Evolution thread-handoff authority and include it in Authority Digest.
required_change=Add authority_registry_location=SAPDP.md to the Runtime Capsule and validate exactly one standard Authority Registry marker pair at that same Git ref.
required_change=Add CAP-046 owned by protocol-evolution at protocol/flows/protocol-evolution/thread-handoff.md and validate CAP-001 through CAP-046 exactly once.
required_change=Define the exact sapdp-thread-handoff-v1 record order, allowed transitions, fixed task and output values, App Card, CLI fallback, IDE fallback, mandatory source-thread stop, retry behavior, and one-blocker validation priority.
required_change=Make Design Freeze, Materialization, and Repository Audit depend on the registered thread-handoff component and implement their exact outgoing or incoming boundary behavior.
required_change=Implement scripts/sapdp-handoff render and validate with exact arguments, pure idempotent behavior, deterministic stdout, the frozen ERROR and BLOCKED vocabularies, and no repository mutation.
required_change=Use UTF-8 RFC 3986 encoding with uppercase percent octets and generate codex://threads/new with path, originUrl, and prompt in that order.
required_change=Enforce raw-byte limits of 4096 for thread-handoff authority, 2048 for the canonical prompt, 6144 for the encoded deep link, 8192 for the complete Handoff Card, and 16384 for the existing Stage 1 context bundle.
required_change=Preserve sapdp-materialize Commit URL only success stdout, sapdp-audit PASS success stdout, and sapdp-release Tag URL only success stdout.
required_change=Add the v5.0.0 compatibility baseline and declare the mandatory thread boundary as the intentional v6.0.0 breaking runtime change while preserving all unrelated v5.0.0 behavior.
required_change=Preserve the v4.0.0 compatibility baseline while advancing its current protocol heading assertion to v6.0.0.
required_change=Document Codex App, CLI, and IDE handoff usage and the one-time v5.0.0 bootstrap path.
required_change=Update SAPDP version, Authority Registry, Authority Digest, changelog, validation runner, and all frozen tests.
validation=tests/architecture/cap-ownership.sh
validation=tests/compatibility/runtime-baseline.sh
validation=tests/compatibility/runtime-baseline-v5.0.0.sh
validation=tests/flows/protocol-evolution.sh
validation=tests/flows/protocol-evolution-stage-loading.sh
validation=tests/flows/protocol-evolution-thread-handoff.sh
validation=tests/scripts/sapdp-handoff.sh
validation=tests/scripts/sapdp-materialize.sh
validation=tests/scripts/sapdp-audit.sh
validation=tests/scripts/sapdp-release.sh
validation=./scripts/sapdp-context --ref HEAD --flow protocol-evolution --stage 1
validation=./scripts/sapdp-validate
validation=git diff --check
constraint=Do not add, remove, reorder, or rename Protocol Evolution stages.
constraint=Do not add a Flow, Module, root authority, root entry, or context-percentage transition.
constraint=Do not let scripts choose design, governance, version, stage transition, or finding disposition.
constraint=Do not copy authority documents into a Handoff Prompt; pass only exact identifiers, paths, digests, task, and output.
constraint=Do not change existing sapdp-materialize, sapdp-audit, or sapdp-release invocations or stdout contracts.
constraint=Do not load thread-handoff authority into the Stage 1 closure or raise any v5.0.0 context budget.
constraint=Do not modify files outside Frozen Files or stage engine/runtime.
constraint=All PE-001 through PE-021 findings remain RESOLVED in the immutable snapshot.
constraint=The v5.0.0 bootstrap runs Materialization once in the current thread, is migration evidence only, and must not create a second long-term authority or schema.
commit_message=Add deterministic Protocol Evolution thread handoffs
execution_method=One-time same-thread frozen Materialization script
<!-- Frozen Payload End -->

Execution Method: One-time same-thread Script

Invocation:

```bash
./scripts/sapdp-materialize \
  --freeze-file "docs/history/protocol-evolution/v6.0.0/design-freeze.md" \
  --expected-freeze-digest "sha256:ac6b27ccaab20b9d3033846c3f213671ba1906b538be3772dbf35135d5c8bdcb"
```

Output:

Commit URL only on success; otherwise one deterministic blocker.
