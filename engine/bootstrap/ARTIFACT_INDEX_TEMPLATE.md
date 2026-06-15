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
PROJECT_BOOTSTRAP.md

Artifact Type:
Runtime Authority

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
SAPDP_CANONICAL_PROTOCOL.md

Artifact Type:
Protocol Snapshot

Artifact Path:
docs/protocol/SAPDP_CANONICAL_PROTOCOL.md

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

## Authority

ARTIFACT_INDEX.md is the Artifact Discovery Authority.

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

Problem Stage, Solution Stage, MVP Stage, Build Stage, Verification Stage, Validation Stage, and Release Stage must update ARTIFACT_INDEX.md when creating new artifacts.

---

## Status

Frozen Candidate
