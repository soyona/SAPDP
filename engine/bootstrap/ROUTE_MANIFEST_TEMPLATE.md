# ROUTE_MANIFEST.md Template

## Purpose

Persistent route manifest for a SAPDP Product Repository.

Provides the current routing context needed to move between SAPDP environments without reloading the full artifact graph.

Used for:

```text
Route Recovery

Route Consumption

Context Routing Optimization

Stage Handoff Continuity
```

---

## Authority Boundary

ROUTE_MANIFEST.md is the Route Manifest Authority.

It records:

```text
Current Route

Next Route

Detected Protocol Version

Latest Stable Version

Protocol Source

Artifact Routing Blocks

Route Audit Source

Route Update Timestamp
```

It does not own:

```text
Runtime State

Artifact Discovery

Artifact Existence

Lifecycle Stage Rules

Artifact Formats
```

Authority remains:

```text
PROJECT_STATE.md
=
Lifecycle State Authority

PROJECT_BOOTSTRAP.md
=
Bootstrap Metadata Authority

ARTIFACT_INDEX.md
=
Artifact Discovery Authority

SAPDP_LIFECYCLE.md
=
Lifecycle Authority
```

---

## Ownership

Codex owns route generation.

ChatGPT owns route consumption.

Rules:

```text
Codex creates ROUTE_MANIFEST.md during Bootstrap.

Codex updates ROUTE_MANIFEST.md after Codex-executed stages and implementation handoffs.

ChatGPT reads ROUTE_MANIFEST.md to consume the current route.

ChatGPT may propose route updates in lifecycle artifacts through Artifact Routing Blocks.

Codex persists accepted route updates into ROUTE_MANIFEST.md when repository state is changed.
```

Human may inspect or approve routing decisions but does not manually maintain ROUTE_MANIFEST.md by default.

---

## Current Route

```text
Current:
Bootstrap · Codex · <PROJECT_NAME>

Detected Protocol Version:
<RESOLVED_PROTOCOL_VERSION>

Latest Stable Version:
<LATEST_STABLE_VERSION>

Protocol Source:
GitHub URL

Done:
<remote product commit URL or local bootstrap artifact set>

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

Audit:
<remote product commit URL or fallback local commit SHA>

State Source:
PROJECT_STATE.md

Workspace:
<absolute project root>

Result:
PASS | PATCH REQUIRED | FAIL
```

---

## Artifact Routes

### Bootstrap

```text
Artifact:
POST_BOOTSTRAP_ENTRY.md

Route Role:
Bootstrap to Problem handoff

Producer:
Codex

Consumer:
ChatGPT

Next Action:
Create ProblemDefinition_CORE_v1.md

Audit Source:
<remote product commit URL or fallback local commit SHA>
```

---

## Update Rule

When a lifecycle artifact is accepted or a Codex task completes, update ROUTE_MANIFEST.md with:

```text
Current route

Next route

Artifact name

Artifact path

Producer

Consumer

Executable next action

Audit source

Updated timestamp
```

Do not paste full artifact content into ROUTE_MANIFEST.md.

Use artifact paths, commit URLs, and compact route metadata.

---

## Backward Compatibility

If ROUTE_MANIFEST.md is missing in a pre-v1.6.0 Product Repository:

```text
Use PROJECT_STATE.md for lifecycle state.

Use PROJECT_BOOTSTRAP.md for Bootstrap metadata.

Use ARTIFACT_INDEX.md for artifact discovery.

Use the latest Route Card or POST_BOOTSTRAP_ENTRY.md for immediate handoff.

Create ROUTE_MANIFEST.md during migration or the next Codex repository update.
```

Missing ROUTE_MANIFEST.md must not invalidate existing v1.5.0 Route Cards.

---

## Status

Frozen
