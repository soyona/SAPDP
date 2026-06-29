# Execution Governance Runtime

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=execution-governance
component_id=runtime
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Runtime State

Runtime State is authoritative for current execution and transition. Presentation and route suggestions are explanatory only.

Required state:

- Active Flow
- Current Stage
- Stage Status
- Required Inputs
- Produced Artifacts
- Evidence References
- Readiness Result
- Next Action

The active Flow resolves one exact registered governance profile. Missing, ambiguous, or unregistered profile resolution returns `BLOCKED AUTHORITY_DEPENDENCY_INVALID`.

## Readiness

A transition requires:

1. Required inputs exist.
2. Required decisions are explicit.
3. Required artifacts are committed when the Flow requires Git evidence.
4. Validation passes.
5. No blocker remains.

Profile-specific reference and findings rules are evaluated before transition.

Failure returns one concrete blocker and does not transition.

## Handoff

Every execution handoff identifies:

- execution environment;
- exact inputs and paths;
- required action;
- constraints;
- validation;
- exact output.

Codex modifies repositories only from an explicit task or frozen handoff. ChatGPT performs interpretation, design, and governance audit.

## Progress

Progress reports completed, current, blocked, revision-required, and remaining stages. Progress does not override Runtime State.

## Findings

Findings are append-only until resolved. A finding records evidence, impact, owner, disposition, and verification.

## Output

Use the output contract owned by the active Flow. Silent failure, invented success evidence, and inferred transitions are prohibited.
