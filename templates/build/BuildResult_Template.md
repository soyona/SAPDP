# BuildResult Template

## Document Information

| Item | Value |
| --- | --- |
| Artifact Type | Build Result |
| Owner | Codex |
| Producer | Codex |
| Lifecycle Stage | Build |
| Status | Template |

---

<!-- SAPDP Stage Contract Start -->
stage_schema=sapdp-product-stage-v1
stage=Build
input_artifact=docs/tasks/TaskPackage_CORE_v1.md
input_commit=<TASK_PACKAGE_ARTIFACT_COMMIT>
conclusion_status=DRAFT
<!-- SAPDP Stage Contract End -->

---

# Purpose

Record verifiable implementation output for the approved Task Package.

# Inputs

Task Package

# Outputs

Implementation Verification

# Build Summary

<BUILD_SUMMARY>

# Implementation Commit

<40_LOWERCASE_HEX_COMMIT>

# Changed Paths

<CHANGED_PATHS>

# Commands Executed

<COMMANDS>

# Test Evidence

<TEST_COMMANDS_AND_RESULTS>

# Scope Conformance

<TASK_PACKAGE_SCOPE_CONFORMANCE>

# Remaining Issues

<NONE_OR_REMAINING_ISSUES>

# Acceptance Criteria

A valid Build Result must satisfy:

- Task Package input commit is current
- Implementation commit exists
- Changed paths are identified
- Required commands and tests are recorded
- Scope conformance is explicit
- Remaining issues are explicit
- No fabricated Git or test evidence is present

# Status

Draft
