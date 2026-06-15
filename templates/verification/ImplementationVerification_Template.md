# ImplementationVerificationResult Template

## Document Information

| Item | Value |
|--------|--------|
| Artifact Type | Implementation Verification Result |
| Owner | ChatGPT |
| Producer | ChatGPT |
| Lifecycle Stage | Implementation Verification |
| Status | Template |

---

# Purpose

Verify that implementation matches the approved definitions and constraints.

This artifact exists to determine whether implementation is correct.

Implementation Verification must audit committed Git state before requesting pasted files from the Human.

This artifact does not evaluate:

- User Satisfaction
- Product-Market Fit
- Business Success

These subjects belong to User Validation.

---

# Inputs

Task Package

Build Artifact commit URL

MVP Definition

Technical Constraint

---

# Outputs

User Validation Result

---

# Required Load Set

PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

Task Package

Build Artifact

MVP Definition

Technical Constraint

Decision Log

---

# Codex Completion Handoff Input

Codex implementation completion must provide:

```text
Codex Completion Handoff

Project:
<name>

Commit URL:
<url>

Changed:
<n files>

Tests:
PASS / FAIL / NOT RUN

Result:
PASS / PATCH REQUIRED / FAIL

ChatGPT Audit:

Load SAPDP from:
https://github.com/soyona/SAPDP

Audit Codex result:
<Commit URL>
```

If origin is missing, Codex must provide the local commit SHA and exact push commands instead of Commit URL.

Implementation Verification must use Commit URL before asking the Human to paste files.

---

# Verification Summary

## Verification Scope

<VERIFICATION_SCOPE>

---

## Verification Result

<PASS | PATCH REQUIRED | FAIL>

---

# Scope Verification

<SCOPE_VERIFICATION>

---

# Acceptance Criteria Verification

<ACCEPTANCE_CRITERIA_VERIFICATION>

---

# Constraint Verification

<CONSTRAINT_VERIFICATION>

---

# Test Result Verification

<TEST_RESULT_VERIFICATION>

---

# Completeness Verification

<COMPLETENESS_VERIFICATION>

---

# Findings

<FINDINGS>

---

# Required Actions

<REQUIRED_ACTIONS>

---

# Verification Decision

## Decision

<PASS | PATCH REQUIRED | FAIL>

---

## Reason

<DECISION_REASON>

---

# Acceptance Criteria

A valid Implementation Verification Result must satisfy:

- Scope verified
- Acceptance criteria verified
- Constraints verified
- Test results verified
- Verification decision produced
- Findings documented

---

# Status

Draft
