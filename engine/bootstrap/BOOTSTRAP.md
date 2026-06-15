# SAPDP Bootstrap Entry

## Purpose

This file is the human-readable Bootstrap entry point for Codex.

It tells Codex:

    Where to start

    What to read

    What to execute

    What not to do

    What to produce

    When to stop

---

## Human Pre-Bootstrap Checklist

Before running Bootstrap, Human must prepare:

    Product Repository

    SAPDP Repository Access

Optional:

    Project Name

Project Name is initialization metadata only.

If Project Name is omitted:

    NewProduct

must be used as the default Project Name.

Project Name must be resolved before creating Project Root.

Project Root must be derived only from Project Name.

Project Root must not be derived from:

    Prompt Name

    Conversation Name

    Task Name

    Workspace Name

Project Name must not be used to infer:

    Product Idea

    Problem Statement

    Target User

    Solution Direction

    MVP Scope

---

## Codex Bootstrap Command

Human may give Codex the following command:

    Read SAPDP bootstrap/BOOTSTRAP.md.

    Bootstrap this Product Repository according to bootstrap/bootstrap_manifest.json.

    Use Project Name if provided.

    Resolve Project Root from Project Name only.

    Do not create product artifacts.

    Do not implement product code.

    Do not enter Lifecycle execution.

    Stop after BOOTSTRAP_RESULT.md and POST_BOOTSTRAP_ENTRY.md are created.

    Run Bootstrap Validation.

    Run Bootstrap Productionization Audit.

    Produce Bootstrap Completion Output Contract.

---

## Required Reading Order

Codex must read Bootstrap sources in this order:

    1. bootstrap/BOOTSTRAP.md

    2. bootstrap/bootstrap_manifest.json

    3. contracts/bootstrap/BootstrapContract.md

    4. contracts/bootstrap/BootstrapValidationContract.md

    5. SAPDP_CANONICAL_PROTOCOL.md

    6. templates/

---

## Authority Map

    bootstrap/BOOTSTRAP.md
    =
    Codex Bootstrap Entry Guide

    bootstrap/bootstrap_manifest.json
    =
    Bootstrap Configuration Authority

    contracts/bootstrap/BootstrapContract.md
    =
    Bootstrap Execution Authority

    contracts/bootstrap/BootstrapValidationContract.md
    =
    Bootstrap Validation Authority

    PROJECT_BOOTSTRAP.md
    =
    Product Runtime Authority

    ARTIFACT_INDEX.md
    =
    Artifact Discovery Authority

---

## Execution Rule

Codex must execute Bootstrap according to:

    contracts/bootstrap/BootstrapContract.md

Codex must configure Bootstrap according to:

    bootstrap/bootstrap_manifest.json

Codex must validate Bootstrap according to:

    contracts/bootstrap/BootstrapValidationContract.md

If these sources conflict:

    Stop Bootstrap

    Return FAIL only when local Bootstrap cannot safely continue.

    If the conflict is limited to unavailable or unconfigured remote Git verification, return REMOTE_VALIDATION_PENDING and continue local Bootstrap validation.

    Record conflict in BOOTSTRAP_RESULT.md

---

## Forbidden Actions Summary

Codex must not:

    Create product lifecycle artifacts

    Create product source code

    Infer product requirements

    Infer target users

    Infer solution direction

    Infer MVP scope

    Modify the SAPDP Repository

    Create a second protocol repository

    Advance beyond Problem Stage

    Skip Bootstrap Validation

---

## Required Outputs

Bootstrap must produce:

    PROJECT_BOOTSTRAP.md

    ARTIFACT_INDEX.md

    BOOTSTRAP_RESULT.md

    POST_BOOTSTRAP_ENTRY.md

    docs/protocol/SAPDP_CANONICAL_PROTOCOL.md

    docs/protocol/SAPDP_SOURCE_VERSION.md

    Required directories

    Required templates

Bootstrap must not leave Bootstrap internal execution directories in the final Product Project Root.

---

## Stop Condition

Codex must stop when:

    BOOTSTRAP_RESULT.md exists

    POST_BOOTSTRAP_ENTRY.md exists

    Bootstrap Validation has produced PASS, PATCH REQUIRED, or FAIL

Codex must not continue into:

    Problem Definition

    Solution Definition

    MVP Definition

    Build

---

## Next Human Action

After Bootstrap stops, Human must provide the Bootstrap result to ChatGPT for audit.

Required audit inputs:

    BOOTSTRAP_RESULT.md

    POST_BOOTSTRAP_ENTRY.md

    PROJECT_BOOTSTRAP.md

    ARTIFACT_INDEX.md

    Product Repository file tree

After ChatGPT audit returns PASS:

    Human may accept Bootstrap.

    Product development may enter Problem Stage.

If ChatGPT audit confirms LOCAL_BOOTSTRAP_PASS with REMOTE_VALIDATION_PENDING:

    Human may enter Problem Stage if Overall Stage Entry is PROBLEM_STAGE_ALLOWED.

    Human should complete remote validation separately.

If ChatGPT audit returns PATCH REQUIRED:

    Human should request a Bootstrap Patch.

If ChatGPT audit returns FAIL:

    Human should stop Product development entry and recover Bootstrap.

---

## Status

Frozen Candidate

---

## Bootstrap Completion Output Contract

Codex final output after initialization must contain these sections in this order:

```text
A. Bootstrap Summary
B. ChatGPT Handoff
C. Codex Workspace Handoff
D. Problem Stage Entry
E. Remote Git Validation
F. Final Decision
```

### A. Bootstrap Summary

```text
Project:
<Project Name>

Project Root:
<absolute project root>

Working Directory:
<absolute working directory>

Local Bootstrap Result:
LOCAL_BOOTSTRAP_PASS or LOCAL_BOOTSTRAP_FAIL

Remote Git Validation:
REMOTE_VALIDATION_PASS or REMOTE_VALIDATION_PENDING or REMOTE_VALIDATION_FAIL

Overall Stage Entry:
PROBLEM_STAGE_ALLOWED or PROBLEM_STAGE_BLOCKED
```

### B. ChatGPT Handoff

```text
Recommended ChatGPT Project:
<Project Name>

Required Upload Files:
- PROJECT_BOOTSTRAP.md
- ARTIFACT_INDEX.md
- BOOTSTRAP_RESULT.md
- POST_BOOTSTRAP_ENTRY.md

Start Prompt:

Load SAPDP from:
https://github.com/soyona/SAPDP

Audit this initialized SAPDP product project.

Project:
<Project Name>

Required audit inputs:
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
Product repository file tree

Task:
Perform SAPDP Bootstrap audit and confirm whether the project may enter Problem Stage.
```

### C. Codex Workspace Handoff

```text
Open or switch Codex workspace to:

<Project Root>

Use this initialized product directory as the active workspace.
Do not continue product implementation from the SAPDP protocol repository.
```

### D. Problem Stage Entry

```text
Current Stage:
Problem

Next Artifact:
ProblemDefinition_CORE_v1.md

Template:
templates/problem/ProblemDefinition_Template.md

Next Action:
Create ProblemDefinition_CORE_v1.md.
```

### E. Remote Git Validation

If no origin remote exists, output:

```text
Remote Git Validation:
REMOTE_VALIDATION_PENDING

Reason:
No origin remote is configured.

To complete remote validation:

git remote add origin <your-product-repo-url>
git push -u origin main

Then rerun Bootstrap Validation.
```

### F. Final Decision

Do not output a single ambiguous Bootstrap Result when local scaffold succeeds but remote Git validation is pending.

Correct:

```text
Final Decision:
LOCAL_BOOTSTRAP_PASS
PROBLEM_STAGE_ALLOWED
REMOTE_VALIDATION_PENDING
```

Incorrect:

```text
Bootstrap Audit Result:
FAIL
```

---

## Remote Git Validation Rule

If Local Bootstrap Result is LOCAL_BOOTSTRAP_PASS and all required bootstrap artifacts exist, then Problem Stage may be allowed even when Remote Git Validation is REMOTE_VALIDATION_PENDING.

Remote validation pending must be treated as a traceability limitation, not as local Bootstrap failure.
