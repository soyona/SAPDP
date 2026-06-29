# Commit Audit Flow

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=commit-audit
component_id=main
schema=sapdp-authority-v1
depends_on=module|execution-governance|design
depends_on=module|execution-governance|entry
depends_on=module|execution-governance|runtime
<!-- SAPDP Authority Metadata End -->

## Entry

Commit URL, Commit SHA, or explicit review-commit intent routes here.

## Inputs

- Repository identity
- Commit URL or SHA
- Approved task, artifact, or frozen design
- Required validation and output contract

Missing commit evidence returns `BLOCKED COMMIT_EVIDENCE_MISSING`.

## Audit

1. Resolve the exact commit.
2. Read Git Commit Diff as implementation source of truth.
3. Compare changed paths and content with approved scope.
4. Verify required tests and repository state.
5. Identify blockers, regressions, scope expansion, and missing evidence.

Do not audit from Codex narrative when Git evidence exists.

## Output

```text
Commit Audit Result:
PASS | PATCH REQUIRED | FAIL

Blockers:
None | <list>

Next:
<one action>
```

PASS means the commit matches the governing task. PATCH REQUIRED means a recoverable implementation defect exists. FAIL means evidence is invalid, scope is unauthorized, or the commit cannot be trusted.

## Rework

PATCH REQUIRED returns to the implementation owner with exact findings. A repaired commit requires a new Commit Audit.
