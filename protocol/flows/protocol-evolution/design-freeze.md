# Protocol Evolution - Design Freeze

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=protocol-evolution
component_id=design-freeze
schema=sapdp-authority-v1
depends_on=architecture|repository|root
depends_on=flow|protocol-evolution|thread-handoff
<!-- SAPDP Authority Metadata End -->

## Required Handoff

- Base Commit SHA
- Current Version
- Target Version
- Upgrade Goal
- Approved Behavior Changes
- Runtime Compatibility Baseline
- Frozen Files
- Required Changes
- Validation
- Constraints
- Commit Message
- Execution Method
- Exact Invocation
- Output

Repository reality, remote `origin/main`, current release, and target-tag absence are verified immediately before Freeze.

## Evidence

Write immutable candidate evidence to:

```text
docs/history/protocol-evolution/<target-version>/design-freeze.md
docs/history/protocol-evolution/<target-version>/findings.md
```

Both files state they are non-authoritative historical evidence.

## Frozen Payload

The payload is bounded by:

```text
<!-- Frozen Payload Start -->
<key=value records>
<!-- Frozen Payload End -->
```

Repeated keys are allowed for approved behavior changes, Frozen Files, required changes, validation, and constraints. Payload values are data and must not be sourced, evaluated, or executed.

Freeze Digest is SHA-256 over exact payload bytes between markers, including the final newline and excluding marker lines. Declared, calculated, and externally supplied digests must match.

Frozen Files are relative, `LC_ALL=C` sorted, unique, explicit, and include both sides of moves. The Freeze and findings snapshot paths are Frozen Files.

The findings snapshot raw-byte SHA-256 is declared in the payload. Every finding has a final disposition; OPEN BLOCKER or MAJOR findings block Freeze.

## Version Policy

- PATCH: backward-compatible correction with no required consumer change.
- MINOR: backward-compatible capability or optional contract addition.
- MAJOR: incompatible stage, required field, invocation, authority, loading, or runtime contract change.

Only an immutable Git tag releases a version. A released version cannot be reused.

## Thread Boundary

PASS sets Target Version, emits the Materialization Handoff Card, and stops the source thread. The v5.0.0 to v6.0.0 migration alone runs the frozen Materialization invocation once in the current thread because the base Runtime Capsule cannot locate the Registry in a fresh bounded-loader thread.
