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

# Rules

- Use paths, commit URLs, and artifact names instead of pasted full artifact content.
- Include only context required for Codex execution.
- Do not include lifecycle theory.
- Avoid pasted documents, lifecycle explanations, and repeated context.
- Do not request broad implementation beyond current stage scope.
- Scope must include both required work and explicit non-goals.
- Acceptance must contain 3 to 7 concrete checks.
- Output must require Commit URL, Tests, and Result.

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
