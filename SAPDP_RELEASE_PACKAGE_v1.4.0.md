# SAPDP Release Package v1.4.0

Release Name:
Environment Handoff System

Release Scope:
Protocol handoff behavior only.

This release does not add lifecycle stages, artifacts, status models, or template directories.

---

## Problem

After product bootstrap succeeds, SAPDP must clearly tell the user where the next stage is executed.

Users must not infer whether the next action belongs in ChatGPT, a ChatGPT Project, a new session, the current session, Codex, Git, or Human execution.

---

## Change

SAPDP now requires an environment-aware handoff for stage completion.

Required handoff fields:

```text
Environment:
ChatGPT | Codex | Git | Human

Project:
<project name>

Session:
NEW | CURRENT | REUSE_EXISTING

Startup:
<exact next-session bootstrap prompt or N/A>

Action:
<one executable next action>
```

The preferred concise lifecycle navigation form is:

```text
Current:
<stage>

Done:
<artifact/result>

Environment:
<next environment>

Session:
<NEW | CURRENT | REUSE_EXISTING>

Action:
<one executable next action>
```

The full lifecycle must not be output unless explicitly requested.

---

## Bootstrap to Problem Handoff

After product Bootstrap PASS, Codex final output must use:

```text
Bootstrap Handoff

Project:
<Name>

Commit URL:
<remote product commit URL>

Environment:
ChatGPT

ChatGPT Project:
<Name>

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
<absolute product root>

Result:
PASS | PATCH REQUIRED | FAIL

Do not continue product implementation from the SAPDP protocol repository.
```

Problem Stage is executed in ChatGPT by default.

New product bootstrap recommends creating a ChatGPT Project named after the product.

If a product-bound ChatGPT Project already exists, reuse it.

Remote Commit URL remains the default audit source.

Uploading bootstrap files is fallback only.

Codex implementation must continue from the initialized product workspace, not from the SAPDP protocol repository.

---

## Validation Checklist

```text
No lifecycle stages added.
No artifacts added.
No status models added.
No template directory structure changes.
Bootstrap to Problem handoff includes Environment, ChatGPT Project, Session, Startup, Action, Workspace, Result.
Problem Stage is assigned to ChatGPT.
New product flow recommends creating a product-named ChatGPT Project.
Commit URL remains the default audit source.
Upload files are fallback only.
Codex workspace boundary sentence remains.
Final handoff is concise and does not reintroduce verbose A-F output.
Git-first audit rules from v1.3.2 remain intact.
```
