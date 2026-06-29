# ImplementationVerification Template

## Document Information

| Item | Value |
| --- | --- |
| Artifact Type | Implementation Verification Result |
| Owner | ChatGPT |
| Producer | ChatGPT + Codex evidence |
| Lifecycle Stage | Implementation Verification |
| Status | Template |

---

<!-- SAPDP Stage Contract Start -->
stage_schema=sapdp-product-stage-v1
stage=Implementation Verification
input_artifact=docs/build/BuildResult_CORE_v1.md
input_commit=<BUILD_RESULT_ARTIFACT_COMMIT>
conclusion_status=DRAFT
<!-- SAPDP Stage Contract End -->

---

# Purpose

Verify that the committed implementation matches the approved Task Package and
upstream product constraints.

# Inputs

Build Result

# Outputs

User Validation on PASS or Build rework on FAIL

# Verification Summary

## Verification Scope

<VERIFICATION_SCOPE>

## Verification Result

<PASS | FAIL>

# Scope Verification

<SCOPE_VERIFICATION>

# Acceptance Criteria Verification

<ACCEPTANCE_CRITERIA_VERIFICATION>

# Constraint Verification

<CONSTRAINT_VERIFICATION>

# Test Result Verification

<TEST_RESULT_VERIFICATION>

# Completeness Verification

<COMPLETENESS_VERIFICATION>

# Findings

<FINDINGS>

# Required Actions

<REQUIRED_ACTIONS>

# Verification Decision

## Decision

<PASS | FAIL>

## Reason

<DECISION_REASON>

# Acceptance Criteria

A valid Implementation Verification Result must satisfy:

- Build Result input commit is current
- Implementation commit and changed paths are verified
- Scope and acceptance criteria are verified
- Constraints and test results are verified
- Findings and required actions are explicit
- Verification decision is exactly PASS or FAIL

# Status

Draft
