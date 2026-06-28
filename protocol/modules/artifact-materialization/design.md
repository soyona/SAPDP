# Artifact Materialization Design

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=artifact-materialization
component_id=design
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Purpose

Define the executable contract for materializing a Frozen Artifact into a repository target without Artifact Drift.

## Scope

This contract applies only when a ChatGPT to Codex handoff uses:

```text
Action: Materialize
```

Action: Materialize is the protocol action for frozen artifact materialization tasks only.

Materialization is exact reproduction of a Frozen Artifact into a repository target.

The source of truth is the Frozen Artifact only.

## Allowed Actions

Codex may only:

```text
Read source
Write target
Verify equality
Report result
```

## Forbidden Actions

Codex must not:

```text
Generate
Rewrite
Improve
Refactor
Normalize
Summarize
Expand
Compress
Complete missing sections
Reorganize structure
```

## Materialization Audit

Materialization Audit verifies:

```text
Frozen Artifact == Repository Artifact
```

The only allowed Materialization Audit results are:

```text
PASS
FAIL
```

## Materialization Commit Gate

Only `Action: Materialize` requires Materialization Audit PASS before commit.

This commit gate is not global.

## Repair Rule

On FAIL, replace the repository artifact with the Frozen Artifact exactly.

Do not regenerate.

## Stop Conditions

Stop when any of the following occur:

```text
Missing frozen source
Missing target path
Equality audit fail
```
