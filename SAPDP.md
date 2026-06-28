# SAPDP v4.0.0 Protocol

Authority Digest: sha256:9c4472db361bac8f90097523dbc2fa368fc136292403004a80f760106da303fa

<!-- Runtime Summary Start -->
Runtime Summary:
- `SAPDP.md` is the protocol root authority and sole protocol version authority.
- Registered Flow and Module authorities own only their explicitly delegated scopes.
- Bare `sapdp` enters Home Mode; `sapdp` plus content enters Router Mode.
- Runtime loads only the routed authority and its explicit dependency closure from the same Git ref.
- Git is durable audit evidence; conversation memory is not runtime authority.
- Missing, duplicate, conflicting, or cyclic authority returns a blocker without inference.
<!-- Runtime Summary End -->

SAPDP is a platform-neutral protocol for one Human working with AI and Git to move from idea to validated product release with low context cost, explicit state, and verifiable handoffs.

## Global Runtime Constraints

- Product work is driven by explicit artifacts and Runtime State.
- Git is the durable repository audit source.
- Historical records and guides are not current runtime authority.
- Missing architecture, behavior, stages, or outputs must not be invented.
- Execution progression requires the owning Flow's readiness and transition rules.
- Unresolved authority returns `BLOCKED`; behavior absent from all loaded authority returns `NOT DEFINED IN SAPDP.md`.

## Version Authority

- The first heading of `SAPDP.md` is the sole current protocol version authority.
- Other files derive version from `SAPDP.md` or the resolved Git ref.
- Current version identifiers outside `SAPDP.md` are invalid unless explicitly historical or candidate evidence.
- A released SAPDP version is defined by an immutable Git tag.
- A GitHub Release page is optional and non-authoritative.

## Authority Architecture

SAPDP uses:

1. Loader Layer: fetches and loads the root authority.
2. Root Authority: `SAPDP.md` owns version, invocation, router, global rules, and delegation.
3. Delegated Authority: registered Flow and Module files own bounded runtime scopes.
4. Execution Layer: ChatGPT interprets, designs, and audits; Codex modifies repositories and runs deterministic automation.

All unregistered repository files are non-authoritative data or implementation.

### Authority Scope

- Root rules cannot be redefined by a delegated authority.
- A Flow owns its stages, transitions, outputs, and recovery.
- A Module owns its design, runtime, and registered Module Flows.
- Scope overlap is invalid and returns `BLOCKED AUTHORITY_CONFLICT`.
- Repository structure and CAP ownership are governed by the registered Repository Architecture authority.

## Authority Registry

Registry records use:

```text
authority|<kind>|<owner-id>|<component-id>|<repository-path>
```

<!-- Authority Registry Start -->
authority|architecture|repository|root|protocol/repository-architecture.md
authority|flow|bootstrap|main|protocol/flows/bootstrap.md
authority|flow|bootstrap|validation|protocol/flows/bootstrap-validation.md
authority|flow|commit-audit|main|protocol/flows/commit-audit.md
authority|flow|intent-clarification|main|protocol/flows/intent-clarification.md
authority|flow|product-development|main|protocol/flows/product-development.md
authority|flow|protocol-evolution|main|protocol/flows/protocol-evolution.md
authority|module|artifact-materialization|design|protocol/modules/artifact-materialization/design.md
authority|module|artifact-materialization|entry|protocol/modules/artifact-materialization/module.md
authority|module|artifact-materialization|runtime|protocol/modules/artifact-materialization/runtime.md
authority|module|dna|design|protocol/modules/dna/design.md
authority|module|dna|entry|protocol/modules/dna/module.md
authority|module|dna|runtime|protocol/modules/dna/runtime.md
authority|module-flow|dna|add-dna|protocol/modules/dna/flows/add-dna.md
authority|module|execution-governance|design|protocol/modules/execution-governance/design.md
authority|module|execution-governance|entry|protocol/modules/execution-governance/module.md
authority|module|execution-governance|runtime|protocol/modules/execution-governance/runtime.md
authority|module|goal-system|design|protocol/modules/goal-system/design.md
authority|module|goal-system|entry|protocol/modules/goal-system/module.md
authority|module|goal-system|runtime|protocol/modules/goal-system/runtime.md
<!-- Authority Registry End -->

Rules:

- Each record key and path is unique.
- Each path exists at the same resolved Git ref as `SAPDP.md`.
- Each registered file contains matching normative metadata.
- No unregistered file may declare `authority=normative`.
- Missing or invalid Registry data returns `BLOCKED AUTHORITY_REGISTRY_INVALID`.

## Authority Digest

Authority Digest covers:

- `SAPDP.md`;
- every Registry path.

Calculation:

1. Sort repository-relative paths with `LC_ALL=C`.
2. For `SAPDP.md`, exclude the complete `Authority Digest:` line.
3. For each file, append raw bytes as `<path><NUL><content><NUL>`.
4. Calculate SHA-256 over the concatenated bytes.
5. Store lowercase hexadecimal as `Authority Digest: sha256:<digest>`.

Missing files, duplicate paths, symlinks, invalid metadata, or a mismatched digest block audit and release.

## Authority Loading

1. Load `SAPDP.md` from the resolved Git ref.
2. Classify Home or Router Mode.
3. Resolve one Router target.
4. Resolve the target against the Registry.
5. Load that authority and its explicit dependencies from the same Git ref.
6. Reject missing, duplicate, conflicting, or cyclic dependencies.
7. Execute only the loaded authority closure.

The runtime must not scan repository structure to discover protocol behavior.

## Invocation

### Home Mode

Trigger:

```text
sapdp
```

Match case-insensitively after trimming surrounding whitespace.

Output:

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

直接回复数字或描述你的情况即可。
```

Resolve Current Version from the first heading. Home Mode displays only this entry and does not enter a Flow.

### Router Mode

`sapdp` plus user content enters Router Mode without rendering Home.

Routes:

- `1`, new-product intent, or Goal starting with `Build` -> Product Development with `entry=new`.
- `2`, continue-product intent, or Goal starting with `Continue` -> Product Development with `entry=continue`.
- `3`, protocol-upgrade intent, or Goal starting with `Upgrade SAPDP` -> Protocol Evolution.
- `4`, `Add Visual DNA`, or `Add Product DNA` -> DNA Module Add DNA Flow.
- Generic `Add DNA` without an explicit type -> exactly `HUMAN_INPUT: Select DNA Type`.
- `5`, Commit URL, Commit SHA, or review-commit intent -> Commit Audit.
- `6`, uncertainty, malformed Goal, or unmatched entry intent -> Intent Clarification.

Router evaluation completes before rendering. Home and Router Mode are mutually exclusive for one request.

### Structured Input

Backward-compatible input:

```text
SAPDP

Goal: <goal>
```

A Goal is normalized and routed before Goal System execution. Missing Goal content enters Home. Ambiguous content enters Intent Clarification.

## Output Normalization

Global category envelopes are:

```text
SUCCESS <Category>
BLOCKED <Reason>
ERROR <Message>
```

An active Flow's explicit output contract takes precedence within that Flow.

Rules:

- Success requires verifiable completion evidence.
- Blocked identifies one concrete missing input, decision, artifact, authority, or repository condition.
- Error identifies an execution or validation failure.
- Silent failure and fabricated evidence are prohibited.
- Exact literal outputs owned by a Flow or Module must not gain explanation.

## Deterministic Execution

Low-value operational work uses explicit scripts and exact invocations. Codex must not spend reasoning budget discovering script names, arguments, Git order, or output shape when an owning authority defines them.

High-value reasoning is reserved for design, implementation, defect analysis, verification, and governance audit.

## Token and Context Minimization

- Default runtime mode is compressed execution.
- Load the root summary first, then only the routed authority closure.
- Do not load unrelated Flows, Modules, historical records, or templates.
- Prefer paths, refs, digests, and Git URLs over pasted document bodies.
- Repeat the full flow only on initial entry, explicit status request, or blocker.
- Explanations are opt-in unless required to make a decision.

## Release Authority

Product Release is owned by Product Development. SAPDP protocol Release is owned by Protocol Evolution.

For protocol release:

- Repository Audit PASS selects the Audited Commit.
- The release tag must point to that exact commit.
- The tag, Freeze Digest, Authority Digest, and remote evidence must verify.
- A post-release repair starts a new Protocol Evolution and version.

## Precedence

1. Root global rules
2. Routed Flow authority
3. Explicitly declared Module dependencies
4. Non-authoritative implementation and evidence

Precedence does not repair overlapping authority. Overlap is a blocker.

## Undefined Behavior

If loaded authority does not explicitly define the requested protocol behavior, output exactly:

```text
NOT DEFINED IN SAPDP.md
```
