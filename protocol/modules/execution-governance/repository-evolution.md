# Execution Governance - Repository Evolution

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=execution-governance
component_id=repository-evolution
schema=sapdp-authority-v1
depends_on=module|execution-governance|runtime
<!-- SAPDP Authority Metadata End -->

## Consumers

Protocol Evolution only.

## Commit Reference

- Evolution Definition, Design, Design Audit, and Design Freeze use `base_commit_reference`.
- Materialization uses `candidate_commit_reference`.
- Repository Audit and Release use `audited_commit_reference`.

Each reference is a full commit SHA available in the repository.

## Findings

Runtime State resolves one local registry path. The path may be ignored by Git but must exist for readiness.

- Every finding has a stable ID, source stage, status, severity, finding, evidence, and timestamp.
- OPEN BLOCKER blocks every transition.
- OPEN MAJOR may enter Design but blocks Design Audit PASS and Design Freeze.
- Design Freeze copies the final registry to immutable historical evidence.
- The Freeze declares the snapshot path and raw-byte SHA-256.
- Materialization, Repository Audit, and Release verify the snapshot and digest.

## Closure

Required fields:

```text
flow: Protocol Evolution
stage: <stage>
execution_status: PASS | FAIL | BLOCKED
commit_reference: <profile-valid SHA>
timestamp: <ISO-8601>
findings_registry: <runtime path>
```

PASS requires the correct reference class, existing registry, all stage findings recorded, schema-valid output, and no severity prohibited at that stage.
