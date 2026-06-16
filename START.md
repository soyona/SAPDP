# Start SAPDP

[START.md](./START.md) is the entry document only.

Current Protocol Version:
v1.6.4

Latest Stable Version:
v1.6.4

Version Detection Rules:

```text
Latest Stable Version = highest semantic tag in Git.
If Protocol Version is omitted, resolve to Latest Stable Version.
If Protocol Version is `latest`, resolve to Latest Stable Version.
If Protocol Version is specified as a tag, pin that exact tag.
`latest` must resolve to a concrete tag at runtime before execution continues.
Protocol Load Output must include Protocol Version, Latest Stable Version, Protocol Source, Current Stage, State Source, and Next Action.
ChatGPT and Codex must both display the resolved Protocol Version.
State Source is PROJECT_STATE.md.
Missing PROJECT_STATE.md means BLOCKED.
Version mismatch between docs or state files means BLOCKED.
```

Transition Review Rule:

```text
Continue, Next, Next Step, Proceed, 进入下一阶段, 下一步, and 继续 must read PROJECT_STATE.md, run Transition Review, execute the authoritative Next Action, or block transition.
```

Bootstrap Version Detection Output:

```text
Detected Protocol Version:
<resolved version>

Latest Stable Version:
<repo latest tag>

Protocol Source:
GitHub URL
```

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

Protocol Version:
latest

Project Name:
<ProjectName>
```

If Protocol Version is omitted, SAPDP resolves it to Latest Stable Version.

If Protocol Version is specified, SAPDP pins that exact tag, such as:

```text
Protocol Version:
v1.6.3
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

[engine/SAPDP_CANONICAL_PROTOCOL.md](./engine/SAPDP_CANONICAL_PROTOCOL.md)

For lifecycle stages, inputs, outputs, and gates, use:

[engine/SAPDP_LIFECYCLE.md](./engine/SAPDP_LIFECYCLE.md)

---

# Current Stage

For a new product:

```text
Problem
```

For an existing product, read:

```text
PROJECT_BOOTSTRAP.md
PROJECT_STATE.md
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
