# Artifact Materialization Runtime

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=artifact-materialization
component_id=runtime
schema=sapdp-authority-v1
depends_on=module|execution-governance|design
depends_on=module|execution-governance|entry
depends_on=module|execution-governance|runtime
<!-- SAPDP Authority Metadata End -->

## Inputs

- Approved or frozen content
- Exact target paths
- Explicit constraints
- Validation commands
- Required return contract

## Execution

1. Validate inputs and repository reality.
2. Reject missing decisions, ambiguous paths, and scope expansion.
3. Write only approved paths.
4. Run required validation.
5. Return the exact required result or one blocker.

## Path Gate

- Added, modified, deleted, and moved paths must be explicitly allowed.
- A move is one deleted path plus one added path.
- Existing unrelated changes must not be staged.
- `git add --all` is prohibited for governed materialization.

## Repair

Repair uses the same approved content and path scope. A repair must not silently redesign the artifact.

## Stop Conditions

Return `BLOCKED` for missing authority, missing frozen input, path mismatch, validation failure, repository drift, or an unresolved Human decision.
