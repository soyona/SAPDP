# SAPDP Release Package v1.5.0

Release Name:
Lifecycle Execution Routing System

Release Scope:
Lifecycle routing and handoff UX only.

This release does not add lifecycle stages, artifacts, status models, or template directories.

---

## Problem

SAPDP stage completion still left users guessing which environment should execute the next action.

Users needed explicit routing across ChatGPT, Codex, Git, and Human actions, including ChatGPT -> Codex, Codex -> ChatGPT, ChatGPT -> ChatGPT, and Human/Git exception paths.

---

## Change

Every stage completion must output one compact Route Card:

```text
Route

Current:
<stage> · <environment> · <project/session>

Done:
<artifact/result/commit>

Next:
<stage> · <environment> · <project/session>

Action:
<one executable action>

Start:
<exact prompt/command or omit if not needed>

Audit:
<commit URL or artifact path, only when needed>
```

Route Card rules:

```text
Current and Next include stage, environment, project, and session when applicable.
Environment values are ChatGPT, Codex, Git, and Human.
Session values are CURRENT, NEW, and REUSE_EXISTING.
Action is executable.
Only the current transition is shown by default.
The full route map is shown only when the user asks for it.
```

---

## Default Route Map

```text
Bootstrap: Codex -> ChatGPT, NEW session, next Problem
Problem: ChatGPT -> ChatGPT, CURRENT session, next Solution
Solution: ChatGPT -> ChatGPT, CURRENT session, next MVP
MVP: ChatGPT -> ChatGPT, CURRENT session, next Task Package
Task Package: ChatGPT -> Codex, REUSE_EXISTING product workspace, next Build
Build: Codex -> ChatGPT, CURRENT or NEW if context is heavy, next Implementation Verification
Implementation Verification: ChatGPT -> ChatGPT if PASS, ChatGPT -> Codex if PATCH REQUIRED
User Validation: ChatGPT -> Release if PASS, ChatGPT -> Codex or ChatGPT if issues
Release: ChatGPT/Codex/Git -> Release Result
```

The route map is a reference, not default output.

---

## Bootstrap Route Card

After product Bootstrap, Codex final output must use:

```text
Route

Current:
Bootstrap · Codex · <Project>

Done:
<Commit URL>

Next:
Problem · ChatGPT · <Project> Project · NEW session

Action:
Create ProblemDefinition_CORE_v1.md

Start:
Load SAPDP from:
https://github.com/soyona/SAPDP

Audit product commit:
<Commit URL>

Audit:
<Commit URL>

Workspace:
<absolute product root>

Result:
PASS
```

---

## Handoff Coverage

ChatGPT -> Codex:
Task Package routes to Build with Codex workspace, source artifact or commit URL, minimal startup instruction, and expected output of Commit URL, Tests, Result.

Codex -> ChatGPT:
Build routes to Implementation Verification with ChatGPT Project, session mode, startup prompt when NEW, audit source commit URL, and next action.

ChatGPT -> ChatGPT:
Problem, Solution, MVP, PASS verification, and normal ChatGPT continuations route with CURRENT session unless context is heavy.

Human/Git exception:
User Validation issues, missing audit sources, push/tag requirements, and other exception paths route to Human or Git with one executable action while preserving Git-first audit.

---

## Validation Checklist

```text
ChatGPT -> Codex handoff covered.
Codex -> ChatGPT handoff covered.
ChatGPT -> ChatGPT handoff covered.
Human/Git exception handoff covered.
Route Card includes current and next stage/environment/project/session.
No full lifecycle is shown by default.
No lifecycle stages added.
No artifacts added.
No status models added.
No template directory structure changes.
Git-first audit remains.
Bootstrap final handoff uses Route Card format.
```
