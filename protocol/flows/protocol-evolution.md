# Protocol Evolution Flow

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=protocol-evolution
component_id=main
schema=sapdp-authority-v1
depends_on=module|execution-governance|repository-evolution
<!-- SAPDP Authority Metadata End -->

## Scope

This is the core authority for changing SAPDP behavior, authority, repository governance, and protocol automation. Stage components own only their registered stage contracts.

## Fixed Flow

1. Evolution Definition - ChatGPT
2. Design - ChatGPT
3. Design Audit - ChatGPT
4. Design Freeze - ChatGPT
5. Materialization - Codex
6. Repository Audit - ChatGPT
7. Release - Codex

No stage may be added, removed, reordered, or skipped implicitly.

## Stage Authority

```text
stage_authority=1|flow|protocol-evolution|evolution-definition
stage_authority=2|flow|protocol-evolution|design
stage_authority=3|flow|protocol-evolution|design-audit
stage_authority=4|flow|protocol-evolution|design-freeze
stage_authority=5|flow|protocol-evolution|materialization
stage_authority=6|flow|protocol-evolution|repository-audit
stage_authority=7|flow|protocol-evolution|release
```

Each record resolves exactly one Registry tuple from the same Git ref. Missing, duplicate, conflicting, or cyclic stage closure returns `BLOCKED STAGE_AUTHORITY_INVALID`.

## Status

Initial entry, explicit status, and blockers render:

```text
SAPDP Protocol Evolution Status

Target Version:
UNFROZEN | <vX.Y.Z>

Progress:
<completed>/<total>

Flow:
<seven stages with environment and state>

Next:
<stage or blocker>
```

Other responses use one compact status line plus the active stage contract. States are completed, current, revision-required, blocked, and not-started.

Target Version is `UNFROZEN` before Design Freeze. Design Freeze sets it exactly.

## Next

`next` evaluates active-stage readiness. PASS executes the next stage in the same response or task. Failure returns one blocker. A frozen Codex stage executes only through its exact invocation.

`next` never bypasses audit, approval, repository state, exact authority, or script requirements.

## Rework

- Design Audit FAIL returns to Design.
- Materialization implementation mismatch returns to Materialization.
- Repository Audit design defect returns to Design.
- Repository drift requires a new Repository Audit.
- A failed candidate requires a new Design Freeze based on that candidate.

## Repository Capabilities

```text
Context:         ./scripts/sapdp-context
Materialization: ./scripts/sapdp-materialize
Audit:           ./scripts/sapdp-audit
Release:         ./scripts/sapdp-release
Validation:      ./scripts/sapdp-validate
```

Scripts implement mechanical contracts and do not decide design, governance, version classification, transitions, or finding disposition.

## Completion

Protocol Evolution completes only when the released tag points to the Repository Audit-approved commit, Freeze and Authority Digests verify, remote evidence resolves, no blocker remains, and Release returns the Tag URL.
