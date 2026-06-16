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
- What lifecycle state source should be loaded?
- Where is the route manifest?
- Is Git remote validation pending?

POST_BOOTSTRAP_ENTRY.md does not own Lifecycle Stage rules.

Lifecycle Stage rules are owned by:

```text
SAPDP_LIFECYCLE.md
```

---

## Bootstrap Route Card

```text
Route

Current:
Bootstrap · Codex · <PROJECT_NAME>

Detected Protocol Version:
<RESOLVED_PROTOCOL_VERSION>

Latest Stable Version:
<LATEST_STABLE_VERSION>

Protocol Source:
GitHub URL

Done:
<remote product commit URL>

Next:
Problem · ChatGPT · <PROJECT_NAME> Project · NEW session

Action:
Create ProblemDefinition_CORE_v1.md

Start:
Load SAPDP from:
https://github.com/soyona/SAPDP

Protocol Version:
<RESOLVED_PROTOCOL_VERSION>

Latest Stable Version:
<LATEST_STABLE_VERSION>

Audit product commit:
<remote product commit URL>

State Source:
PROJECT_STATE.md

Audit:
<remote product commit URL>

Workspace:
<absolute project root>

Result:
PASS | PATCH REQUIRED | FAIL

Do not continue product implementation from the SAPDP protocol repository.
```

This is the required minimal Codex final output after product bootstrap.

Problem Stage is executed in ChatGPT by default.

ChatGPT must load `PROJECT_STATE.md` before deciding whether to execute the next action or allow a lifecycle transition.

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

The Commit URL in the Bootstrap Route Card is the only ChatGPT audit target.

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
ROUTE_MANIFEST.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
Product repository file tree
```

---

## Route Manifest

```text
ROUTE_MANIFEST.md
=
Route Manifest Authority

Codex owns route generation.

ChatGPT owns route consumption.
```

ChatGPT must read ROUTE_MANIFEST.md when it needs to recover the current route without reloading the full artifact graph.

---

## Problem Stage Entry

```text
Route

Current:
Bootstrap · Codex · <PROJECT_NAME>

Detected Protocol Version:
<RESOLVED_PROTOCOL_VERSION>

Latest Stable Version:
<LATEST_STABLE_VERSION>

Protocol Source:
GitHub URL

Done:
<remote product commit URL>

Next:
Problem · ChatGPT · <PROJECT_NAME> Project · NEW session

Action:
Create ProblemDefinition_CORE_v1.md

Start:
Load SAPDP from:
https://github.com/soyona/SAPDP

Protocol Version:
<RESOLVED_PROTOCOL_VERSION>

Latest Stable Version:
<LATEST_STABLE_VERSION>

Audit product commit:
<remote product commit URL>

Audit:
<remote product commit URL>
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

The final user-facing decision must be expressed only through the `Result:` line in the minimal Bootstrap Route Card.

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
Route

Current:
Problem · ChatGPT · <PROJECT_NAME> Project · CURRENT session

Done:
ProblemDefinition_CORE_v1.md

Next:
Solution · ChatGPT · <PROJECT_NAME> Project · CURRENT session

Action:
Generate SolutionDefinition_CORE_v1.md
```
