# Execution Governance Design

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=execution-governance
component_id=design
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Purpose

Define the strict runtime execution gate for SAPDP stage progression.

This contract adds deterministic execution governance only. It does not change lifecycle stage order, add lifecycle phases, or redesign SAPDP architecture.

## Authority

The active Flow owns its stages and transitions. This Module owns the shared executable rules consumed by Stage Readiness Gate and validation outputs.

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
<product-workspace runtime findings path>
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

The active product workspace Runtime State resolves one current findings registry path. Protocol-repository historical findings are not product runtime authority.

Rules:
- All stage findings must be appended to the registry.
- The resolved product runtime registry is the only current findings source for that product execution.
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
