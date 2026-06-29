# Execution Governance Runtime

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=execution-governance
component_id=runtime
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Runtime State

Required:

- Active Flow
- Current Stage
- Stage Status
- Required Inputs
- Produced Artifacts
- Evidence References
- Readiness Result
- Next Action

The Flow resolves one exact registered governance profile. Missing or ambiguous profile returns `BLOCKED AUTHORITY_DEPENDENCY_INVALID`.

## Readiness

Transition requires:

1. inputs exist;
2. decisions are explicit;
3. required Git evidence exists;
4. validation passes;
5. profile reference and findings rules pass;
6. no blocker remains.

Failure returns one blocker without transition.

## Handoff

Identify environment, exact inputs and paths, action, constraints, validation, and output. Codex modifies repositories only from an explicit task or frozen handoff; ChatGPT interprets, designs, and audits.

## Progress and Findings

Progress reports completed, current, blocked, revision-required, and remaining stages without overriding Runtime State.

Findings stay recorded through resolution with evidence, impact, owner, disposition, and verification.

## Output

Use the active Flow contract. Silent failure, invented evidence, and inferred transition are prohibited.
