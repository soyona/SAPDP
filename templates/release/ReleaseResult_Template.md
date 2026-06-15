# ReleaseResult Template

## Document Information

| Item | Value |
|--------|--------|
| Artifact Type | Release Result |
| Owner | Human |
| Producer | Human |
| Lifecycle Stage | Release |
| Status | Template |

---

# Purpose

Determine whether the current product version should be released.

This artifact exists to produce the final release decision.

This artifact does not perform:

- Implementation Verification
- User Validation

It consumes the results of those activities.

---

# Inputs

Implementation Verification Result

User Validation Result

---

# Outputs

Lifecycle Closure

---

# Required Load Set

PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

Implementation Verification Result

User Validation Result

Decision Log

---

# Artifact Routing

Route Manifest:
ROUTE_MANIFEST.md

Route Role:
Release decision to lifecycle closure handoff

Producer:
Human

Consumer:
Git

Next Action:
Persist release decision and close lifecycle.

Audit Source:
ReleaseResult_CORE_v1.md

---

# Release Summary

## Release Scope

<RELEASE_SCOPE>

---

## Release Version

<RELEASE_VERSION>

---

# Release Decision

## Decision

<Released | Released With Limitations | Release Deferred | Release Rejected>

---

## Reason

<DECISION_REASON>

---

# Implementation Verification Summary

<IMPLEMENTATION_VERIFICATION_SUMMARY>

---

# User Validation Summary

<USER_VALIDATION_SUMMARY>

---

# Known Limitations

<KNOWN_LIMITATIONS>

---

# Release Risks

<RELEASE_RISKS>

---

# Required Follow-up Actions

<FOLLOW_UP_ACTIONS>

---

# Acceptance Criteria

A valid Release Result must satisfy:

- Release scope identified
- Release version identified
- Release decision produced
- Decision reason documented
- Verification summary included
- Validation summary included
- Known limitations documented
- Release risks documented

---

# Status

Draft
