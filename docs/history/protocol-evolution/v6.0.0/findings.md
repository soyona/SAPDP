# SAPDP v6.0.0 Protocol Evolution Findings Snapshot

> Immutable candidate evidence. This file is not current SAPDP runtime authority.

Source Runtime Registry: `engine/runtime/protocol-evolution/findings.md`
Snapshot Status: ALL FINDINGS RESOLVED

finding_id:
PE-001

source_stage:
Evolution Definition

status:
RESOLVED

severity:
BLOCKER

finding:
Protocol Evolution did not resolve a current Runtime Findings Registry path.

evidence:
Human decision resolved engine/runtime/protocol-evolution/findings.md for this Evolution.

timestamp:
2026-06-28T14:38:12Z

---

finding_id:
PE-002

source_stage:
Evolution Definition

status:
RESOLVED

severity:
MAJOR

finding:
Authority dependencies identify owner IDs but do not select exact registered components.

evidence:
protocol/flows/protocol-evolution.md and protocol/repository-architecture.md

verification:
Revised Design defines depends_on as an exact kind, owner, and component tuple and enumerates legacy migration.

timestamp:
2026-06-28T14:38:12Z

---

finding_id:
PE-003

source_stage:
Evolution Definition

status:
RESOLVED

severity:
MAJOR

finding:
Artifact Materialization exact-copy constraints conflict with Protocol Evolution implementation work.

evidence:
protocol/modules/artifact-materialization/design.md and protocol/flows/protocol-evolution.md

verification:
Revised Design removes the Artifact Materialization dependency from Protocol Evolution.

timestamp:
2026-06-28T14:38:12Z

---

finding_id:
PE-004

source_stage:
Evolution Definition

status:
RESOLVED

severity:
MAJOR

finding:
Execution Governance requires product-workspace closure fields that Protocol Evolution does not define.

evidence:
protocol/modules/execution-governance/design.md and protocol/flows/protocol-evolution.md

verification:
Revised Design adds a repository-evolution governance profile with stage-specific commit references.

timestamp:
2026-06-28T14:38:12Z

---

finding_id:
PE-005

source_stage:
Evolution Definition

status:
RESOLVED

severity:
MAJOR

finding:
Protocol Evolution loads the complete root, flow, module packages, and repository architecture before stage-specific work.

evidence:
Measured authority closure is 36441 bytes and 4716 words before Freeze, scripts, and tests.

verification:
Revised Design defines stage-specific loading, a bounded Runtime Capsule, and enforceable byte budgets.

timestamp:
2026-06-28T14:38:12Z

---

finding_id:
PE-006

source_stage:
Design Audit

status:
RESOLVED

severity:
BLOCKER

finding:
The Design does not define the exact registry and metadata schema used to resolve stage-specific authority components.

evidence:
Design Decision 2 and Design Decision 3

verification:
Revised Design defines exact depends_on and stage_authority record schemas and blocker outputs.

timestamp:
2026-06-28T14:40:38Z

---

finding_id:
PE-007

source_stage:
Design Audit

status:
RESOLVED

severity:
BLOCKER

finding:
The normative Runtime Capsule content, integrity validation, and invalid-capsule behavior are not fully specified.

evidence:
Design Decision 7

verification:
Revised Design defines capsule ownership, marker uniqueness, blob binding, digest coverage, and no-fallback failure.

timestamp:
2026-06-28T14:40:38Z

---

finding_id:
PE-008

source_stage:
Design Audit

status:
RESOLVED

severity:
BLOCKER

finding:
The sapdp-context command lacks an exact output schema and deterministic failure contract.

evidence:
Design Decision 8

verification:
Revised Design defines the exact invocation, ordered output envelope, and deterministic failures.

timestamp:
2026-06-28T14:40:38Z

---

finding_id:
PE-009

source_stage:
Design Audit

status:
RESOLVED

severity:
BLOCKER

finding:
The Design does not define how ignored runtime findings become durable Design Freeze and audit evidence.

evidence:
Design Decisions 5 and 6

verification:
Revised Design defines an ignored runtime registry plus an immutable findings snapshot and digest in Design Freeze.

timestamp:
2026-06-28T14:40:38Z

---

finding_id:
PE-010

source_stage:
Design Audit

status:
RESOLVED

severity:
BLOCKER

finding:
The migration plan does not enumerate legacy dependency conversion or define the v4.0.0 runtime compatibility baseline.

evidence:
Design Decisions and Expected Impact Scope

verification:
Revised Design enumerates legacy dependency mappings and binds compatibility to v4.0.0 commit and file digest.

timestamp:
2026-06-28T14:40:38Z

---

finding_id:
PE-011

source_stage:
Materialization

status:
RESOLVED

severity:
BLOCKER

finding:
The Frozen Design declares sixteen v4.0.0 owner-only dependency records, but the source tag contains seventeen.

evidence:
git grep -n '^depends_on=' v4.0.0 -- protocol returns seventeen records.

verification:
The revised migration baseline and next Design Freeze require exactly seventeen source records.

timestamp:
2026-06-28T15:10:09Z

---

finding_id:
PE-012

source_stage:
Repository Audit

status:
RESOLVED

severity:
BLOCKER

finding:
The real Protocol Evolution Stage 1 context bundle exceeds the frozen 16384-byte limit, and the budget validator masks the failed size predicate.

evidence:
sapdp-context on candidate 5e70608c2b62b02a9f985e01eb965f4222e74385 returns BLOCKED STAGE_AUTHORITY_INVALID; the equivalent bundle is 17352 bytes.

verification:
The repair Freeze requires a bundle at or below 16384 bytes and preserves the failed predicate before temporary-file cleanup.

timestamp:
2026-06-29T01:14:34Z

---

finding_id:
PE-013

source_stage:
Design Audit

status:
RESOLVED

severity:
BLOCKER

finding:
The Design introduces scripts/sapdp-handoff without defining its exact render and validate invocations, ordered stdout, stderr codes, exit behavior, retry behavior, or interruption recovery.

evidence:
Approved Design sections 5 and 6 specify responsibilities and blocker names but no complete executable command contract.

verification:
Revised Design defines exact render and validate invocations, ordered output, deterministic errors, exit behavior, idempotence, and interruption recovery.

timestamp:
2026-06-29T02:30:14Z

---

finding_id:
PE-014

source_stage:
Design Audit

status:
RESOLVED

severity:
BLOCKER

finding:
The Design does not decide whether a Handoff Card is advisory or whether the source thread must stop, so runtime compatibility and the v5.1.0 semantic version classification are not verifiable.

evidence:
Approved Design defines deterministic handoff points but does not define same-thread continuation behavior.

verification:
Revised Design makes both handoff boundaries mandatory, stops the source thread, and classifies the required runtime contract change as MAJOR with Target Version v6.0.0.

timestamp:
2026-06-29T02:30:14Z

---

finding_id:
PE-015

source_stage:
Design Audit

status:
RESOLVED

severity:
MAJOR

finding:
originUrl alone does not define deterministic workspace selection when multiple current workspace roots use the same Git remote, and the Design does not define path precedence or fallback behavior.

evidence:
Codex App deep-link authority documents path precedence and originUrl matching but the Design emits only originUrl and prompt.

verification:
Revised Design requires path, originUrl, and prompt in the App deep link, derives path mechanically from the repository root, and retains portable CLI and IDE fallbacks.

timestamp:
2026-06-29T02:30:14Z

---

finding_id:
PE-016

source_stage:
Design Audit

status:
RESOLVED

severity:
MAJOR

finding:
The Design does not enumerate the complete affected file set, CAP ownership change, documentation migration, exact Handoff Prompt and Card byte budgets, or executable test commands and expected results.

evidence:
Approved Design provides categories and coverage goals but not a materialization-complete impact and validation manifest.

verification:
Revised Design enumerates Frozen Files, CAP-046 ownership, documentation migration, byte budgets, exact validation commands, and expected results.

timestamp:
2026-06-29T02:30:14Z

---

finding_id:
PE-017

source_stage:
Design Audit

status:
RESOLVED

severity:
BLOCKER

finding:
The Design does not define the bootstrap path for the first Design Freeze to Materialization handoff, which occurs before the new thread-handoff authority and scripts/sapdp-handoff exist in a committed candidate.

evidence:
At the v5.0.0 Base Commit, the Authority Registry has no thread-handoff component and the Design Freeze stage cannot invoke the proposed new renderer before Materialization commits it.

verification:
Revised Design defines a one-time v5.0.0 bootstrap handoff under the existing Execution Governance Handoff and frozen invocation contracts; the committed v6.0.0 candidate governs all later handoffs.

timestamp:
2026-06-29T02:33:16Z

---

finding_id:
PE-019

source_stage:
Materialization

status:
RESOLVED

severity:
BLOCKER

finding:
The v6.0.0 Design Freeze omitted the dependency_schema, runtime_capsule_schema, and context_schema values required by the v5.0.0 Materialization validator.

evidence:
The bootstrap Materialization thread returned BLOCKED SAPDP_MATERIALIZE_INVALID_DESIGN_FREEZE.

verification:
The revised Design Freeze includes dependency_schema=sapdp-authority-dependency-v2, runtime_capsule_schema=sapdp-runtime-capsule-v1, and context_schema=sapdp-context-v1 before recalculating both evidence digests.

timestamp:
2026-06-29T02:42:33Z

---

finding_id:
PE-018

source_stage:
Design Audit

status:
RESOLVED

severity:
MAJOR

finding:
The revised script contract still uses ERROR SAPDP_HANDOFF_<CODE> and BLOCKED SAPDP_HANDOFF_<CODE> placeholders without enumerating every allowed code and its deterministic validation priority.

evidence:
Revised Design defines the output families and one budget code but not the complete render and validate failure vocabulary.

verification:
Revised Design enumerates the complete ERROR and BLOCKED vocabularies, command applicability, validation priority, stdout and stderr behavior, and exit status.

timestamp:
2026-06-29T02:33:16Z

---

finding_id:
PE-020

source_stage:
Materialization

status:
RESOLVED

severity:
BLOCKER

finding:
The v5.0.0 Runtime Capsule does not declare a machine-readable Authority Registry location, so a fresh bounded-loader thread cannot resolve the Materialization authority without prohibited root-body fallback or repository scanning.

evidence:
The second bootstrap Materialization thread returned BLOCKED AUTHORITY_REGISTRY_LOCATION_MISSING.

verification:
Revised Design adds authority_registry_location=SAPDP.md to the v6.0.0 Runtime Capsule, validates the standard Registry marker pair from that same ref, and uses a one-time same-thread v5.0.0 Materialization bootstrap before the v6.0.0 candidate exists.

timestamp:
2026-06-29T02:46:49Z

---

finding_id:
PE-021

source_stage:
Materialization

status:
RESOLVED

severity:
BLOCKER

finding:
The Frozen Files omitted the v4.0.0 compatibility test whose current-version assertion must advance from v5.0.0 to v6.0.0.

evidence:
scripts/sapdp-validate failed at tests/compatibility/runtime-baseline-v4.0.0.sh because it required the v5.0.0 heading.

verification:
The revised Frozen Files include tests/compatibility/runtime-baseline-v4.0.0.sh and preserve its v4.0.0 source assertions while updating only the current protocol heading assertion.

timestamp:
2026-06-29T02:55:24Z
