# SAPDP v2.5.1 Protocol

SAPDP is a platform-neutral protocol for one Human working with AI and Git to move from idea to validated product release with low context cost, explicit state, and verifiable handoffs.

Runtime constraints:
- Product work must be driven by explicit artifacts, not conversation memory.
- Git is the durable audit source.
- Historical research records are not runtime authority.
- Problem, purpose, scope, and goals must be distilled into current runtime constraints before they affect execution.

Protocol Version Authority Rule:
- `SAPDP.md` is the single protocol version authority.
- The protocol version is the version declared in the first heading of `SAPDP.md`.
- Other protocol files, manifests, templates, contracts, release notes, and runtime artifacts must not independently own or redefine the protocol version.
- When another file must display or persist a protocol version, it must derive that value from `SAPDP.md` or from the resolved Git ref that points to `SAPDP.md`.
- Any conflicting current protocol version identifier outside `SAPDP.md` is invalid and must be repaired before release.

Authority Override Principle:

For SAPDP work, current protocol authority always overrides:
- historical understanding
- session assumptions
- prior protocol knowledge

When a conflict exists, the current protocol authority must be treated as the source of truth.

## 1. Invocation

Coverage: CAP-001, CAP-040.

Default startup format:

```text
SAPDP

Goal: <goal>
```

Examples:

```text
SAPDP

Goal:
Build Student Typing Practice
```

```text
SAPDP

Goal:
Continue TOBY
```

```text
SAPDP

Goal:
Upgrade SAPDP
```

SAPDP starts in one of two modes:
- Product Development mode initializes or resumes a product workspace.
- Protocol Evolution mode starts or resumes a protocol upgrade route.

Startup routing rules:
- Goal starts with `Build` -> Bootstrap.
- Goal starts with `Continue` -> Continue Lifecycle.
- Goal starts with `Upgrade SAPDP` -> Protocol Evolution.

Routing uses the normalized first words of `Goal`, after trimming whitespace. If no routing rule matches, request one Human clarification instead of inferring a route.

Internal protocol metadata:
- Protocol Repo
- Protocol Version
- Protocol Entry

Users are not required to provide internal protocol metadata. Runtime tooling may resolve, pin, and record these fields as internal protocol state.

Backward-compatible invocation input may include:
- Protocol Repo
- Protocol Version
- Protocol Entry
- Project name
- Mode
- Action

If mode is omitted, use Product Development mode. The v2 entry contract must state the protocol purpose, product scope, non-goals, and operating unit in concise terms before execution begins.

## 2. Bootstrap

Coverage: CAP-002, CAP-004.

Bootstrap prepares a product workspace before lifecycle execution. It resolves the protocol source ref once, pins that ref, initializes runtime state, creates required scaffold artifacts, copies protocol reference material as configured, and stops before product lifecycle artifacts are created.

Latest-first protocol load rule:
- User startup remains `SAPDP` plus `Goal`.
- If no protocol version, tag, or commit is specified, load SAPDP from latest `origin/main`.
- Do not trust a local cached protocol clone.
- Before Bootstrap, refresh protocol source:

```sh
rm -rf .sapdp-source
git clone --depth 1 --branch main https://github.com/soyona/SAPDP.git .sapdp-source
```

- Read `.sapdp-source/SAPDP.md` after refresh.
- If a protocol version, tag, or commit is explicitly specified, use that ref instead of `main`.

Version rules:
- Omitted protocol version resolves to refreshed `origin/main`.
- `latest` resolves to refreshed `origin/main`.
- A specified version, tag, or commit pins that explicit ref.
- Runtime state records the resolved protocol source ref and version lock.
- After version lock, normal operation reads state and does not re-resolve latest.

Bootstrap output must be minimal and must not include lifecycle theory.

## 3. Project Initialization

Coverage: CAP-008.

Project initialization creates a SAPDP-compatible product workspace from the project name and bootstrap contract. It must not infer product idea, problem, target user, solution, MVP, or implementation scope.

Initialization must:
- Create required runtime, route, artifact, template, protocol, source, and test locations.
- Preserve empty required directories with Git-persistable placeholders when needed.
- Avoid overwriting existing SAPDP files without explicit Human confirmation.
- Stop at readiness for Problem stage.

## 4. Current Stage and Next Action

Coverage: CAP-012, CAP-013, CAP-037.

Runtime state, not chat history, determines current stage and next action. If runtime state is missing or inconsistent, the next action is blocked.

State recovery reads:
- `PROJECT_STATE.md` for lifecycle state.
- `ROUTE_MANIFEST.md` and latest Route Card for route recovery.
- Bootstrap handoff artifacts for initial Problem-stage entry.

Stage Readiness Gate:
- Mandatory before every lifecycle transition.
- `ROUTE_MANIFEST.md` proposes the next stage only; it does not authorize transition.
- Generic progression commands, including `请进入下一步`, `请继续`, `下一步`, `继续`, `Next`, `Continue`, `Go on`, and `Proceed`, request transition evaluation and must trigger this gate.
- Required artifacts, required commits, and required Human decisions must exist before PASS.
- FAIL returns `BLOCKED` and must not auto-transition or auto-generate the proposed next-stage artifact.

Next action recovery returns one executable action or one blocker. A minimal lifecycle progress display may be used to show current stage and inactive stages, but it must not replace runtime state.

## 5. Human-AI Handoff

Coverage: CAP-019, CAP-021, CAP-022, CAP-023, CAP-024.

SAPDP uses explicit handoffs among Human, ChatGPT, Codex, and Git.

Git-native handoff is the default execution contract:
- ChatGPT Design -> Codex Execute -> Git Commit -> Return Commit URL -> ChatGPT Audit.
- Execution Result = Git Commit.
- Audit Input = Git Commit URL.
- Git is the single source of truth for audit.
- Codex final output after committed execution must be the Commit URL only when a remote commit URL exists.
- Audit handoff packages and execution summaries are not required.

Route Card is the required stage-completion handoff. It contains:
- Current stage, environment, project, and session
- Completed artifact, result, or commit
- Next stage, environment, project, and session
- One executable action
- Optional startup prompt
- Audit source when needed

`ROUTE_MANIFEST.md` and Route Cards may propose the next stage and action only. They are routing inputs, not lifecycle transition authority.

ChatGPT to Codex handoff must be compact and executable:
- Repo
- Action
- Files or source artifacts
- Validation
- Required return format

Codex to ChatGPT handoff must return:
- Commit URL only when a remote commit URL exists.
- Local commit SHA and exact push instructions only when no remote exists.
- One blocker only when no commit can be created.

ChatGPT stages normally continue in the current product-bound session unless context size requires a new session. Bootstrap to Problem uses a new product-bound session by default. Human and Git exception paths must state the required Human or Git action explicitly.

## 6. Lifecycle

Coverage: CAP-015, CAP-016, CAP-017, CAP-018.

Product lifecycle stages:
1. Problem
2. Solution
3. Product Representation
4. Product Requirement
5. UX Specification
6. Visual Design Specification when required
7. MVP Definition
8. Task Package
9. Build
10. Implementation Verification
11. User Validation
12. Release

Bootstrap is prerequisite work, not a lifecycle stage.

Entry rules:
- New Feature enters Problem.
- Bug Fix enters Implementation Verification.
- Refactor enters Build.

Rollback rules:
- Implementation Verification failure returns to Build.
- User Validation failure returns to MVP Definition.

Stage definitions must declare objective, inputs, outputs, owner, exit criteria, and completion action. Lifecycle progression is commit-gated: no committed, validated stage output means no transition.

Lifecycle transition requires Runtime State + Route Manifest + Stage Readiness Gate PASS. Continue Lifecycle must return `BLOCKED` when required artifacts, commits, decisions, or readiness are missing. If readiness PASS, return the next executable action; generate the next artifact only when the Human request clearly asks execution.

## 7. Artifacts

Coverage: CAP-026, CAP-028, CAP-039.

Artifacts are the runtime memory of product work. Each artifact must have a clear producer, consumer, route role, next action, and audit source when routing is required.

Product Shape layer:
- Product Representation
- Product Requirement
- UX Specification
- Visual Design Specification when required
- Technical Constraint when needed

UX Specification is mandatory. Missing `UXSpecification_CORE_v1.md` blocks MVP Definition and Build.

Visual Design Specification readiness:
- Missing `VisualDesignSpecification_CORE_v1.md` blocks transition for Experience Product.
- Missing `VisualDesignSpecification_CORE_v1.md` blocks transition when the Human explicitly requires visual quality, UI design, brand style, or visual consistency.
- Visual Design Specification is optional for Functional Product unless visual quality is release-critical.
- Unknown product type returns `BLOCKED` when product type is required to decide visual design applicability.

MVP Definition and Build must not proceed without required Product Shape artifacts.

Distilled problem constraints from prior research may define artifact boundaries, but full historical research records are not runtime inputs.

## 8. Templates and Contracts

Coverage: CAP-005, CAP-006, CAP-007, CAP-009, CAP-010, CAP-011, CAP-014, CAP-020, CAP-025, CAP-027, CAP-029, CAP-030, CAP-031, CAP-032, CAP-036.

`templates/` owns artifact formats and required load sets. SAPDP.md references template responsibilities but does not duplicate template bodies.

Template responsibilities include:
- Lifecycle state
- Route manifest
- Artifact index
- Problem, Solution, Product Shape, MVP, Task Package, Verification, Validation, and Release artifacts

`contracts/` owns executable rules and result criteria. Contract responsibilities include:
- Bootstrap execution
- Bootstrap validation
- Manifest configuration
- Idempotency
- Protocol snapshot strategy
- Transition checks
- MUST, STOP, PASS, PATCH REQUIRED, and FAIL rules
- Materialization tasks must comply with `engine/contracts/ArtifactMaterializationContract.md`.
- `Action: Materialize` is the protocol action for frozen artifact materialization.

Contracts must define required inputs, outputs, authority boundaries, forbidden actions, validation order, and stop conditions.

## 9. Verification and Validation

Coverage: CAP-035.

Verification and validation must prefer committed Git evidence over pasted files or runtime-only output.

Rules:
- ChatGPT audits the Git Commit URL when a remote commit exists.
- Codex must commit completed implementation work.
- If a remote exists, Codex pushes and returns a commit URL.
- If no remote exists, Codex returns local commit SHA and exact push instructions.
- Commit URL is the only required audit input for committed remote execution.
- Execution summaries, audit handoff packages, changed-file lists, and test summaries are optional diagnostics, not required handoff fields.
- Runtime-only artifacts do not satisfy verification.

Implementation Verification checks implementation against approved artifacts and constraints. User Validation checks whether the product creates value for intended users.

## 10. Release

Coverage: CAP-033.

Product Release consumes Implementation Verification and User Validation results and closes the product lifecycle when release criteria pass.

Protocol Release Audit PASS AND FROZEN is the freeze authority for protocol releases. It requires:
- Remote Commit URL exists.
- Commit is verifiable from GitHub.
- Version is updated correctly.
- Version tag is created and verifiable from GitHub.
- Changes match Design Freeze.
- No blocker remains.

Simple Sequential Version Policy:
- Every protocol release must create a new tag.
- Release Audit PASS results in a sequential version increment.
- `SAPDP.md` declares the protocol version authority.
- The latest release tag is Git evidence for the released `SAPDP.md` version.

Universal Version Increment Rule:
- Any committed change to the SAPDP repository creates a new protocol version.
- No repository change may be released without a protocol version increment.

Before release:
1. Update the version in `SAPDP.md`.
2. Commit the repository change.
3. Tag the commit with the new protocol version.
4. Release the new protocol version.

Commit URL and Tag URL are required minimum Git-native evidence for protocol releases. GitHub Release is not required as minimum solo Git-native evidence.

If required remote evidence cannot be verified, protocol release result must be PATCH REQUIRED, not PASS AND FROZEN.

## 11. Protocol Evolution

Coverage: CAP-034.

Protocol Evolution is separate from product development. It must not invoke product Bootstrap or change product lifecycle stages by default.

Protocol Evolution route:
1. Reality Validation
2. Issue
3. Proposal
4. Design Audit
5. Codex Upgrade
6. Release Audit
7. Reality Validation

Release Audit successful result is PASS AND FROZEN and the next stage is Reality Validation. Failed Release Audit result is PATCH REQUIRED and returns to Codex Upgrade.

Protocol upgrade handoff to Codex must include version, release name, problem, goal, scope, required changes, validation, and final output format.

## 12. Token and Context Minimization

Coverage: CAP-003.

Default runtime mode is compressed execution. Explanations are opt-in.

Normal operation:
1. Read state.
2. Execute next action or block.
3. Return the minimal result.

Continue and Next-style commands must return only one `NEXT_ACTION`:
- `CODEX_UPDATE <file/path> <purpose>`
- `HUMAN_INPUT <missing decision or content>`
- `BLOCKED <missing artifact / missing decision / missing commit / invalid state / readiness failed>`
- `TRANSITION <next stage>`

Generic natural language progression commands request Stage Readiness Gate evaluation only; they do not bypass readiness or authorize transition.

After lifecycle stage results, SAPDP should provide one compact suggested next prompt for the Human when useful.

Task packages, Codex returns, audits, route cards, and release handoffs must use compact formats and prefer paths, commit URLs, and artifact references over pasted document bodies.

## 13. Version Consistency Audit

Version Consistency Audit is required for protocol releases.

Audit rules:
- Read the first heading of `SAPDP.md`.
- Treat that heading as the only current protocol version authority.
- Verify maintainer documentation references `SAPDP.md` instead of declaring an independent current protocol version.
- Verify bootstrap manifest metadata references `SAPDP.md` for protocol version authority.
- Verify no other current protocol file declares a conflicting protocol version authority.
- Historical version references are allowed only when clearly scoped as history, compatibility notes, or release evidence.

PASS requires one protocol version authority only: `SAPDP.md`.

FAIL requires governance repair before release tagging.
