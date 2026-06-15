# POST_BOOTSTRAP_ENTRY.md Template

## Purpose

This template is the direct user handoff from Project Bootstrap to the first SAPDP Lifecycle Stage.

It must clearly answer:

- Where is the project?
- What should I open in Codex?
- What should I upload to ChatGPT?
- What exact ChatGPT prompt should I use?
- What is the current stage?
- What artifact should be created next?
- Is Git remote validation pending?

POST_BOOTSTRAP_ENTRY.md does not own Lifecycle Stage rules.

Lifecycle Stage rules are owned by:

```text
SAPDP_LIFECYCLE.md
```

---

## Bootstrap Summary

```text
Project:
<PROJECT_NAME>

Project Root:
<PROJECT_ROOT>

Working Directory:
<WORKING_DIRECTORY>

Local Bootstrap Result:
<LOCAL_BOOTSTRAP_PASS | LOCAL_BOOTSTRAP_FAIL>

Remote Git Validation:
<REMOTE_VALIDATION_PASS | REMOTE_VALIDATION_PENDING | REMOTE_VALIDATION_FAIL>

Overall Stage Entry:
<PROBLEM_STAGE_ALLOWED | PROBLEM_STAGE_BLOCKED>
```

---

## Codex Workspace Handoff

Open or switch Codex workspace to:

```text
<PROJECT_ROOT>
```

Use this initialized product directory as the active workspace.
Do not continue product implementation from the SAPDP protocol repository.
Codex must not continue product work from the SAPDP protocol repository.

---

## ChatGPT Handoff

Recommended ChatGPT Project:

```text
<PROJECT_NAME>
```

Required Upload Files:

```text
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
```

Start Prompt:

```text
Load SAPDP from:
https://github.com/soyona/SAPDP

Audit this initialized SAPDP product project.

Project:
<PROJECT_NAME>

Required audit inputs:
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
Product repository file tree

Task:
Perform SAPDP Bootstrap audit and confirm whether the project may enter Problem Stage.
```

---

## Problem Stage Entry

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

---

## Remote Git Validation

### If Remote Validation Passed

```text
Remote Git Validation:
REMOTE_VALIDATION_PASS

Remote:
<origin-url>

Verified Commit:
<commit-hash>
```

### If Remote Validation Is Pending

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

Remote validation pending is a traceability limitation, not a local Bootstrap failure.

---

## Final Decision

Use separate state lines.

```text
Final Decision:
<LOCAL_BOOTSTRAP_PASS | LOCAL_BOOTSTRAP_FAIL>
<PROBLEM_STAGE_ALLOWED | PROBLEM_STAGE_BLOCKED>
<REMOTE_VALIDATION_PASS | REMOTE_VALIDATION_PENDING | REMOTE_VALIDATION_FAIL>
```

Do not output a plain FAIL when local Bootstrap succeeds and only remote Git validation is pending.

---

## Runtime Completion Block Required After Problem Artifact Acceptance

After ProblemDefinition_CORE_v1.md is accepted, ChatGPT must produce:

```text
Current Stage:
Problem

Produced Artifact:
ProblemDefinition_CORE_v1.md

Stage Result:
ACCEPTED

Next Stage:
Solution

Required Load Set:
ProblemDefinition_CORE_v1.md
SolutionDefinition_Template.md

Execution Environment:
ChatGPT

Need New Session:
No

Next Action:
Generate SolutionDefinition_CORE_v1.md
```
