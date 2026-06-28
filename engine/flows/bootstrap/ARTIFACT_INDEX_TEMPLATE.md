# ARTIFACT_INDEX_TEMPLATE

## Purpose

Artifact discovery index for a SAPDP Product Repository.

Provides the authoritative registry of artifacts that currently exist in the repository.

Used for:

```
Artifact Discovery

Artifact Navigation

Required Load Set Resolution

Lifecycle Continuity
```

---

## Artifact Registry

### Bootstrap Artifacts

Artifact Name:
PROJECT_STATE.md

Artifact Type:
Lifecycle State Authority

Artifact Path:
PROJECT_STATE.md

Status:
Created

---

Artifact Name:
PROJECT_BOOTSTRAP.md

Artifact Type:
Bootstrap Metadata Authority

Artifact Path:
PROJECT_BOOTSTRAP.md

Status:
Created

---

Artifact Name:
ARTIFACT_INDEX.md

Artifact Type:
Artifact Discovery Authority

Artifact Path:
ARTIFACT_INDEX.md

Status:
Created

---

Artifact Name:
ROUTE_MANIFEST.md

Artifact Type:
Route Manifest Authority

Artifact Path:
ROUTE_MANIFEST.md

Status:
Created

---

Artifact Name:
BOOTSTRAP_RESULT.md

Artifact Type:
Bootstrap Result

Artifact Path:
BOOTSTRAP_RESULT.md

Status:
Created

---

Artifact Name:
POST_BOOTSTRAP_ENTRY.md

Artifact Type:
Bootstrap Entry Package

Artifact Path:
POST_BOOTSTRAP_ENTRY.md

Status:
Created

---

Artifact Name:
SAPDP.md

Artifact Type:
Protocol Snapshot

Artifact Path:
docs/protocol/SAPDP.md

Status:
Created

---

Artifact Name:
SAPDP_SOURCE_VERSION.md

Artifact Type:
Protocol Version Record

Artifact Path:
docs/protocol/SAPDP_SOURCE_VERSION.md

Status:
Created

---

## Protocol Version Visibility

Detected Protocol Version:
<RESOLVED_PROTOCOL_VERSION>

Latest Stable Version:
<LATEST_STABLE_VERSION>

Protocol Source:
GitHub URL

Version Lock:
true

`latest` must resolve to the concrete Detected Protocol Version before Bootstrap writes artifact state.

Detected Protocol Version must derive from SAPDP.md or the resolved protocol Git ref.

After Version Lock is true, normal operation must not re-check latest tag or repeat version detection output.

Version mismatch between artifact index references and PROJECT_STATE.md runtime records means BLOCKED.

---

## Authority

ARTIFACT_INDEX.md is the Artifact Discovery Authority.

PROJECT_STATE.md is the Lifecycle State Authority.

ROUTE_MANIFEST.md is the Route Manifest Authority.

Route Manifest ownership is:

```text
Codex owns route generation.

ChatGPT owns route consumption.
```

Only artifacts that currently exist may be recorded.

Bootstrap must not register future lifecycle artifacts.

Lifecycle stages are responsible for registering artifacts they create.

---

## Update Rule

When a new artifact is created:

```
Register artifact name

Register artifact type

Register artifact path

Register artifact status
```

in ARTIFACT_INDEX.md.

Route metadata must be recorded in ROUTE_MANIFEST.md, not duplicated as artifact discovery state.

---

## Notes

Bootstrap creates the initial Artifact Index.

Bootstrap registers only Bootstrap-created artifacts.

Bootstrap creates the initial Route Manifest.

The following stages must update ARTIFACT_INDEX.md when creating new artifacts:

```text
Problem Stage
Solution Stage
Product Representation Stage
Product Requirement Stage
UX Specification Stage
Visual Design Specification Stage
MVP Definition Stage
Task Package Stage
Build Stage
Verification Stage
Validation Stage
Release Stage
```

---

## Status

Frozen Candidate
