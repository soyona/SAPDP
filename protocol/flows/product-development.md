# Product Development Flow

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=product-development
component_id=main
schema=sapdp-authority-v1
depends_on=bootstrap
depends_on=execution-governance
depends_on=artifact-materialization
depends_on=dna
<!-- SAPDP Authority Metadata End -->

## Scope

Own new-product and continue-product execution from an initialized workspace through validated product release.

## Entry

- New Product uses Bootstrap and enters Problem when Bootstrap readiness passes.
- Continue Product reads committed Runtime State, Route Manifest, and artifacts before selecting the next action.
- New Feature enters Problem.
- Bug Fix enters Implementation Verification.
- Refactor enters Build.

Bootstrap is prerequisite work, not a lifecycle stage.

## Runtime Inputs

- Protocol version and source ref
- Product identity and repository
- Runtime State
- Route Manifest
- Artifact Index
- Existing committed artifacts
- Human decisions
- Git evidence

Conversation memory and historical research are not runtime state.

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

## General Stage Contract

Every stage defines:

- objective;
- required inputs;
- produced artifacts;
- owner and execution environment;
- validation and exit criteria;
- completion evidence;
- next action.

No committed, validated stage output means no transition when Git evidence is required.

## Problem

Define target users, observed problem, context, evidence, constraints, and non-goals. Do not prescribe a solution.

Output: Problem Definition.

## Solution

Define the proposed outcome and mechanism that addresses the approved Problem without expanding product scope.

Output: Solution Definition.

## DNA Selection

Consume approved Problem and Solution. Select exactly one Visual DNA and one Product DNA under the DNA Module Runtime.

Output:

- Selected Visual DNA and source ref
- Selected Product DNA and source ref
- Human selection evidence

Missing either selection blocks Product Representation.

## Product Representation

Describe the product's conceptual shape, actors, objects, relationships, major states, and experience model using the approved Problem, Solution, and selected DNA.

Output: Product Representation.

## Product Requirement

Define functional behavior, constraints, acceptance conditions, and traceability to the approved upstream artifacts.

Output: Product Requirement.

## UX Specification

Define end-to-end user flows, navigation, states, interactions, errors, empty states, and accessibility requirements.

UX Specification is mandatory. Missing it blocks MVP Definition and Build.

## Visual Design Specification

Translate approved Visual DNA and UX requirements into executable visual constraints.

It is required for Experience Products and whenever the Human requires visual quality, brand style, UI design, or visual consistency. Unknown applicability returns `BLOCKED`.

## MVP Definition

Define the smallest coherent product scope, included and excluded behavior, success conditions, and validation plan.

MVP Definition must not weaken approved Problem, Solution, requirement, UX, or required visual constraints.

## Task Package

Create implementation-ready tasks with exact artifact references, dependencies, constraints, acceptance checks, execution environment, and return contract.

## Build

Codex implements only the approved Task Package and repository state.

Required behavior:

- inspect current code and standard automation;
- preserve unrelated changes;
- modify only approved scope;
- run required tests;
- use explicit product Git scripts when available;
- return verifiable Git evidence.

Build must not redesign frozen product artifacts.

## Implementation Verification

Verify implementation against approved artifacts and constraints using repository evidence and executable tests.

Failure returns to Build.

## User Validation

Validate that the product creates the intended value for the target users under the approved MVP.

Failure returns to MVP Definition.

## Release

Product Release requires:

- Implementation Verification PASS;
- User Validation PASS;
- no unresolved release blocker;
- explicit release task;
- verifiable product repository evidence.

Codex executes the product release script or explicit repository-standard release command. Product release output follows the product repository contract and must not be confused with SAPDP protocol release.

## DNA Consumption

Selected Visual DNA and Selected Product DNA remain mandatory through Product Representation, Product Requirement, UX Specification, applicable Visual Design Specification, MVP Definition, Task Package, Build, Implementation Verification, and User Validation.

Product stages reference selected DNA; they do not redefine DNA schemas or library assets.

## Runtime State and Routing

A transition requires:

- Runtime State;
- Route Manifest;
- Stage Readiness PASS;
- required artifacts and decisions;
- required commit evidence.

Continue Product returns one next executable action when readiness passes and one blocker when it fails. It generates a new artifact only when the Human clearly requests execution.

Route Manifest and route cards may propose an action but do not own lifecycle transition.

## Artifact Rules

Artifacts are durable runtime memory. Every active artifact identifies:

- producer;
- consumer;
- status;
- source evidence;
- route role;
- next action when applicable.

Historical artifacts do not override current approved artifacts.

## Templates

Templates define non-authoritative artifact shape. The owning Flow or Module defines required behavior.

Current template families:

- Problem
- Solution
- Product Representation
- Product Requirement
- Technical Constraint
- UX Specification
- Visual Design Specification
- MVP Definition
- Task Package
- Implementation Verification
- User Validation
- Release Result
- Runtime State

## Human-AI Handoff

ChatGPT owns product interpretation, design, task definition, and governance audit. Codex owns repository inspection, materialization, implementation, test execution, and Git operations. Human owns product decisions, DNA selection, value validation, and explicit approvals.

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

Product repositories use explicit commit, verify, and release scripts when present. Bootstrap may create non-success `NOT_IMPLEMENTED` stubs when no implementation exists.

Missing required product Git automation outside Bootstrap returns:

```text
BLOCKED PRODUCT_GIT_SCRIPT_MISSING
```

No stub may fabricate a Commit URL, Tag URL, PASS, or release result.

## Compatibility Evidence

Protocol Evolution that changes Product Development authority must preserve executable assertions for:

- Bootstrap readiness, validation outcomes, and remote evidence;
- artifact materialization and Human-AI handoff contracts;
- stage order, ownership, required DNA consumption, and rework routes;
- Product Git blockers, Commit Audit, and Product Release gates.

The source ref, source commit, baseline digest, and assertion suite must be bound by the candidate Design Freeze. Passing assertions are required evidence; they do not authorize behavior absent from this Flow.

## Rework

- Problem defect returns to Problem.
- Solution defect returns to Solution.
- Missing or invalid DNA remains at DNA Selection.
- Downstream specification defect returns to its owning specification stage.
- Build verification failure returns to Build.
- User Validation failure returns to MVP Definition.
- Release environment failure remains at Release.

## Compatibility

The v4 authority migration does not change the thirteen stages, entry rules, rollback rules, product artifacts, DNA consumption requirements, or product Git behavior defined by v3.0.6.
