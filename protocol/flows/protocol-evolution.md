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

Core authority for SAPDP behavior, authority, governance, and automation changes. Registered stage components own their stage contracts.

## Fixed Flow

1. Evolution Definition - ChatGPT
2. Design - ChatGPT
3. Design Audit - ChatGPT
4. Design Freeze - ChatGPT
5. Materialization - Codex
6. Repository Audit - ChatGPT
7. Release - Codex

Stages cannot be added, removed, reordered, or skipped implicitly.

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

Each record resolves one same-ref Registry tuple. Invalid closure returns `BLOCKED STAGE_AUTHORITY_INVALID`.

## Status

Initial entry, status requests, and blockers render:

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

Otherwise use one compact status line plus the active contract. States: completed, current, revision-required, blocked, not-started. Target is `UNFROZEN` until Design Freeze.

## Next and Rework

`next` checks readiness; PASS executes the next stage. Failure returns one blocker. Frozen Codex work uses its exact invocation. Nothing bypasses audit, approval, repository state, or authority.

- Design Audit FAIL -> Design.
- Implementation mismatch -> Materialization.
- Design defect -> Design.
- Remote drift -> Repository Audit.
- Failed candidate -> new Design Freeze based on that candidate.

## Capabilities

```text
Context: ./scripts/sapdp-context
Materialization: ./scripts/sapdp-materialize
Audit: ./scripts/sapdp-audit
Release: ./scripts/sapdp-release
Validation: ./scripts/sapdp-validate
```

Scripts perform mechanics, not design, governance, version classification, transitions, or disposition.

## Completion

Complete only when the remote tag targets the audited commit, Freeze and Authority Digests verify, remote evidence resolves, no blocker remains, and Release returns the Tag URL.
