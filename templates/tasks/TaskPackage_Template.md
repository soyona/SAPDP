# TaskPackage Template

## Document Information

| Item | Value |
|--------|--------|
| Artifact Type | Task Package |
| Owner | ChatGPT |
| Producer | ChatGPT |
| Lifecycle Stage | Build |
| Status | Frozen |

---

# Purpose

Define a token-efficient implementation package that can be directly executed by Codex.

This artifact transforms approved product artifacts into one bounded implementation task.

This artifact must prefer artifact paths, commit URLs, and repository references over pasted full content.

This artifact must not include lifecycle theory or background unless required for execution.

---

# Required Format

```text
Task:
<one sentence>

Inputs:
<artifact paths or commit URLs>

Scope:
<must do>
<must not do>

Acceptance:
<3-7 checks>

Output:
Commit URL
Tests
Result
```

---

# Artifact Routing

Route Manifest:
ROUTE_MANIFEST.md

Route Role:
Task Package to Codex Build handoff

Producer:
ChatGPT

Consumer:
Codex

Next Action:
Implement the Task Package in Codex.

Audit Source:
TaskPackage_CORE_v1.md or commit URL

---

Task Package completion routes from ChatGPT to Codex.

The stage completion Route Card must include:

```text
Route

Current:
Task Package · ChatGPT · <Project> Project · CURRENT session

Done:
<TaskPackage artifact path or commit URL>

Next:
Build · Codex · <absolute product workspace> · REUSE_EXISTING session

Action:
Implement the Task Package in Codex.

Start:
Open <absolute product workspace> and execute <TaskPackage artifact path or commit URL>.

Audit:
<TaskPackage artifact path or commit URL>

Expected output:
Commit URL
Tests
Result
```

---

# Rules

- Use paths, commit URLs, and artifact names instead of pasted full artifact content.
- Include only context required for Codex execution.
- Do not include lifecycle theory.
- Avoid pasted documents, lifecycle explanations, and repeated context.
- Do not request broad implementation beyond current stage scope.
- Scope must include both required work and explicit non-goals.
- Acceptance must contain 3 to 7 concrete checks.
- Output must require Commit URL, Tests, and Result.
- The Route Card must identify Codex workspace, source artifact or commit URL, minimal Codex startup instruction, and expected output.

---

# Template

```text
Task:
<one sentence>

Inputs:
<artifact paths or commit URLs>

Scope:
Must do:
<required implementation work>

Must not do:
<out-of-scope work>

Acceptance:
1. <check>
2. <check>
3. <check>

Output:
Commit URL
Tests
Result
```

---

# Status

Frozen
