# POST_BOOTSTRAP_ENTRY.md Template

## Purpose

This template is the direct user handoff from Project Bootstrap to the first SAPDP Lifecycle Stage.

It must clearly answer:

- Where is the project?
- What should I open in Codex?
- Which environment executes the Problem Stage?
- Which ChatGPT Project and session mode should be used?
- What Startup prompt should begin the next session?
- What executable action should be performed next?
- Is Git remote validation pending?

POST_BOOTSTRAP_ENTRY.md does not own Lifecycle Stage rules.

Lifecycle Stage rules are owned by:

```text
SAPDP_LIFECYCLE.md
```

---

## Bootstrap Handoff

```text
Project:
<PROJECT_NAME>

Commit URL:
<remote product commit URL>

Environment:
ChatGPT

ChatGPT Project:
<PROJECT_NAME>

Session:
NEW

Startup:
Load SAPDP from:
https://github.com/soyona/SAPDP

Audit product commit:
<remote product commit URL>

Action:
Create ProblemDefinition_CORE_v1.md

Workspace:
<absolute project root>

Result:
PASS | PATCH REQUIRED | FAIL

Do not continue product implementation from the SAPDP protocol repository.
```

This is the required minimal Codex final output after product bootstrap.

Problem Stage is executed in ChatGPT by default.

For a new product, create a ChatGPT Project named `<PROJECT_NAME>` and start a NEW session inside that project.

If a product-bound ChatGPT Project already exists, reuse it.

Internal Bootstrap validation states must not appear in the final user-facing output.

---

## ChatGPT Audit Source

If a remote product commit exists, ChatGPT audit must use only:

```text
Commit URL:
<remote product commit URL>
```

The Commit URL in the Bootstrap Handoff is the only ChatGPT audit target.

File upload is fallback only.

If no remote product commit exists, provide:

```text
Local Commit:
<local commit SHA>

Push Commands:
git remote add origin <your-product-repo-url>
git push -u origin main
```

When no remote product commit exists, Result must not be PASS.

Fallback upload files:

```text
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
Product repository file tree
```

---

## Problem Stage Entry

```text
Current Stage:
Problem

Environment:
ChatGPT

ChatGPT Project:
<PROJECT_NAME>

Session:
NEW

Startup:
Load SAPDP from:
https://github.com/soyona/SAPDP

Audit product commit:
<remote product commit URL>

Next Artifact:
ProblemDefinition_CORE_v1.md

Template:
templates/problem/ProblemDefinition_Template.md

Next Action:
Create ProblemDefinition_CORE_v1.md.
```

---

## Git Audit State

### If Remote Product Commit Exists

```text
Remote:
<origin-url>

Commit URL:
<remote product commit URL>
```

### If Remote Product Commit Is Missing

```text
Local Commit:
<local commit SHA>

Push Commands:
git remote add origin <your-product-repo-url>
git push -u origin main
```

When the remote product commit is missing, Result must not be PASS.

---

## Final Decision

The final user-facing decision must be expressed only through the `Result:` line in the minimal Bootstrap Handoff.

```text
Result:
PASS | PATCH REQUIRED | FAIL
```

Do not show internal Bootstrap states in final user-facing output.

Do not output conflicting commit identifiers.

---

## Runtime Completion Block Required After Problem Artifact Acceptance

After ProblemDefinition_CORE_v1.md is accepted, ChatGPT must produce:

```text
Current:
Problem

Done:
ProblemDefinition_CORE_v1.md

Environment:
ChatGPT

Session:
CURRENT

Action:
Generate SolutionDefinition_CORE_v1.md
```
