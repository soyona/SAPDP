# Start SAPDP

START.md is the entry document only.

It tells a Human or AI where to begin. It does not own governance rules, workflow rules, lifecycle definitions, protocol implementation details, or status models.

---

# Load SAPDP

Use the SAPDP repository:

```text
https://github.com/soyona/SAPDP.git
```

## Product Development Mode

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

## Protocol Evolution Mode

To start or resume a SAPDP protocol upgrade, use:

```text
Load SAPDP

Mode:
Protocol Evolution
```

Protocol Evolution mode starts or resumes SAPDP protocol upgrade flow.

It does not start product development flow.

It does not change product bootstrap behavior.

Protocol Evolution uses:

```text
Reality Validation
↓
Issue
↓
Proposal
↓
Design Audit
↓
Codex Upgrade
↓
Release Audit
↓
Freeze
↓
Reality Validation
```

---

# Required Files

For product bootstrap audit, use the product Commit URL first.

If no remote product commit exists, use the local commit SHA and exact push commands from the Bootstrap Route Card.

File upload is fallback only:

```text
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
ROUTE_MANIFEST.md
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
ROUTE_MANIFEST.md
POST_BOOTSTRAP_ENTRY.md
```

---

# Next Action

For a new product after successful bootstrap:

```text
Create or use a ChatGPT Project named <ProjectName>, start a NEW session in that project, use the Start prompt from the Bootstrap Route Card, and create ProblemDefinition_CORE_v1.md.
```

Codex must continue from the product project root shown in the Bootstrap Route Card.

Do not continue product implementation from the SAPDP protocol repository.

For an existing product:

```text
Follow the Current, Next, Action, Start, and Audit fields in ROUTE_MANIFEST.md, the latest Route Card, or POST_BOOTSTRAP_ENTRY.md.
```

Every stage completion must show only the current transition by default.

Use the full route map only when explicitly requested.

Codex owns route generation.

ChatGPT owns route consumption.
