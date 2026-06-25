# Execution Governance Contract

## Purpose

Define the strict runtime execution gate for SAPDP stage progression.

This contract adds deterministic execution governance only. It does not change lifecycle stage order, add lifecycle phases, or redesign SAPDP architecture.

## Authority

`SAPDP.md` owns runtime state and lifecycle transition authority.

This contract defines the executable rules consumed by Stage Readiness Gate and validation outputs.

## Execution Closure Artifact

Every stage execution must produce an Execution Closure Artifact before a stage transition can be evaluated.

Required fields:

```text
schema:
ExecutionClosureArtifact/v1

flow:
<flow name>

stage:
<stage name>

execution_status:
PASS | FAIL | BLOCKED

commit_reference:
<commit URL or local commit SHA>

timestamp:
<ISO-8601 timestamp>

findings_registry:
docs/dna/validation/runtime/Runtime_Findings_Registry.md
```

Rules:
- `execution_status` values are exactly `PASS`, `FAIL`, or `BLOCKED`.
- `commit_reference` is mandatory.
- `timestamp` is mandatory.
- Missing Execution Closure Artifact blocks progression.
- Execution Closure Artifact status other than `PASS` blocks progression.
- Stage transition requires Execution Closure Artifact `PASS` only.

## Execution State Machine

Allowed execution states:

```text
ACTIVE
LOCKED
COMPLETE
FAILED
```

Transitions:

```text
ACTIVE -> COMPLETE
requires ExecutionClosureArtifact execution_status = PASS

ACTIVE -> LOCKED
requires ExecutionClosureArtifact execution_status = BLOCKED

ACTIVE -> FAILED
requires ExecutionClosureArtifact execution_status = FAIL

LOCKED -> ACTIVE
requires corrected blocking condition and resumed execution

FAILED -> ACTIVE
requires corrected failure and resumed execution
```

Rules:
- No stage skip is allowed.
- `COMPLETE` alone does not authorize the next stage unless the closure artifact status is `PASS`.
- `LOCKED` and `FAILED` require correction before continuation.

## Findings Registry

Authoritative registry:

```text
docs/dna/validation/runtime/Runtime_Findings_Registry.md
```

Rules:
- All stage findings must be appended to the registry.
- The registry is the only authoritative findings source.
- Stage-local artifacts may summarize or reference findings only.
- Findings not appended to the registry are not authoritative for progression or audit.

Minimum finding fields:

```text
finding_id:
<stable id>

source_stage:
<stage>

status:
OPEN | RESOLVED | DEFERRED

severity:
BLOCKER | MAJOR | MINOR

finding:
<concise finding>

evidence:
<artifact path, commit reference, or observed output>

timestamp:
<ISO-8601 timestamp>
```

## Schema Validation

Any validation output must strictly conform to its declared schema.

Rules:
- Missing required fields means schema validation `FAIL`.
- Extra result statuses outside the declared schema mean schema validation `FAIL`.
- Non-compliant validation output is automatic `FAIL`.
- Correction is required before continuation.

## Stage Readiness Gate Consumption

Stage Readiness Gate must verify, in order:

```text
Runtime State valid
No stage skip requested
Required artifacts exist
Required commits exist
Required Human decisions exist
Validation outputs conform to schema
All stage findings are appended to Runtime Findings Registry
Execution Closure Artifact exists
Execution Closure Artifact status is PASS
```

If any check fails, transition result is:

```text
BLOCKED
```
