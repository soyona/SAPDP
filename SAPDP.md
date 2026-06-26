# SAPDP v3.0.3 Protocol

Protocol Digest: sha256:13772171a22bb992ba9291addcdf511f31b68b7539d85e0848828bbd9d9201ff

<!-- Runtime Summary Start -->
Runtime Summary:
- `SAPDP.md` is the single protocol authority; this summary is derived from it and has no independent protocol authority.
- Input `sapdp`, case-insensitive, is the canonical SAPDP entry trigger.
- Bare `sapdp` enters Home Mode and displays only SAPDP Home without entering a flow.
- `sapdp` with user content enters Router Mode and routes directly without displaying SAPDP Home.
- After entry into a specific flow, Runtime Mode executes that flow.
- Protocol Ref is resolved from Git commit or tag and is never stored as a fixed commit SHA in `SAPDP.md`.
- Protocol Digest is the SHA-256 hash of `SAPDP.md` after excluding the Protocol Digest line itself.
<!-- Runtime Summary End -->

SAPDP is a platform-neutral protocol for one Human working with AI and Git to move from idea to validated product release with low context cost, explicit state, and verifiable handoffs.

Runtime constraints:
- Product work must be driven by explicit artifacts, not conversation memory.
- Git is the durable audit source.
- Historical research records are not runtime authority.
- Problem, purpose, scope, and goals must be distilled into current runtime constraints before they affect execution.
- Execution progression must be governed by an Execution Closure Artifact.

Protocol Version Authority Rule:
- `SAPDP.md` is the single protocol version authority.
- The protocol version is the version declared in the first heading of `SAPDP.md`.
- Other protocol files, manifests, templates, contracts, release notes, and runtime artifacts must not independently own or redefine the protocol version.
- When another file must display or persist a protocol version, it must derive that value from `SAPDP.md` or from the resolved Git ref that points to `SAPDP.md`.
- Any conflicting current protocol version identifier outside `SAPDP.md` is invalid and must be repaired before release.

Release Authority Rule:
- SAPDP Release is defined by a Git tag.
- The Latest SAPDP Release Version is the latest valid SAPDP version tag.
- A GitHub Release page is optional and non-authoritative.
- When asked for the "SAPDP latest release", tooling must resolve Git tags, not GitHub Release pages.
- `SAPDP.md` remains the single protocol authority.

Protocol metadata rules:
- Protocol Digest is calculated deterministically as the SHA-256 hash of `SAPDP.md` with the complete `Protocol Digest:` line excluded.
- Protocol Ref is resolved externally from the Git commit or tag containing `SAPDP.md`; a fixed commit SHA must never be written into `SAPDP.md`.
- Runtime Summary is derived only from `SAPDP.md`, is provided for low-token loading, and must not own or redefine protocol authority.
- Lightweight SAPDP loading reads the `SAPDP.md` first heading, Protocol Digest, and Runtime Summary block, resolves Protocol Ref from Git, and stops without reading the remaining protocol unless deeper protocol work is requested.

Authority Override Principle:

For SAPDP work, current protocol authority always overrides:
- historical understanding
- session assumptions
- prior protocol knowledge

When a conflict exists, the current protocol authority must be treated as the source of truth.

Execution Determinism Principle:

For deterministic, low-value, standardized operational tasks, SAPDP must provide explicit executable entry points.

Examples include:
- Git
- Release
- Tag
- Materialization
- Audit Trigger
- Bootstrap Script
- Validation Script

Codex must not spend reasoning budget on:
- discovering script names
- guessing script parameters
- guessing Git commands
- inferring execution order

Codex reasoning budget must be reserved for high-value engineering work:
- architecture design
- code implementation
- bug analysis
- complex refactoring
- product implementation

Repository Capabilities:

Materialization:
`./scripts/sapdp-materialize`

Release:
`./scripts/sapdp-release`

The Repository Capabilities registry is execution fact, not advisory guidance.

These protocol repository scripts apply only to:
- SAPDP Protocol Evolution
- SAPDP Protocol Materialization
- SAPDP Protocol Release

They must not be treated as generic product repository scripts.

## 1. Invocation

Coverage: CAP-001, CAP-040.

### 1.1 SAPDP Home Contract

Trigger:

```text
sapdp
```

Behavior: Display SAPDP Home.

Output template:

```text
SAPDP v<Current Version>

AI-Assisted Solo Product Development Protocol

你想做什么？

1. 开发一个新产品
   从Idea开始创建新项目

2. 继续一个已有产品
   已有项目，需要继续研发

3. 升级SAPDP协议
   修改、优化、修复协议

4. 新增DNA案例
   将优秀产品案例沉淀到DNA Library供后续复用

5. 审核一个Commit
   对Codex提交结果进行审核

6. 我不知道该选哪个
   描述你的情况，我帮你路由

例如：
- 开发一个儿童教育产品
- 继续TOBY
- 升级SAPDP
- 审核这个Commit

直接回复数字或描述你的情况即可。
```

Rules:
- Match the `sapdp` trigger case-insensitively across all protocol artifacts.
- Resolve `<Current Version>` from the first heading of `SAPDP.md`.
- Do not expand protocol details.
- Do not automatically enter any flow.

### 1.2 SAPDP Intent Router Contract

Trigger: `sapdp` plus user content.

Behavior: Route directly. Do not display SAPDP Home.

Routing rules:
- `1` -> New Product Flow.
- `2` -> Continue Product Flow.
- `3` -> Protocol Evolution.
- `4` -> DNA Governance.
- `5` -> Commit Audit.
- `6` -> Intent Clarification.
- `继续TOBY`, `继续XX项目`, and equivalent continue-product intent -> Continue Product Flow.
- `升级SAPDP`, `修复协议`, and equivalent protocol-evolution intent -> Protocol Evolution.
- Commit URL, Commit SHA, or Review Commit Intent -> Commit Audit.
- `开发一个XX产品`, `创建一个XX应用`, and equivalent new-product intent -> New Product Flow.
- `不知道`, `不确定`, and equivalent uncertainty intent -> Intent Clarification.

Router Determinism Rule:
- Router evaluation MUST be executed before any rendering logic
- No UI/output (including Home display) may occur before routing decision is finalized
- Routing decision is immutable per request lifecycle

Fallback Rule:
If Goal does not match any routing rule:
→ MUST default to Intent Clarification flow
→ MUST NOT return raw mismatch error
→ MUST NOT stop routing process


### 1.3 Mode Boundary

- Home Mode: triggered by bare `sapdp`; shows protocol entry points.
- Router Mode: triggered by `sapdp` plus content; routes to the correct entry.
- Runtime Mode: applies after the user has entered a specific flow; executes the protocol.

Backward-compatible structured startup format:

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

```text
SAPDP

Goal:
Add Visual DNA Linear
```

```text
SAPDP

Goal:
Add Product DNA Duolingo
```

```text
SAPDP

Goal:
Add DNA Duolingo
```

```text
SAPDP

Goal:
Add DNA https://www.duolingo.com
```


Startup Format Enforcement Rule:

- Any deviation from structured startup format MUST be normalized into:
  SAPDP + Goal

- If normalization fails → Intent Clarification

- System MUST NOT attempt partial interpretation of malformed Goal input


Structured startup routing rules:
- Goal starts with `Build` -> New Product Flow.
- Goal starts with `Continue` -> Continue Product Flow.
- Goal starts with `Upgrade SAPDP` -> Protocol Evolution.
- Goal starts with `Add Visual DNA` -> DNA Governance with `DNA Type = Visual DNA`.
- Goal starts with `Add Product DNA` -> DNA Governance with `DNA Type = Product DNA`.
- Goal starts with `Add DNA` -> `HUMAN_INPUT: Select DNA Type` before DNA Governance evidence collection.

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

If Goal and other user content are omitted, enter Home Mode. If user content is present, enter Router Mode. A new product entering Runtime Mode must state the protocol purpose, product scope, non-goals, and operating unit in concise terms before execution begins.

### 1.4 Runtime Entry Determinism Rule（新增）

SAPDP entry behavior must follow strict deterministic evaluation:

1. Input normalization:
   - trim whitespace
   - case-insensitive match on "sapdp"

2. Entry classification priority:

   (1) Bare "sapdp"
       → MUST enter Home Mode only
       → MUST NOT execute routing logic

   (2) "sapdp + content"
       → MUST enter Router Mode only
       → MUST bypass Home Mode rendering

   (3) Any Goal-based structured input
       → MUST be treated as Router Mode input
       → MUST NOT fallback to Home Mode

3. Invalid mixed states:
   - If system cannot classify input deterministically,
     MUST return Intent Clarification (Rule 1.2 → 6)

4. Hard constraint:
   - Home Mode and Router Mode are mutually exclusive per request
   - Runtime Mode only activates after Router resolution completes

### 1.5 Precedence Rule:

If Runtime Summary conflicts with any explicit Invocation or Router rule,
Router + Invocation rules override Runtime Summary.


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

Product repository Bootstrap must create the following executable Git operation
stub scripts when they are missing:

```text
scripts/product-commit
scripts/product-release
scripts/product-verify
```

Equivalent existing scripts are allowed only when their invocation and output
contracts are explicit. Each generated stub must output `NOT_IMPLEMENTED`, exit
with non-zero status, and execute no Git operations. A stub must not fake a
Commit URL, Tag URL, Release URL, `PASS`, or any success output.

Bootstrap output must be minimal and must not include lifecycle theory.

## 3. Project Initialization

Coverage: CAP-008.

Project initialization creates a SAPDP-compatible product workspace from the project name and bootstrap contract. It must not infer product idea, problem, target user, solution, MVP, or implementation scope.

Initialization must:
- Create required runtime, route, artifact, template, protocol, source, and test locations.
- Preserve empty required directories with Git-persistable placeholders when needed.
- Avoid overwriting existing SAPDP files without explicit Human confirmation.
- Stop at readiness for Problem stage.

## Architecture Freeze v1.0 (Loader–Authority–Execution Separation)

This section defines the stable system architecture for SAPDP runtime execution.

It is part of SAPDP protocol authority and MUST be treated as normative.

--------------------------------------------
1. SYSTEM ARCHITECTURE OVERVIEW
--------------------------------------------

SAPDP operates under a three-layer architecture:

Layer 1 — Loader Layer (AGENTS.md, Codex-only)
- Responsible for repository initialization
- Git validation and synchronization
- Context reset before protocol interpretation
- SAPDP.md fetch control

Layer 2 — Authority Layer (SAPDP.md)
- Single source of protocol truth
- Defines lifecycle, routing, execution model
- Overrides all external instructions and repository structure

Layer 3 — Execution Layer (ChatGPT / Codex runtime)
- ChatGPT: interpretation and routing only
- Codex: execution and repository modification only

--------------------------------------------
2. ARCHITECTURE CONSTRAINTS
--------------------------------------------

- Only SAPDP.md defines protocol behavior
- Loader layer cannot define protocol semantics
- Execution layer cannot infer protocol rules from repository structure
- All non-SAPDP.md files are DATA ONLY

--------------------------------------------
3. PRECEDENCE RULE
--------------------------------------------

If any conflict exists:

SAPDP.md ALWAYS overrides:
- AGENTS.md behavior
- Project instructions
- Runtime assumptions
- Repository structure inference

--------------------------------------------
4. DESIGN INTENT

This architecture ensures:
- Single-source protocol authority
- Deterministic execution across ChatGPT and Codex
- Elimination of cross-file inference
- Stable runtime behavior across sessions

## Goal Routing Registry (Externalized Control Layer)

Coverage: CAP-041

SAPDP Goal resolution is NOT defined inside SAPDP.md.

All Goal definitions are externalized to:

engine/router/GOAL_LIBRARY.md

---

### Routing Rule

When SAPDP receives:

SAPDP
Goal: <any goal>

System MUST:

1. Resolve Goal from GOAL_LIBRARY.md
2. Map Goal to one of:
   - Product Development
   - Protocol Validation
   - Protocol Audit
   - Protocol Evolution
   - Adversarial Testing

3. If no match exists:
   → MUST return: BLOCKED (Unknown Goal)

---

### Authority Rule

- SAPDP.md does NOT define Goal list
- SAPDP.md only defines routing behavior
- Goal semantics are externalized completely

---

### Determinism Rule

Goal resolution MUST be:

- deterministic
- registry-based
- non-inferential

No model-generated goals are allowed.


## Runtime Information Architecture

### Startup Input

Goal = User Request.

Goal is used for startup routing.

Goal is not Runtime State.

### Context Information

Context Information includes:
- Project
- Repository
- Branch
- Environment
- Workspace
- Session

Context Information describes execution context.

Context Information is not Runtime State.

### Runtime State

Runtime State includes:
- Mode = work category.
- Flow = execution route.
- Stage = current step inside a Flow.
- Action = next executable operation.
- Execution State = ACTIVE | LOCKED | COMPLETE | FAILED.

Runtime State is authoritative for protocol execution and transition.

### Execution Governance Layer

Execution Closure Artifact:
- Every stage execution must produce an Execution Closure Artifact before stage transition evaluation.
- The artifact must declare execution status as exactly `PASS`, `FAIL`, or `BLOCKED`.
- The artifact must include a Git commit reference and timestamp.
- The artifact is a mandatory gate for stage transition.
- No Execution Closure Artifact means no progression is allowed.

Execution State Machine:
- Allowed states are exactly `ACTIVE`, `LOCKED`, `COMPLETE`, and `FAILED`.
- Stage transition requires Execution Closure Artifact status `PASS`.
- `FAIL` sets Execution State to `FAILED`.
- `BLOCKED` sets Execution State to `LOCKED`.
- No stage skip is allowed.

Centralized Findings Registry:
- `docs/dna/validation/runtime/Runtime_Findings_Registry.md` is the only authoritative findings source.
- All stage findings must be appended to that registry.
- Stage-local validation artifacts may reference findings from the registry but must not become independent findings authorities.

Schema Validation Rule:
- Any validation output must strictly conform to its declared schema.
- Non-compliant validation output is automatic `FAIL`.
- Correction is required before continuation.

### User Runtime Information

User Runtime Information includes:
- Next Action
- Execution Target
- Current Flow
- Flow Progress

User Runtime Information is the minimum information required for a Human to continue execution without losing direction.

### Flow Progress Information

Flow Progress Information communicates:
- Completed steps
- Current step
- Remaining steps

Flow Progress Information is explanatory.

Runtime State remains authoritative.

### Runtime Presentation Example

```text
→ Next Action:
Collect Official Evidence

Execute In:
Codex

▶ Flow:
DNA Governance

Progress:

[1] Human Input ✓
[2] Reality Validation ← Current
[3] Materialization
[4] Repository Audit
[5] Release

2 / 5
```

This example is illustrative only.

Presentation format is not mandated by SAPDP.

### Add DNA Runtime Mapping

Goal:

```text
Add Visual DNA <Product>
```

or

```text
Add Product DNA <Product>
```

or

```text
Add DNA <Product>
```

or

```text
Add DNA <Official URL>
```

Routing behavior:
- `Add Visual DNA <Product>` sets `DNA Type = Visual DNA`.
- `Add Product DNA <Product>` sets `DNA Type = Product DNA`.
- `Add DNA <Product>` or `Add DNA <Official URL>` returns `HUMAN_INPUT: Select DNA Type`; evidence collection must not begin until the Human selects `Visual DNA` or `Product DNA`.

Runtime State:

Mode:
Protocol Governance

Flow:
DNA Governance

Initial Stage:
Human Input

Initial Action:
- `Add Visual DNA` or `Add Product DNA`: Collect Official Evidence.
- `Add DNA`: `HUMAN_INPUT: Select DNA Type`.

DNA Governance Flow:

```text
[1] Human Input
[2] Reality Validation
[3] Materialization
[4] Repository Audit
[5] Release
```

Human Input:
Human provides Product Name or Official URL and, when the generic `Add DNA` entry is used, selects DNA Type.

Reality Validation:
Official evidence is collected and validated.

Materialization:
DNA artifacts are generated.

Repository Audit:
ChatGPT validates repository changes.

Release:
Codex creates release commit and tag.

Human responsibilities:
- Product selection
- Official URL selection

Human is not responsible for:
- DNA schema design
- DNA extraction methodology
- DNA governance structure

Codex responsibilities:
- Collect evidence
- Generate DNA artifacts
- Materialize repository changes

Codex must not approve release.

Release approval remains governed by Repository Audit.

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
- Execution Closure Artifact status `PASS` is required before transition.
- Validation outputs must pass schema validation before transition.
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

### 5.1 Codex Execution Instruction Contract

When SAPDP generates a Codex task, and the target repository already provides a standard script for the intended operation, the generated Codex task must explicitly include:

```text
Execution Method:
Script

Script:
<path/to/script>

Arguments:
<arguments>

Invocation:
<exact command>

Expected Output:
<expected-output>
```

The task must not rely on vague wording such as:

```text
Run release
```

or:

```text
Create tag
```

When generating Codex execution instructions, SAPDP must prefer existing repository automation over manually described commands.

Priority order:
1. Repository script
2. Make target
3. Package task runner
4. Explicit manual command

Principle:

Existing automation first.
Manual commands only when no suitable automation exists.

Codex must not infer execution steps from task names alone.

For deterministic operations, SAPDP-generated Codex tasks must resolve the Repository Capability first.

Correct task shape:

```text
SAPDP

Goal:
Release SAPDP v<X.Y.Z>

Capability:
Release

Invocation:
./scripts/sapdp-release

Output:
Tag URL only.
```

Incorrect task shape:

```text
Goal:
Release SAPDP

Please find the appropriate script and run it.
```

When a capability exists, Codex must not:
- replace the script
- append arguments
- rewrite the invocation
- infer an alternate command

Only when no capability exists may Codex resolve execution in this order:
1. Script
2. Make target
3. Task runner
4. Manual command

Prohibited:

```text
Goal:
Release SAPDP v<X.Y.Z>
```

without:
- Execution Method
- Invocation
- Expected Output

Codex to ChatGPT handoff must return:
- Commit URL only when a remote commit URL exists.
- Local commit SHA and exact push instructions only when no remote exists.
- One blocker only when no commit can be created.

### 5.2 Product Git Script Standard

Product repositories should expose Git operations through script entry points.
The recommended minimum set is:

```text
scripts/
  product-commit
  product-release
  product-verify
```

Equivalent naming is allowed. One script should represent one deterministic
operation.

For product repository commit, push, tag, release, and verification operations,
SAPDP must generate:

```text
Invocation:
<exact product script>
```

Example:

```text
Invocation:
./scripts/product-commit
```

The following instructions are prohibited because they do not provide an exact
script invocation:

```text
Please commit the changes.
Please push the changes.
Please create a release.
```

Commit, push, tag, and release are deterministic Git operations. They must
prefer Product Scripts. Codex must not spend reasoning budget on Git command
discovery, parameter guessing, or execution-order inference.

The default execution mechanism for product repository Git operations is a
Product Script. The GitHub Connector may be used only for:
- Commit Audit
- Release Audit
- PR Audit
- Issue Audit
- Remote Repository Validation

### 5.3 Product Git Script Runtime Standard

The required product Git script invocation shapes are:

```text
./scripts/product-commit
./scripts/product-release
./scripts/product-verify
```

The scripts must not require Codex to infer Git commands. A script must either
require no arguments or print explicit usage and stop when its arguments are
invalid.

Script output contracts:
- `product-commit`: Commit URL only, or local commit SHA plus the exact push
  instruction when no remote exists.
- `product-release`: Release URL or Tag URL only.
- `product-verify`: `PASS` or `FAIL` plus a concise failure reason.

If a required product Git script is missing outside Bootstrap, return:

```text
BLOCKED Product Git script missing.
Next: Create required product Git script first.
```

Do not fall back to raw Git commands unless the Human explicitly overrides.

Every Codex task for a product Git operation must include the exact invocation.
For example:

```text
Invocation:
./scripts/product-commit
```

If a product Git script returns `NOT_IMPLEMENTED`, SAPDP must return:

```text
BLOCKED
Reason: Product Git script not implemented
Next: Implement required product Git script
```

### 5.4 Product Git Script Ownership Contract

SAPDP owns product script entry points, contracts, outputs, and failure behavior.
Product repositories own the concrete implementation details.

SAPDP must not define framework-specific Git, test, or release implementation,
and must not auto-generate technology-stack-specific script implementations.
Codex may implement product-specific script bodies later when the product stack
is known.

The Product Git Script Runtime Standard output contracts remain unchanged.

ChatGPT stages normally continue in the current product-bound session unless context size requires a new session. Bootstrap to Problem uses a new product-bound session by default. Human and Git exception paths must state the required Human or Git action explicitly.

## 6. Lifecycle

Coverage: CAP-015, CAP-016, CAP-017, CAP-018.

Product lifecycle stages:
1. Problem
2. Solution
3. DNA Selection
4. Product Representation
5. Product Requirement
6. UX Specification
7. Visual Design Specification
8. MVP Definition
9. Task Package
10. Build
11. Implementation Verification
12. User Validation
13. Release

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

### 6.1 DNA Selection

DNA is a Protocol Asset with two non-overlapping types:
- Visual DNA = How It Looks.
- Product DNA = How It Works.

DNA Selection consumes the approved Problem and Solution and outputs:
- one Selected Visual DNA
- one Selected Product DNA

Selection may use:
- DNA Recommendation, governed by `dna/contracts/DNA_Recommendation_Contract.md`.
- Direct DNA Library Selection.

Single DNA Type Selection Policy:
- Exactly one Visual DNA must be selected.
- Exactly one Product DNA must be selected.
- Multiple Visual DNA selections are invalid.
- Multiple Product DNA selections are invalid.
- Missing either selection returns `BLOCKED` before Product Representation.
- Visual DNA + Product DNA combination is valid, and the protocol must not restrict valid combinations.
- Visual DNA + Visual DNA is invalid.
- Product DNA + Product DNA is invalid.

The Human is responsible for selecting DNA and may propose DNA Evolution. The Human does not design DNA, define the DNA schema, or define the replication standard. Those responsibilities belong to SAPDP protocol governance.

### 6.2 DNA Technology Principle

Visual DNA and Product DNA are technology-neutral. They MUST NOT contain a required framework, language, database, or technology stack. Visual DNA must contain visual implementation constraints. Product DNA must contain experience and behavioral constraints. Their responsibilities must not overlap.

### 6.3 Low-Token Replication Principle

Visual DNA and Product DNA encode reusable constraints to reduce drift, reduce rework, reduce token consumption, and enable stable replication. Downstream stages reference the Selected Visual DNA and Selected Product DNA instead of repeatedly reconstructing appearance or product behavior from conversation or ad hoc research.

## 7. Artifacts

Coverage: CAP-026, CAP-028, CAP-039.

Artifacts are the runtime memory of product work. Each artifact must have a clear producer, consumer, route role, next action, and audit source when routing is required.

The DNA Library belongs to the SAPDP Protocol Repository. Typed library entries are governed protocol assets, not product-workspace inventions, and use this structure:

```text
dna/
├── visual/
├── product/
└── evidence/
```

Examples include `dna/visual/LinearVisualDNA`, `dna/visual/NotionVisualDNA`, `dna/visual/StripeVisualDNA`, `dna/product/DuolingoProductDNA`, `dna/product/MinecraftProductDNA`, and `dna/product/PokemonProductDNA`.

The legacy `dna/library/` location remains valid for existing Product DNA assets. Existing Product DNA assets remain valid without relocation or a `DNA Type` field and are treated as Product DNA when selected. New DNA assets must live in the typed library and declare `DNA Type`.

A product workspace records the Selected Visual DNA, Selected Product DNA, and their resolved protocol source refs.

### 7.1 DNA Template Foundation

Every new DNA asset must declare the standard field `DNA Type`. Allowed values are exactly:
- `Visual DNA`
- `Product DNA`

Template mapping is explicit:
- New Visual DNA assets use `templates/dna/VisualDNA_Template.md`.
- New Product DNA assets use `templates/dna/ProductDNA_Template.md`.
- `templates/dna/DNA_Template.md` is backward compatibility only and must not be used for new DNA assets.

Visual DNA purpose: replicate visual appearance and UI implementation.

Visual DNA primary sources:
- HTML
- CSS
- DOM
- Assets
- Design Tokens
- Component Libraries

Visual DNA outputs:
- Visual Tokens
- Layout Rules
- Typography Rules
- Color System
- Spacing System
- Component Rules
- Motion Rules

Visual DNA is responsible for How It Looks. Visual DNA is not responsible for Experience Pattern, Motivation Pattern, Retention Pattern, or Progression Pattern.

Product DNA purpose: replicate product experience and behavioral mechanisms.

Product DNA primary sources:
- Official Product
- Official Documentation
- Official Help Center
- Real Usage Observation

Product DNA outputs:
- Experience Pattern
- Interaction Pattern
- Motivation Pattern
- Retention Pattern
- Progression Pattern

Product DNA is responsible for How It Works. Product DNA is not responsible for Color System, Typography Rules, Visual Tokens, Layout Rules, or Component Visual Design.

Visual DNA and Product DNA must not overlap responsibilities.

Visual Tokens must be expressed as executable parameters with explicit values, units or formats where applicable, and the scope or state in which each parameter applies. Descriptive prose without executable parameter values is invalid.

Evidence References is mandatory. Every DNA instance must map its extracted patterns, tokens, and rules to evidence identifiers and official source references. Missing Evidence References blocks DNA Governance Release Audit.

DNA extraction is fact-based:
- Every extracted fact must identify supporting evidence and its source.
- Evidence used by a DNA instance must be stored under `dna/evidence/<Product>/`.
- Allowed evidence sources are official product reality, official documentation, and the official help center.
- Blogs, reviews, forums, AI-generated content, personal opinions, and unsupported statements are prohibited extraction inputs.

`dna/library/NotionDNA/NotionDNA_v1.md` is an existing Product DNA asset preserved under the backward-compatibility rule. Its evidence is stored under `dna/evidence/Notion/`.

The Selected Visual DNA and Selected Product DNA are mandatory inputs for Product Representation, Product Requirement, UX Specification, Visual Design Specification, MVP Definition, Task Package, Build, Implementation Verification, and User Validation. Missing either selection blocks each of these stages. Consumption is governed by `dna/contracts/DNA_Consumption_Contract.md`.

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
- Problem, Solution, Product DNA, Product Shape, MVP, Task Package, Verification, Validation, and Release artifacts

`contracts/` owns executable rules and result criteria. Contract responsibilities include:
- Bootstrap execution
- Bootstrap validation
- Execution governance
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

Materialization includes the version bump defined by Design Freeze, commits and
pushes the repository changes with `scripts/sapdp-materialize`, and outputs the
Commit URL. Release runs only after Repository Audit, tags the current commit
with the version already declared in `SAPDP.md` by using
`scripts/sapdp-release`, and outputs the Tag URL.

The scripts execute frozen decisions only. They must not infer protocol changes
or versions.

During Release, if a release script exists, SAPDP must use the release script instead of manual Git tag commands.

Standard release task shape:

```text
SAPDP

Goal:
Release SAPDP v<X.Y.Z>

Execution Method:
Script

Invocation:
<release-script> v<X.Y.Z> <commit-sha>

Constraints:
- Do not edit files unless the script requires it.
- Do not create extra commits unless the script is explicitly designed to do so.
- If the script fails, stop and return the error.

Output:
Tag URL only.
```

Commit URL and Tag URL are required minimum Git-native evidence for protocol releases. SAPDP Release is defined by its Git tag, and the latest valid SAPDP version tag defines the Latest SAPDP Release Version. A GitHub Release page is optional, non-authoritative, and must not be used by tooling to resolve the SAPDP latest release.

If required remote evidence cannot be verified, protocol release result must be PATCH REQUIRED, not PASS AND FROZEN.

## 11. Protocol Evolution

Coverage: CAP-034.

Protocol Evolution is separate from product development. It must not invoke product Bootstrap or change product lifecycle stages by default.

Protocol Evolution uses exactly seven stages with fixed execution environments:

1. Protocol Evolution -> ChatGPT
2. Design -> ChatGPT
3. Design Audit -> ChatGPT
4. Design Freeze -> ChatGPT
5. Materialization -> Codex
6. Repository Audit -> ChatGPT
7. Release -> Codex

No Protocol Evolution stage may be added. The fixed flow, stage input and output contracts, ChatGPT to Codex handoff, Codex to ChatGPT returns, and completion rules are governed by `engine/contracts/ProtocolEvolutionCompletionContract.md`.

### 11.1 Protocol Evolution Status Card

For Protocol Evolution discussions, output this Status Card first. Do not repeat long workflow explanations unless the Human explicitly asks to explain the flow.

```text
SAPDP Protocol Evolution Status

Target Version:
<vX.Y.Z>

Progress:
<progress bar>

Flow:

1. Protocol Evolution  (ChatGPT) <status>
2. Design              (ChatGPT) <status>
3. Design Audit        (ChatGPT) <status>
4. Design Freeze       (ChatGPT) <status>
5. Materialization     (Codex) <status>
6. Repository Audit    (ChatGPT) <status>
7. Release             (Codex) <status>

Next:
<next stage>
```

Status markers:
- Completed: `✓`
- Current: `← Current`
- Not started: no marker

Progress rules:

```text
1/7  ■□□□□□□
2/7  ■■□□□□□
3/7  ■■■□□□□
4/7  ■■■■□□□
5/7  ■■■■■□□
6/7  ■■■■■■□
7/7  ■■■■■■■
```

### 11.2 Version Field Rule

- `Current Version` appears only in the Design Freeze handoff.
- `Target Version` must be used after Design Freeze.
- The ambiguous standalone handoff field `Version` is prohibited.

Repository Reality Validation Rule:

Before any Materialization Planning, SAPDP must verify the current repository reality from Git/GitHub.

Materialization Planning must be based on committed repository state, not session memory, historical assumptions, previous file structures, or inferred paths.

### 11.3 Evolution Codex Task Generation Rule

During Protocol Evolution, ChatGPT-generated Codex tasks must include:

```text
Execution Method:
Script / Make / Task Runner / Manual Command

Invocation:
<exact command>

Constraints:
<do / do not>

Output:
<required return value>
```

If an execution method is unknown, the Codex task must explicitly instruct Codex to inspect the repository for standard automation first, then use the highest-priority valid method.

DNA Governance reuses the protocol governance lifecycle:
1. Reality Validation
2. Issue
3. Proposal
4. Design Audit
5. Materialization
6. Release Audit
7. Reality Validation

Only governance-approved proposals may change the DNA schema, replication standard, templates, or official library entries. Materialization creates or updates the governed DNA asset. Release Audit verifies schema compliance, technology neutrality, Single DNA Type Selection Policy compatibility, executable constraints, and absence of blockers before the asset becomes selectable.

## 12. Token and Context Minimization

Coverage: CAP-003.

Default runtime mode is compressed execution. Explanations are opt-in.

Token Allocation Principle:

SAPDP must allocate token budget to high-value work:
- decision
- design
- implementation
- verification

SAPDP must avoid wasting token budget on low-value deterministic execution discovery:
- finding scripts
- guessing commands
- guessing arguments
- inferring workflows

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


# ==========================================
# SAPDP EXECUTION BOUNDARY KERNEL v1.1
# AUTHORITY LAYER ENFORCEMENT PATCH
# ==========================================

## 1. SINGLE SOURCE OF TRUTH (HARD LOCK)

SAPDP.md is the ONLY authoritative protocol source.

Any information NOT explicitly defined in SAPDP.md is INVALID.

No other file in the repository can define system behavior.

---

## 2. STRICT STRUCTURAL MODE (NON-NEGOTIABLE)

The system operates in STRICT STRUCTURAL MODE:

- Only explicit statements in SAPDP.md are valid
- No inference is allowed
- No architectural completion is allowed
- No lifecycle expansion is allowed

---

## 3. INFERENCE KILL SWITCH (CRITICAL RULE)

The system MUST NOT:

- infer missing system components
- generate runtime models
- complete partial architecture
- synthesize workflow logic

If information is missing:

→ Output MUST be:
"NOT DEFINED IN SAPDP.md"

---

## 4. EXECUTION BOUNDARY RULE

All execution MUST follow:

Step 1: Match request to SAPDP.md explicit content
Step 2: If match exists → output literal mapping only
Step 3: If no match exists → return NOT DEFINED

No deviation is allowed.

---

## 5. REPOSITORY FILE ISOLATION RULE

All non-SAPDP.md files are DATA ONLY:

engine/
templates/
dna/
docs/
bootstrap/

They MUST NOT:

- influence protocol interpretation
- define execution logic
- expand system behavior
- introduce runtime assumptions

---

## 6. ARCHITECTURE IMMUTABILITY RULE

The SAPDP architecture is FIXED:

1. Loader (AGENTS.md)
2. Authority (SAPDP.md)
3. Execution runtime

No additional layers are allowed.

---

## 7. OUTPUT CONSTRAINT (HARD LIMIT)

System output MUST NOT include:

- system completion reasoning
- inferred workflows
- architectural expansion
- runtime model generation

Only explicit SAPDP.md mappings are allowed.

---

## 8. FINAL SYSTEM GUARANTEE

SAPDP operates as a deterministic mapping system:

Input → explicit match in SAPDP.md → output

If no match exists → reject output