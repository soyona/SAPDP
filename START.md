# Start SAPDP

START.md is the entry document only.

It tells a Human or AI where to begin. It does not own governance rules, workflow rules, lifecycle definitions, protocol implementation details, or status models.

---

# Load SAPDP

Use the SAPDP repository:

```text
https://github.com/soyona/SAPDP.git
```

To initialize a new product project in Codex, paste:

```text
Initialize a new project using SAPDP.

Protocol:
https://github.com/soyona/SAPDP.git

Project Name:
<ProjectName>
```

If Project Name is omitted, SAPDP uses:

```text
NewProduct
```

---

# Required Files

For product bootstrap audit, use the product Commit URL first.

If no remote product commit exists, use the local commit SHA and exact push commands from the Bootstrap Handoff.

File upload is fallback only:

```text
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
Product repository file tree
```

For protocol rules, use:

```text
engine/SAPDP_CANONICAL_PROTOCOL.md
```

For lifecycle stages, inputs, outputs, and gates, use:

```text
engine/SAPDP_LIFECYCLE.md
```

---

# Current Stage

For a new product:

```text
Problem
```

For an existing product, read:

```text
PROJECT_BOOTSTRAP.md
POST_BOOTSTRAP_ENTRY.md
```

---

# Next Action

For a new product after successful bootstrap:

```text
Create ProblemDefinition_CORE_v1.md using templates/problem/ProblemDefinition_Template.md.
```

Codex must continue from the product project root shown in the Bootstrap Handoff.

Do not continue product implementation from the SAPDP protocol repository.

For an existing product:

```text
Follow the Action field in the latest Minimal Stage Navigation Handoff or POST_BOOTSTRAP_ENTRY.md.
```
