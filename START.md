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

4. Generate Bootstrap Files

5. Generate Workspace Files

6. Generate Runtime Files

7. Generate POST_BOOTSTRAP_ENTRY.md

8. Execute Bootstrap Validation

9. Execute Bootstrap Productionization Audit

10. Produce Bootstrap Completion Handoff

11. Enter Problem Stage
```

---

## Required Bootstrap Output

A successful bootstrap must produce:

```text
PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

BOOTSTRAP_RESULT.md

POST_BOOTSTRAP_ENTRY.md
```

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
```

These fields are required by:

```text
D-0098
Bootstrap Completion System v2
```

Bootstrap PASS is operationally incomplete if these fields are missing.

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
