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

11. Push committed Git state

12. Execute Bootstrap Validation against committed and pushed Git state

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

Pushed to Git
```

before ChatGPT audit.

Runtime-only artifacts are invalid audit inputs.

ChatGPT must audit committed Git repository state only.

Local empty directories are invalid scaffold evidence unless they contain committed .gitkeep persistence files.

After any Codex task, Codex must not stop until:

```text
git status --short
```

returns clean and remote verification proves the expected commit, tag, and files exist.

---

## Success Criteria

Bootstrap is successful only when Codex reports:

```text
Bootstrap Audit Result:
PASS
```

and verifies:

```text
Project Name Resolution

Project Identity Consistency

Scaffold Conformance

Scaffold Persistence

Canonical Lifecycle Progress UI
```

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

## Post-Bootstrap ChatGPT Session Handoff

After Bootstrap PASS, the bootstrap result must explicitly tell the user how to start or continue the ChatGPT session.

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

After Bootstrap PASS, the bootstrap result must explicitly tell the user how to switch Codex to the initialized product project directory.

The handoff must include this exact Codex workspace switch instruction:

```text
Open or switch Codex workspace to:

<Project Root>

Use this initialized project directory as the active workspace.
Do not continue product implementation from the SAPDP protocol repository.
Codex must not continue product work from the SAPDP protocol repository.
```

## Expected Next Action After Bootstrap

After Bootstrap PASS, follow:

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
