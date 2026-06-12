# POST_BOOTSTRAP_ENTRY.md Template

## Purpose

This template defines the actionable handoff from Project Bootstrap to the first SAPDP Lifecycle Stage.

Bootstrap is not operationally complete unless this file clearly tells the user how to continue after Bootstrap PASS.

POST_BOOTSTRAP_ENTRY.md does not own Lifecycle Stage rules.

Lifecycle Stage rules are owned by:

```text
SAPDP_LIFECYCLE.md
```

POST_BOOTSTRAP_ENTRY.md only instantiates the Bootstrap Completion Handoff for the current project.

---

## Bootstrap Result

```text
Bootstrap Audit Result:
<PASS | FAIL>
```

---

## Current Stage

```text
Problem
```

---

## Next Lifecycle Stage Entry

```text
Problem
```

---

## Execution Environment

```text
ChatGPT
```

---

## Required Load Set

The following files must be available in the ChatGPT project session:

```text
PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

BOOTSTRAP_RESULT.md

POST_BOOTSTRAP_ENTRY.md

ProblemDefinition_Template.md
```

---

## Required Template

```text
ProblemDefinition_Template.md
```

---

## Artifact To Create

```text
ProblemDefinition_CORE_v1.md
```

---

## Exact Next User Action

Open a ChatGPT SAPDP project session and input:

```text
Load SAPDP Project

Project:
<ProjectName>

Current Stage:
Problem

Required Load Set:
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
ProblemDefinition_Template.md

Task:
Generate ProblemDefinition_CORE_v1.md using ProblemDefinition_Template.md.

Rules:
1. Focus only on problem definition.
2. Do not enter solution design.
3. Do not enter MVP scope.
4. Do not enter UI design.
5. Output complete Markdown.
6. After generation, provide Runtime Completion Block.
```

---

## Expected Output

```text
ProblemDefinition_CORE_v1.md
```

---

## Runtime Update Target

```text
PROJECT_BOOTSTRAP.md
```

---

## Runtime Completion Block Required

After ProblemDefinition_CORE_v1.md is accepted, ChatGPT must produce:

```text
Current Stage:
Problem

Produced Artifact:
ProblemDefinition_CORE_v1.md

Stage Result:
PASS

Next Stage:
Solution

Required Load Set:
ProblemDefinition_CORE_v1.md
SolutionDefinition_Template.md

Execution Environment:
ChatGPT

Need New Session:
No

Next Action:
Generate SolutionDefinition_CORE_v1.md
```

---

## Next Stage After Completion

```text
Solution
```