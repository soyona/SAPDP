# SAPDP

## Quick Start

Start SAPDP with only the protocol name and a goal:

```text
SAPDP

Goal: <goal>
```

Routing is deterministic:

- `Build ...` starts Bootstrap for a new product workspace.
- `Continue ...` resumes the product lifecycle from runtime state.
- `Upgrade SAPDP` starts Protocol Evolution.

Examples:

New Product:

```text
SAPDP

Goal:
Build Student Typing Practice
```

Existing Product:

```text
SAPDP

Goal:
Continue TOBY
```

Protocol Upgrade:

```text
SAPDP

Goal:
Upgrade SAPDP
```

Advanced startup fields such as `Protocol Repo`, `Protocol Version`, and `Protocol Entry` are internal protocol metadata. Users do not need to provide them. The previous startup syntax with those fields remains supported for backward compatibility.

## What Is SAPDP

SAPDP is a platform-neutral protocol for Human, AI, and Git collaboration. It moves product work from idea to validated release through explicit artifacts, deterministic routing, and verifiable handoffs.

SAPDP keeps runtime authority in files and Git evidence rather than conversation memory. This makes continuation, auditing, and handoff behavior repeatable across sessions and tools.

## Common Scenarios

New Product:

```text
SAPDP

Goal:
Build <product name>
```

Use this when starting a new product workspace. SAPDP routes to Bootstrap, resolves the protocol version, initializes runtime state, and prepares the workspace before lifecycle artifacts are created.

Existing Product:

```text
SAPDP

Goal:
Continue <product name>
```

Use this when a SAPDP workspace already exists. SAPDP reads runtime state and returns the next executable lifecycle action or a concrete blocker.

Protocol Upgrade:

```text
SAPDP

Goal:
Upgrade SAPDP
```

Use this when improving the protocol itself. SAPDP routes to Protocol Evolution instead of product Bootstrap or product lifecycle stages.

## Lifecycle Overview

Product lifecycle stages:

1. Problem
2. Solution
3. Product Representation
4. Product Requirement
5. UX Specification
6. Visual Design Specification when required
7. MVP Definition
8. Task Package
9. Build
10. Implementation Verification
11. User Validation
12. Release

Bootstrap is prerequisite setup, not a lifecycle stage. Lifecycle progression is commit-gated: no committed, validated stage output means no transition.

## FAQ

Do I need to provide Protocol Repo, Protocol Version, or Protocol Entry?

No. These are internal protocol metadata fields. SAPDP tooling resolves and records them when needed.

Is the old startup format still valid?

Yes. Existing startup prompts that include protocol metadata and an action remain supported for backward compatibility.

What happens if my goal does not start with Build, Continue, or Upgrade SAPDP?

SAPDP asks for one clarification instead of guessing. This preserves deterministic routing.

## Advanced Usage

Backward-compatible startup format:

```text
Load SAPDP

Protocol Repo:
<repo>

Protocol Version:
<version>

Protocol Entry:
<entry>

Action:
<action>
```

Use the advanced format only when a workflow needs explicit protocol metadata. Normal product work should use:

```text
SAPDP

Goal: <goal>
```
