# SAPDP Release Package v1.6.0

Release Name:
Context Routing Optimization

Release Scope:
Route manifest, route ownership, artifact routing metadata, bootstrap generation, and migration guidance.

This release does not add lifecycle stages, runtime services, CLIs, databases, or status models.

---

## Problem

SAPDP v1.5.0 Route Cards made each stage handoff explicit, but route recovery still depended on the latest visible handoff output or POST_BOOTSTRAP_ENTRY.md.

When context grew, ChatGPT needed a compact persistent source for the current route without loading the full artifact graph.

---

## Change

SAPDP v1.6.0 introduces:

```text
ROUTE_MANIFEST.md

Artifact Routing Block

Route Manifest ownership rules

Bootstrap route manifest generation

v1.5.0 to v1.6.0 migration guide
```

---

## Ownership

```text
Codex owns route generation.

ChatGPT owns route consumption.
```

ROUTE_MANIFEST.md records route metadata only.

It does not replace:

```text
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
SAPDP_LIFECYCLE.md
Route Card
```

---

## Artifact Routing Block

Every artifact template now includes:

```text
Route Manifest:
ROUTE_MANIFEST.md

Route Role:
<how this artifact participates in routing>

Producer:
<Human | ChatGPT | Codex | Git>

Consumer:
<Human | ChatGPT | Codex | Git>

Next Action:
<one executable action after this artifact is accepted>

Audit Source:
<artifact path or commit URL>
```

---

## Backward Compatibility

Existing v1.5.0 Route Cards remain valid.

Missing ROUTE_MANIFEST.md in existing product repositories is a migration condition, not a lifecycle failure.

---

## Release Notes

```text
Added ROUTE_MANIFEST.md template.
Defined Codex route generation ownership.
Defined ChatGPT route consumption ownership.
Added Artifact Routing Block to all artifact templates.
Updated ARTIFACT_INDEX_TEMPLATE.md to register ROUTE_MANIFEST.md.
Updated SAPDP_CANONICAL_PROTOCOL.md route rules.
Updated SAPDP_LIFECYCLE.md Bootstrap to Problem entry.
Updated Bootstrap templates, contracts, and manifest.
Added migration guide from v1.5.0 to v1.6.0.
Added consistency audit report.
Added reality validation checklist.
Generated release patch.
```

---

## Release Result

```text
Release:
v1.6.0

Result:
PASS
```
