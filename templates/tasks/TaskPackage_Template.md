# TaskPackage Template

## Document Information

| Item | Value |
| --- | --- |
| Artifact Type | Task Package |
| Owner | ChatGPT |
| Producer | ChatGPT |
| Lifecycle Stage | Task Package |
| Status | Template |

---

<!-- SAPDP Stage Contract Start -->
stage_schema=sapdp-product-stage-v1
stage=Task Package
input_artifact=docs/mvp/MVPDefinition_CORE_v1.md
input_commit=<MVP_DEFINITION_ARTIFACT_COMMIT>
conclusion_status=DRAFT
<!-- SAPDP Stage Contract End -->

---

# Purpose

Define a token-efficient implementation package that Codex can execute without
redesigning approved product artifacts.

# Inputs

MVP Definition

# Outputs

Build Result

# Execution Method

<EXECUTION_METHOD>

# Invocation

<EXACT_INVOCATION>

# Task

<ONE_SENTENCE_TASK>

# Input References

<ARTIFACT_PATHS_AND_COMMITS>

# Scope

## Must Do

<REQUIRED_WORK>

## Must Not Do

<OUT_OF_SCOPE_WORK>

# Dependencies

<TASK_DEPENDENCIES>

# Constraints

<IMPLEMENTATION_CONSTRAINTS>

# Acceptance Checks

1. <CHECK>
2. <CHECK>
3. <CHECK>

# Validation

<EXACT_VALIDATION_COMMANDS>

# Output Contract

```text
BuildResult_CORE_v1.md
Implementation Commit
Test Evidence
```

# Rules

- Use artifact paths, section identifiers, and commits instead of pasted
  upstream documents.
- Include only context required for implementation.
- Preserve unrelated changes.
- Do not redesign frozen product artifacts.
- Acceptance checks must be concrete and executable.
- Output evidence must not be fabricated.

# Status

Draft
