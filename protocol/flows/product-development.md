# Product Development Flow

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=product-development
component_id=main
schema=sapdp-authority-v1
depends_on=module|artifact-materialization|design
depends_on=module|artifact-materialization|entry
depends_on=module|artifact-materialization|runtime
depends_on=module|dna|design
depends_on=module|dna|entry
depends_on=module|dna|runtime
<!-- SAPDP Authority Metadata End -->

## Scope

Own new-product and continue-product execution from an initialized workspace
through validated product release.

Product Development is a strict artifact dependency chain, not a persisted
lifecycle state machine.

## Entry

- New Product enters only after Bootstrap PASS and begins at Problem.
- Continue Product scans committed stage artifacts in canonical order and
  returns the first missing, incomplete, uncommitted, failed, or stale stage.
- New Feature begins at Problem and uses the current released product as its
  baseline.
- Bug Fix reuses the approved upstream chain and begins at Build.
- Refactor reuses the approved upstream chain and begins at Build.

Bootstrap is prerequisite work, not a lifecycle stage.

## Runtime Inputs

- `SAPDP.lock`
- product identity and repository
- committed stage artifacts
- direct predecessor commit evidence
- Human decisions
- Git and test evidence

Conversation memory, README text, generated progress views, and historical
artifacts are not runtime state.

`PROJECT_STATE.md`, `ROUTE_MANIFEST.md`, and `ARTIFACT_INDEX.md` are not Product
Development inputs and must not be created or updated for stage progression.

## Lifecycle

1. Problem - ChatGPT
2. Solution - ChatGPT
3. DNA Selection - Human + ChatGPT
4. Product Representation - ChatGPT
5. Product Requirement - ChatGPT
6. UX Specification - ChatGPT
7. Visual Design Specification - ChatGPT
8. MVP Definition - ChatGPT
9. Task Package - ChatGPT
10. Build - Codex
11. Implementation Verification - ChatGPT + Codex evidence
12. User Validation - Human + ChatGPT
13. Release - Codex after approval

The stage count and order must not change without Protocol Evolution.

## Canonical Outputs

| Stage | Conclusion artifact |
| --- | --- |
| Problem | `docs/problem/ProblemDefinition_CORE_v1.md` |
| Solution | `docs/solution/SolutionDefinition_CORE_v1.md` |
| DNA Selection | `docs/product/DNASelection_CORE_v1.md` |
| Product Representation | `docs/product/ProductRepresentation_CORE_v1.md` |
| Product Requirement | `docs/product/ProductRequirement_CORE_v1.md` |
| UX Specification | `docs/product/UXSpecification_CORE_v1.md` |
| Visual Design Specification | `docs/product/VisualDesignSpecification_CORE_v1.md` |
| MVP Definition | `docs/mvp/MVPDefinition_CORE_v1.md` |
| Task Package | `docs/tasks/TaskPackage_CORE_v1.md` |
| Build | `docs/build/BuildResult_CORE_v1.md` |
| Implementation Verification | `docs/verification/ImplementationVerification_CORE_v1.md` |
| User Validation | `docs/validation/UserValidation_CORE_v1.md` |
| Release | `docs/release/ReleaseResult_CORE_v1.md` plus Git tag |

Technical constraints are part of Product Requirement. They are not a separate
lifecycle stage or transition.

## Stage Artifact Contract

Every conclusion artifact contains exactly one bounded contract:

```text
<!-- SAPDP Stage Contract Start -->
stage_schema=sapdp-product-stage-v1
stage=<canonical stage name>
input_artifact=<canonical predecessor path or HUMAN_INPUT>
input_commit=<40-lowercase-hex or NOT_APPLICABLE>
conclusion_status=<stage-valid status>
<!-- SAPDP Stage Contract End -->
```

Rules:

- Problem uses `HUMAN_INPUT` and `NOT_APPLICABLE`.
- Every later stage names only its direct predecessor.
- `input_commit` equals the latest committed revision of that predecessor.
- Problem through Build use `COMPLETE`.
- Implementation Verification and User Validation use `PASS` or `FAIL`.
- Release uses `COMPLETE` or `FAIL`.
- The contract is runtime metadata inside the owning product artifact; it does
  not create a separate state artifact.
- The artifact body must satisfy the complete matching template.
- Human edits and additions are allowed when they preserve the template,
  evidence boundaries, and stage scope.

## Completion and Progression

A stage is complete only when:

1. its canonical conclusion artifact exists;
2. its Stage Contract is valid;
3. all required template sections are present and complete;
4. the artifact is tracked and has no uncommitted changes;
5. its direct predecessor is complete;
6. its `input_commit` matches the predecessor's latest artifact commit; and
7. its stage-valid conclusion status permits progression.

The artifact commit is the stage closure evidence. The Human or Codex may
create the commit. A separate transition commit, Closure Artifact, Findings
Registry update, route update, index update, README update, or state update is
prohibited.

Local commit evidence is sufficient for Problem through User Validation.
Release verifies the repository remote and tag under the repository-standard
release command.

`Continue Product` checks stages in canonical order and returns exactly the
first executable action or blocker. It does not write progress state.

## Stale Dependency Rule

If an upstream artifact receives a new commit, its direct consumer becomes
stale when `input_commit` no longer matches. That consumer and every transitive
downstream result are non-current until revalidated in order.

Stale artifacts remain in Git as historical evidence. They are not deleted and
do not override the earliest stale stage.

## Stage Contracts

### Problem

Define target users, observed problem, context, evidence, constraints,
non-goals, success criteria, assumptions, and acceptance criteria. Do not
prescribe a solution.

### Solution

Consume the committed Problem conclusion. Define the proposed outcome,
mechanism, vision, strategy, principles, boundaries, constraints, assumptions,
success definition, and acceptance criteria without expanding Problem scope.

### DNA Selection

Consume the committed Solution conclusion. Record exactly one Selected Visual
DNA and one Selected Product DNA, their source refs, selection rationale, and
Human decision evidence. Missing either selection blocks Product
Representation.

### Product Representation

Consume the committed DNA Selection conclusion. Define the product overview,
actors, objects, structure, relationships, major states, core user flows,
functional domains, information structure, external interfaces, boundaries,
assumptions, and acceptance criteria.

### Product Requirement

Consume the committed Product Representation conclusion. Define target users,
problems, goals, required capabilities, functional behavior, technical and
product constraints, success metrics, traceability, boundaries, assumptions,
and acceptance criteria.

### UX Specification

Consume the committed Product Requirement conclusion. Define user profiles,
journeys, flows, interactions, navigation, feedback, errors, empty states,
accessibility, constraints, and acceptance criteria.

### Visual Design Specification

Consume the committed UX Specification conclusion. This stage and artifact are
mandatory for every product.

The artifact records the selected Visual DNA, applicability, visual goals,
principles, style, color, typography, layout, components, iconography, imagery,
consistency, accessibility, and acceptance criteria. A non-UI product uses
`Applicability: Non-UI Product`, supplies applicable terminal, text, or output
presentation rules, and gives a rationale for each non-applicable visual
section. An empty or omitted section is invalid.

### MVP Definition

Consume the committed Visual Design Specification conclusion. Define the
smallest coherent scope, validation goal, success criteria, included and
excluded behavior, constraints, metrics, release readiness, assumptions, and
acceptance criteria.

### Task Package

Consume the committed MVP Definition conclusion. Define implementation-ready
tasks, exact artifact references, dependencies, constraints, acceptance
checks, execution environment, validation commands, and return contract.

### Build

Consume the committed Task Package conclusion. Implement only its approved
scope, preserve unrelated changes, run required tests, and record the
implementation commit, changed paths, commands, results, remaining issues, and
scope conformance in Build Result.

Build must not redesign approved product artifacts.

### Implementation Verification

Consume the committed Build Result conclusion. Verify implementation against
the Task Package and approved upstream chain using repository evidence and
executable tests. `FAIL` returns to Build.

### User Validation

Consume the committed Implementation Verification `PASS` conclusion. Record
validation environment, participants, feedback, observed behavior, goal
achievement, problem resolution, findings, required actions, and decision.
`FAIL` returns to MVP Definition.

### Release

Consume the committed User Validation `PASS` conclusion. Release requires
explicit Human approval, no unresolved blocker, verifiable repository
evidence, a release result, and a Git tag. Environment failure remains at
Release.

## Direct Loading

Normal stage execution loads only:

- this Flow;
- the current stage template;
- the direct predecessor conclusion artifact;
- explicitly referenced sections or evidence;
- relevant source, diff, and tests for Build or verification.

It must not load all historical artifacts, all templates, README, route files,
index files, or persisted progress state by default.

Selected DNA is consumed through the committed chain and explicit references;
stages do not reconstruct or redefine DNA assets.

## Human-AI Handoff

ChatGPT owns product interpretation and artifact design. Codex owns repository
inspection, exact materialization, implementation, and test execution. Human
owns product decisions, DNA selection, value validation, approval, and may
edit any stage artifact within its standard.

Every Codex task includes:

```text
Execution Method:
Invocation:
Inputs:
Constraints:
Validation:
Output:
```

## Product Git Runtime

Product repositories may use explicit scripts when present. Otherwise Codex
uses standard non-destructive repository commands and the Task Package
validation commands.

Missing product-specific Git automation is not a blocker by itself. Fabricated
commit, test, tag, PASS, or release evidence is prohibited.

## Executable Progress Check

The reference resolver is:

```bash
./scripts/sapdp-product-next --project-root "<product-repository>"
```

It is read-only. It checks canonical paths, Stage Contracts, required headings,
Git tracking, uncommitted artifact changes, predecessor commit equality,
stage-valid results, rework routes, and release tag evidence.

## Rework

- Problem defect returns to Problem.
- Solution defect returns to Solution.
- Missing or invalid DNA remains at DNA Selection.
- A stale direct input returns to the earliest stale stage.
- Downstream specification defect returns to its owning stage.
- Implementation Verification `FAIL` returns to Build.
- User Validation `FAIL` returns to MVP Definition.
- Release `FAIL` or environment failure remains at Release.

Rework produces a new artifact commit at the owning stage. Direct predecessor
commit validation then propagates revalidation through downstream stages.

## Required Scenario Coverage

Executable tests must cover:

- normal new-product progression through all thirteen stages;
- Human completion of a partially authored artifact;
- missing required content;
- continuation in a new session without conversation state;
- mandatory DNA Selection;
- mandatory Visual Design for UI and non-UI products;
- upstream revision and transitive stale detection;
- Implementation Verification failure returning to Build;
- User Validation failure returning to MVP Definition;
- Release failure remaining at Release; and
- Bug Fix and Refactor reuse of a valid upstream baseline.

## Compatibility

This runtime replaces persisted Product Development state and routing. Existing
product repositories require one migration that adds Stage Contracts and
direct predecessor commit references to active artifacts. Legacy state, route,
index, and dynamic README content become non-authoritative and are not updated.
