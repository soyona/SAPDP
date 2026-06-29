# Execution Governance - Repository Evolution

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=execution-governance
component_id=repository-evolution
schema=sapdp-authority-v1
depends_on=module|execution-governance|runtime
<!-- SAPDP Authority Metadata End -->

## Consumer

Protocol Evolution only.

## References

- Stages 1-4: `base_commit_reference`
- Stage 5: `candidate_commit_reference`
- Stages 6-7: `audited_commit_reference`

References are full available commit SHAs.

## Findings

Runtime State resolves an existing local registry, which may be Git-ignored.

- Every finding has ID, source stage, status, severity, finding, evidence, and timestamp.
- OPEN BLOCKER blocks transition.
- OPEN MAJOR may enter Design but blocks Design Audit PASS and Freeze.
- Freeze copies final findings to immutable evidence and declares its raw-byte SHA-256.
- Stages 5-7 verify that snapshot and digest.

## Closure

```text
flow: Protocol Evolution
stage: <stage>
execution_status: PASS | FAIL | BLOCKED
commit_reference: <profile-valid SHA>
timestamp: <ISO-8601>
findings_registry: <runtime path>
```

PASS requires the correct reference, registry, recorded findings, valid schema, and no prohibited severity.
