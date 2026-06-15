# Start a New Project with SAPDP

## Prerequisites

You need:

```text
GitHub Repository

Codex

Access to SAPDP Repository
```

---

## SAPDP Protocol Source

Use the actual SAPDP GitHub repository URL:

```text
https://github.com/soyona/SAPDP.git
```

Example format:

```text
https://github.com/<owner>/SAPDP
```

Do not use placeholder URLs during validation.

---

## Copy Into Codex

Open a new Codex session and paste:

```text
Initialize a new project using SAPDP.

Protocol:
https://github.com/soyona/SAPDP.git

Project Name:
<MyProject>
```

If Project Name is omitted:

```text
NewProduct
```

will be used as the default project name.

Bootstrap must resolve Project Name before creating Project Root.

Project Root must be derived only from Project Name.

Project Root must not be derived from:

```text
Prompt Name

Conversation Name

Task Name

Workspace Name
```

---

## Expected Result

Codex will:

```text
1. Read SAPDP Runtime

2. Generate Project Scaffold

3. Resolve Project Root from Project Name

4. Generate README.md and .gitkeep scaffold persistence files

5. Generate Bootstrap Files

6. Generate Workspace Files

7. Generate Runtime Files

8. Generate POST_BOOTSTRAP_ENTRY.md

9. Add generated artifacts and scaffold persistence files to Git

10. Commit generated artifacts and scaffold persistence files to Git

11. Push committed Git state when an origin remote is configured

12. Execute Bootstrap Validation against local committed state and remote Git state when available

13. Execute Bootstrap Productionization Audit

14. Produce Bootstrap Completion Handoff

15. Enter Problem Stage
```

---

## Required Bootstrap Output

A successful bootstrap must produce:

```text
PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

BOOTSTRAP_RESULT.md

POST_BOOTSTRAP_ENTRY.md

README.md

.gitkeep scaffold persistence files
```

All generated Bootstrap artifacts must be:

```text
Written into repository

Added to Git

Committed to Git
```

Pushed to Git when an origin remote is configured.

Runtime-only artifacts are invalid audit inputs.

ChatGPT must audit committed repository state only.

Local empty directories are invalid scaffold evidence unless they contain committed .gitkeep persistence files.

After any Codex task, Codex must not stop until:

```text
git status --short
```

returns clean.

When an origin remote is configured, remote verification must prove the expected commit, tag, and files exist.

For product implementation tasks, Codex final output must use:

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

Codex must not include full diff, git logs, verbose summaries, or duplicated repository metadata.

Result may be PASS only when the working tree is clean and required checks passed.

When no origin remote is configured, Codex must report:

```text
Remote Git Validation:
REMOTE_VALIDATION_PENDING
```

This is a traceability limitation, not a local Bootstrap failure.

---

## Success Criteria

Bootstrap local success is represented by:

```text
Local Bootstrap Result:
LOCAL_BOOTSTRAP_PASS
```

and verifies:

```text
Project Name Resolution

Project Identity Consistency

Scaffold Conformance

Scaffold Persistence

Canonical Lifecycle Progress UI
```

Remote Git Validation is represented separately:

```text
REMOTE_VALIDATION_PASS
REMOTE_VALIDATION_PENDING
REMOTE_VALIDATION_FAIL
```

If Local Bootstrap Result is LOCAL_BOOTSTRAP_PASS and all required Bootstrap artifacts exist, Problem Stage may be allowed even when Remote Git Validation is REMOTE_VALIDATION_PENDING.

and generates an executable Bootstrap Completion Handoff:

```text
POST_BOOTSTRAP_ENTRY.md
```

POST_BOOTSTRAP_ENTRY.md must clearly define:

```text
Current Stage

Next Lifecycle Stage Entry

Execution Environment

Required Load Set

Required Template

Artifact To Create

Exact Next User Action

Expected Output

Runtime Update Target

Next Stage After Completion

Post-Bootstrap ChatGPT Session Handoff

Post-Bootstrap Codex Workspace Handoff
```

Bootstrap output is insufficient if it only says:

```text
Current Stage:
Problem

Next Action:
Create ProblemDefinition_CORE_v1.md
```

---

## Bootstrap Completion Output

A successful Bootstrap must disclose:

```text
Project Root

Working Directory

Execution Environment

Required Load Set

Codex Project Setup Guide

ChatGPT Project Setup Guide

Post-Bootstrap ChatGPT Session Handoff

Post-Bootstrap Codex Workspace Handoff
```

These fields are required by:

```text
D-0098
Bootstrap Completion System v2
```

Bootstrap PASS is operationally incomplete if these fields are missing.

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

Do not use a single ambiguous Bootstrap Result when local scaffold succeeds but remote Git validation is pending.

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

## Post-Bootstrap ChatGPT Session Handoff

After LOCAL_BOOTSTRAP_PASS with PROBLEM_STAGE_ALLOWED, the bootstrap result must explicitly tell the user how to start or continue the ChatGPT session.

The handoff must include this exact ChatGPT start prompt:

```text
Load SAPDP from:
https://github.com/soyona/SAPDP
```

For a new product, or when no product-bound ChatGPT Project exists:

```text
Create a new ChatGPT Project.

Use the initialized product project name as the ChatGPT Project name.

Upload the Required Load Set.

Start from Problem Stage.

Generate ProblemDefinition_CORE_v1.md using ProblemDefinition_Template.md.
```

## Post-Bootstrap Codex Workspace Handoff

After LOCAL_BOOTSTRAP_PASS with PROBLEM_STAGE_ALLOWED, the bootstrap result must explicitly tell the user how to switch Codex to the initialized product project directory.

The handoff must include this exact Codex workspace switch instruction:

```text
Open or switch Codex workspace to:

<Project Root>

Use this initialized project directory as the active workspace.
Do not continue product implementation from the SAPDP protocol repository.
Codex must not continue product work from the SAPDP protocol repository.
```

## Expected Next Action After Bootstrap

After LOCAL_BOOTSTRAP_PASS with PROBLEM_STAGE_ALLOWED, follow:

```text
POST_BOOTSTRAP_ENTRY.md
```

For a new project, the default next action is:

```text
Open a ChatGPT SAPDP project session and generate:

ProblemDefinition_CORE_v1.md

using:

ProblemDefinition_Template.md
```

---

## Validation Restart Rule

After a SAPDP protocol repair release, validation must restart from a clean project bootstrap.

Do not continue validation from a project created before the repair.

Use:

```text
New product

Clean workspace

Fresh Codex bootstrap

Fresh Bootstrap Audit

Fresh POST_BOOTSTRAP_ENTRY.md
```

---

## Minimal Protocol Release Audit Handoff Rule

This rule applies only to SAPDP protocol upgrade releases.

It does not change product Bootstrap behavior.

Codex may report protocol release PASS only after:

```text
1. Changes are committed
2. Commit is pushed to remote main
3. Version tag is created
4. Tag is pushed to remote
5. Remote commit and remote tag are verified
6. Final output uses the minimal Protocol Release Audit Handoff format
```

If the commit or tag is not remotely verifiable, Codex must report:

```text
Release Result:
PATCH REQUIRED
```

or:

```text
Release Result:
FAIL
```

Codex must not report protocol release PASS based only on local commits, local tags, or unverified push output.

Required final protocol release handoff format:

```text
Protocol Release Audit Handoff

Version:
vX.Y.Z

Commit URL
https://github.com/soyona/SAPDP/commit/<sha>

Tag URL
https://github.com/soyona/SAPDP/releases/tag/vX.Y.Z

Files Changed:
<n>

Release Result:
PASS / PATCH REQUIRED / FAIL

ChatGPT Audit:

Load SAPDP from:
https://github.com/soyona/SAPDP

Audit Release:
vX.Y.Z
```

Final protocol release output must not repeat:

```text
Repository

Branch

Commit SHA

Tag

Remote verification

Validation checklist

Git execution logs
```

---

## What To Do Next

Follow the exact guidance returned in:

```text
POST_BOOTSTRAP_ENTRY.md
```

SAPDP will provide:

```text
Current Stage

Execution Environment

Required Load Set

Artifact To Create

Next Action
```

Continue execution according to SAPDP.
