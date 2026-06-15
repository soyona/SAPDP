# ImplementationVerificationResult Template

## Document Information

| Item | Value |
|--------|--------|
| Artifact Type | Implementation Verification Result |
| Owner | ChatGPT |
| Producer | ChatGPT |
| Lifecycle Stage | Implementation Verification |
| Status | Frozen |

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

# Artifact Routing

Route Manifest:
ROUTE_MANIFEST.md

Route Role:
Implementation Verification to User Validation or Codex Patch handoff

Producer:
ChatGPT

Consumer:
ChatGPT or Codex

Next Action:
Route to User Validation on PASS or Codex patch on PATCH REQUIRED.

Audit Source:
ImplementationVerification_CORE_v1.md and Build commit URL

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
<n>

Tests:
PASS / FAIL / NOT RUN

Result:
PASS / PATCH REQUIRED / FAIL

ChatGPT Audit:
<Commit URL>
```

If origin is missing, Codex must provide the local commit SHA and exact push commands instead of Commit URL.

Implementation Verification must use Commit URL before asking the Human to paste files.

---

# Completion Route Card

Implementation Verification completion must output one Route Card.

For PASS:

```text
Route

Current:
Implementation Verification · ChatGPT · <Project> Project · CURRENT session

Done:
Implementation Verification Result: PASS

Next:
User Validation · ChatGPT · <Project> Project · CURRENT session

Action:
Prepare User Validation decision using the verified Commit URL.

Audit:
<Commit URL>
```

For PATCH REQUIRED:

```text
Route

Current:
Implementation Verification · ChatGPT · <Project> Project · CURRENT session

Done:
Implementation Verification Result: PATCH REQUIRED

Next:
Build · Codex · <absolute product workspace> · REUSE_EXISTING session

Action:
Patch the implementation findings in Codex.

Start:
Open <absolute product workspace>, load <Commit URL>, and patch the listed findings only.

Audit:
<Commit URL>

Expected output:
Commit URL
Tests
Result
```

If Git state is unavailable, route to Human or Git with one executable action to supply or create the required audit source.

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

Frozen
