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
[<SAPDP_GITHUB_URL>](https://github.com/soyona/SAPDP.git)
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
[<SAPDP_GITHUB_URL>](https://github.com/soyona/SAPDP.git)

Project Name:
<MyProject>
```

If Project Name is omitted:

```text
NewProduct
```

will be used as the default project name.

---

## Expected Result

Codex will:

```text
1. Read SAPDP Runtime

2. Generate Project Scaffold

3. Generate Bootstrap Files

4. Generate Workspace Files

5. Generate Runtime Files

6. Generate POST_BOOTSTRAP_ENTRY.md

7. Execute Bootstrap Audit

8. Enter Problem Stage
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