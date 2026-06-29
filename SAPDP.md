# SAPDP v7.0.0 Protocol

Authority Digest: sha256:6e4a7920e5ed72fcc21b48a198bbcfc5a0c54c1770721bc629fa1e197a6d6114

<!-- Runtime Capsule Start -->
capsule_schema=sapdp-runtime-capsule-v1
version_source=first-heading
authority_digest_source=Authority Digest line
authority_registry_location=SAPDP.md
global=Committed artifacts and Git evidence drive product work; conversation memory and generated progress views are not authority.
global=Missing behavior, architecture, stages, outputs, or evidence must not be invented.
global=Progression requires the active Flow readiness and transition rules.
global=Missing or conflicting authority returns BLOCKED; behavior absent from loaded authority returns NOT DEFINED IN SAPDP.md.
mode=home|trimmed case-insensitive bare sapdp|render exact home_output and do not enter a Flow
mode=router|sapdp plus content|resolve one route before rendering; Home and Router are mutually exclusive
route=1|new-product intent|Goal starts Build|bootstrap|main
route=2|continue-product intent|Goal starts Continue|product-development|entry=continue
route=3|protocol-upgrade intent|Goal starts Upgrade SAPDP|protocol-evolution|main
route=4|Add Visual DNA|Add Product DNA|dna|add-dna
literal=generic Add DNA without type|HUMAN_INPUT: Select DNA Type
route=5|Commit URL|Commit SHA|review-commit intent|commit-audit|main
route=6|uncertainty|malformed Goal|unmatched entry|intent-clarification|main
structured=SAPDP followed by Goal: <goal>|normalize Goal before Goal System execution
structured=missing Goal content|Home
structured=ambiguous Goal content|intent-clarification|main
loading=Resolve root and every authority from one Git ref.
loading=Resolve Router target against the Authority Registry, then load core, active stage authority when declared, and exact dependency closure.
loading=Dependency keys are kind, owner ID, and component ID; reject missing, duplicate, conflicting, or cyclic closure.
loading=Do not scan repository structure or load unrelated authority.
output=SUCCESS <Category>|BLOCKED <Reason>|ERROR <Message>
output=Active Flow exact output overrides the global envelope.
output=Success requires verifiable evidence; Blocked names one missing condition; Error names execution or validation failure.
output=Exact literals must not gain explanation; silent failure and fabricated evidence are prohibited.
precedence=1 root global rules|2 routed Flow|3 explicit Module dependencies|4 non-authoritative implementation and evidence
precedence=Scope overlap is BLOCKED AUTHORITY_CONFLICT and is not repaired by precedence.
undefined=NOT DEFINED IN SAPDP.md
home_output:
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
<!-- Runtime Capsule End -->

SAPDP is a platform-neutral protocol for one Human working with AI and Git to
move from idea to validated product release through a strict committed-artifact
chain with low context cost and verifiable handoffs.

## Global Runtime Constraints

The Runtime Capsule exclusively owns the compact global execution constraints loaded at entry. Historical records and guides are not current runtime authority.

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
authority|flow|protocol-evolution|design|protocol/flows/protocol-evolution/design.md
authority|flow|protocol-evolution|design-audit|protocol/flows/protocol-evolution/design-audit.md
authority|flow|protocol-evolution|design-freeze|protocol/flows/protocol-evolution/design-freeze.md
authority|flow|protocol-evolution|evolution-definition|protocol/flows/protocol-evolution/evolution-definition.md
authority|flow|protocol-evolution|materialization|protocol/flows/protocol-evolution/materialization.md
authority|flow|protocol-evolution|release|protocol/flows/protocol-evolution/release.md
authority|flow|protocol-evolution|repository-audit|protocol/flows/protocol-evolution/repository-audit.md
authority|flow|protocol-evolution|thread-handoff|protocol/flows/protocol-evolution/thread-handoff.md
authority|module|artifact-materialization|design|protocol/modules/artifact-materialization/design.md
authority|module|artifact-materialization|entry|protocol/modules/artifact-materialization/module.md
authority|module|artifact-materialization|runtime|protocol/modules/artifact-materialization/runtime.md
authority|module|dna|design|protocol/modules/dna/design.md
authority|module|dna|entry|protocol/modules/dna/module.md
authority|module|dna|runtime|protocol/modules/dna/runtime.md
authority|module-flow|dna|add-dna|protocol/modules/dna/flows/add-dna.md
authority|module|execution-governance|design|protocol/modules/execution-governance/design.md
authority|module|execution-governance|entry|protocol/modules/execution-governance/module.md
authority|module|execution-governance|repository-evolution|protocol/modules/execution-governance/repository-evolution.md
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

The Runtime Capsule exclusively owns entry-time loading behavior. Registered stage authority and exact dependency tuples provide bounded closure without repository discovery.

## Invocation

The Runtime Capsule exclusively owns Home, Router, structured-input, route, and exact Home output behavior. Resolve `<Current Version>` from the first heading.

## Output Normalization

The Runtime Capsule exclusively owns global output envelopes and normalization. An active Flow exact output contract takes precedence within that Flow.

## Deterministic Execution

Low-value operational work uses explicit scripts and exact invocations. Codex must not spend reasoning budget discovering script names, arguments, Git order, or output shape when an owning authority defines them.

High-value reasoning is reserved for design, implementation, defect analysis, verification, and governance audit.

## Token and Context Minimization

- Default runtime mode is compressed execution.
- Load the Runtime Capsule first, then only routed core, active stage authority, and exact dependency closure.
- Use `scripts/sapdp-context` for a bounded, deterministic context bundle.
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

The Runtime Capsule exclusively owns precedence and authority-conflict behavior.

## Undefined Behavior

The Runtime Capsule exclusively owns the exact undefined-behavior output.
