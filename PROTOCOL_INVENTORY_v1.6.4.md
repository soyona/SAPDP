# SAPDP v1.6.4 Protocol Capability Inventory

| ID | Name | Source file | Required in v2 | One-line description |
| --- | --- | --- | --- | --- |
| CAP-001 | Invocation and Load Entry | START.md | YES | Defines SAPDP startup prompts, product mode, protocol evolution mode, and beginning source files. |
| CAP-002 | Protocol Version Resolution | START.md | YES | Resolves omitted or `latest` protocol versions to a concrete stable Git tag during Bootstrap. |
| CAP-003 | Token-Minimal Runtime | START.md | YES | Makes compressed execution the default and restricts Continue/Next output to `NEXT_ACTION`. |
| CAP-004 | Product Bootstrap Entry | engine/bootstrap/BOOTSTRAP.md | YES | Gives Codex the required Bootstrap reading order, command shape, outputs, and stop point. |
| CAP-005 | Bootstrap Contract | engine/contracts/BootstrapContract.md | YES | Defines Bootstrap responsibilities, inputs, outputs, execution steps, forbidden actions, and stop conditions. |
| CAP-006 | Bootstrap Validation Contract | engine/contracts/BootstrapValidationContract.md | YES | Defines authoritative PASS, PATCH REQUIRED, and FAIL rules for Project Bootstrap. |
| CAP-007 | Bootstrap Manifest Configuration | engine/bootstrap/bootstrap_manifest.json | YES | Lists required scaffold directories, files, templates, validation rule IDs, authorities, and initial runtime state. |
| CAP-008 | Project Initialization Scaffold | engine/contracts/BootstrapContract.md | YES | Initializes a SAPDP-compatible product workspace without creating lifecycle or implementation artifacts. |
| CAP-009 | Bootstrap Idempotency | engine/contracts/BootstrapContract.md | YES | Prevents destructive re-bootstrap behavior and blocks unsafe overwrites or preexisting product state. |
| CAP-010 | Protocol Snapshot Strategy | engine/contracts/BootstrapContract.md | YES | Requires copied protocol snapshot plus source commit hash instead of live protocol dependency. |
| CAP-011 | Lifecycle State Authority | templates/state/PROJECT_STATE_TEMPLATE.md | YES | Makes `PROJECT_STATE.md` authoritative for protocol version, current stage, next action, blockers, and commits. |
| CAP-012 | Current Stage Recovery | START.md | YES | Recovers current stage from `PROJECT_STATE.md` and bootstrap route artifacts rather than conversation memory. |
| CAP-013 | Next Action Recovery | START.md | YES | Recovers executable next action from `ROUTE_MANIFEST.md`, Route Card, or `POST_BOOTSTRAP_ENTRY.md`. |
| CAP-014 | Transition Contract | engine/SAPDP_LIFECYCLE.md | YES | Requires state, artifact, and commit checks before any lifecycle progression. |
| CAP-015 | Commit-Gated Lifecycle | engine/SAPDP_LIFECYCLE.md | YES | Enforces `No Commit -> No Transition` for completed lifecycle stages. |
| CAP-016 | Lifecycle Stage Set | engine/SAPDP_LIFECYCLE.md | YES | Defines the product lifecycle from Problem through Release. |
| CAP-017 | Lifecycle Entry and Rollback Rules | engine/SAPDP_LIFECYCLE.md | YES | Defines entry types and the only allowed rollback paths for verification or validation failure. |
| CAP-018 | Stage Definitions | engine/SAPDP_LIFECYCLE.md | YES | Defines each stage objective, inputs, outputs, owner, exit criteria, and completion action. |
| CAP-019 | Route Card | engine/SAPDP_LIFECYCLE.md | YES | Requires a compact handoff contract after each product lifecycle stage completion. |
| CAP-020 | Route Manifest | engine/bootstrap/ROUTE_MANIFEST_TEMPLATE.md | YES | Persists compact routing metadata for recovery without owning lifecycle state or artifact discovery. |
| CAP-021 | ChatGPT to Codex Handoff | engine/SAPDP_CANONICAL_PROTOCOL.md | YES | Defines compact Codex task packages and required source artifact or commit URL. |
| CAP-022 | Codex to ChatGPT Handoff | engine/SAPDP_CANONICAL_PROTOCOL.md | YES | Defines minimal Codex return fields: result, files, commit, and state. |
| CAP-023 | ChatGPT Project and Session Routing | engine/SAPDP_CANONICAL_PROTOCOL.md | YES | Defines product project/session routing, including NEW, CURRENT, and REUSE_EXISTING behavior. |
| CAP-024 | Human and Git Exception Handoff | engine/SAPDP_CANONICAL_PROTOCOL.md | YES | Requires explicit exception actions when the next environment is Human or Git. |
| CAP-025 | Artifact Discovery Index | engine/bootstrap/ARTIFACT_INDEX_TEMPLATE.md | YES | Provides the authoritative artifact registry for discovery, navigation, load sets, and continuity. |
| CAP-026 | Artifact Routing Blocks | engine/SAPDP_CANONICAL_PROTOCOL.md | YES | Requires every artifact template to expose route metadata without redefining lifecycle rules. |
| CAP-027 | Artifact Templates | templates/problem/ProblemDefinition_Template.md | YES | Provides stage artifact formats and required load sets for product lifecycle execution. |
| CAP-028 | Product Shape Layer | engine/SAPDP_CANONICAL_PROTOCOL.md | YES | Adds Product Representation, Product Requirement, UX Specification, and conditional Visual Design before MVP. |
| CAP-029 | Task Package Format | templates/tasks/TaskPackage_Template.md | YES | Defines compact Codex-executable implementation packages with inputs, scope, acceptance, and output. |
| CAP-030 | Implementation Verification | templates/verification/ImplementationVerification_Template.md | YES | Verifies committed implementation against approved artifacts before User Validation. |
| CAP-031 | User Validation | templates/validation/UserValidation_Template.md | YES | Records Human validation result and routes PASS to Release or issues to ChatGPT/Codex. |
| CAP-032 | Product Release Result | templates/release/ReleaseResult_Template.md | YES | Records final product release decision and lifecycle closure input. |
| CAP-033 | Protocol Release Audit | README.md | YES | Requires remote commit and tag verification before protocol release PASS. |
| CAP-034 | Protocol Evolution Lifecycle | engine/SAPDP_CANONICAL_PROTOCOL.md | YES | Defines the separate governance route for protocol upgrades without changing product workflow. |
| CAP-035 | Git-First Audit Memory | engine/SAPDP_CANONICAL_PROTOCOL.md | YES | Makes committed Git state and commit URLs the preferred audit source over pasted files. |
| CAP-036 | MUST/STOP/PASS/FAIL Rules | engine/contracts/BootstrapValidationContract.md | YES | Defines required validation outcomes, stop behavior, hidden internal states, and failure boundaries. |
| CAP-037 | Lifecycle Progress UI | engine/contracts/BootstrapValidationContract.md | REVIEW_REQUIRED | Validates a canonical progress display, but its necessity in v2 runtime may depend on UI goals. |
| CAP-038 | Decision Log Governance | internal/SAPDP_DECISION_LOG.md | REVIEW_REQUIRED | Preserves append-only protocol decisions and is loaded by many templates, but may be governance rather than runtime. |
| CAP-039 | Problem Baseline Governance | internal/SAPDP_PROBLEM_BASELINE.md | REVIEW_REQUIRED | Preserves validated problems for future proposals, but is not directly required for normal runtime execution. |
| CAP-040 | Foundation and Goals Records | internal/SAPDP_FOUNDATION.md | REVIEW_REQUIRED | Defines canonical scope and goals, but v2 may only need distilled constraints rather than full records. |
| CAP-041 | Historical Bootstrap Runtime Context | engine/SAPDP_BOOTSTRAP.md | NO | Preserves old bootstrap state and release history explicitly marked historical runtime context. |
| CAP-042 | Historical Research Sequence | engine/SAPDP_BOOTSTRAP.md | NO | Records v1 research path for traceability only and states it is not runtime state. |
| CAP-043 | Product Marketing Overview | README.md | NO | Describes why SAPDP exists and who should use it, but does not define runtime capability. |
