# ReleaseResult Template

## Document Information

| Item | Value |
| --- | --- |
| Artifact Type | Release Result |
| Owner | Human |
| Producer | Human + Codex |
| Lifecycle Stage | Release |
| Status | Template |

---

<!-- SAPDP Stage Contract Start -->
stage_schema=sapdp-product-stage-v1
stage=Release
input_artifact=docs/validation/UserValidation_CORE_v1.md
input_commit=<USER_VALIDATION_ARTIFACT_COMMIT>
conclusion_status=DRAFT
<!-- SAPDP Stage Contract End -->

---

# Purpose

Record the approved release decision and verifiable Git release evidence.

# Inputs

User Validation PASS

# Outputs

Released product version

# Release Summary

## Release Scope

<RELEASE_SCOPE>

## Release Version

<RELEASE_VERSION>

# Human Release Approval

<HUMAN_APPROVAL_EVIDENCE>

# Release Decision

## Decision

<Released | Released With Limitations | Release Deferred | Release Rejected>

## Reason

<DECISION_REASON>

# Git Tag

<RELEASE_TAG>

# Implementation Verification Summary

<IMPLEMENTATION_VERIFICATION_SUMMARY>

# User Validation Summary

<USER_VALIDATION_SUMMARY>

# Known Limitations

<KNOWN_LIMITATIONS>

# Release Risks

<RELEASE_RISKS>

# Required Follow-up Actions

<FOLLOW_UP_ACTIONS>

# Acceptance Criteria

A valid Release Result must satisfy:

- User Validation input commit is current and PASS
- Release scope and version are identified
- Human approval is explicit
- Release decision and reason are recorded
- Git tag exists and resolves to the released commit
- Verification and validation summaries are included
- Limitations, risks, and follow-up actions are explicit

# Status

Draft
