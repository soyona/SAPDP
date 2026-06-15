# SAPDP Migration Guide v1.5.0 to v1.6.0

Theme:
Context Routing Optimization

---

## Who Should Migrate

Migrate if a SAPDP product repository was initialized before v1.6.0 and does not contain:

```text
ROUTE_MANIFEST.md
```

---

## Migration Contract

This migration is backward compatible.

It does not require:

```text
New runtime
CLI
Database
Lifecycle stage changes
Artifact directory changes
```

---

## Required Migration Patch

Add a new file at the product repository root:

```text
ROUTE_MANIFEST.md
```

Initialize it from:

```text
engine/bootstrap/ROUTE_MANIFEST_TEMPLATE.md
```

Register it in:

```text
ARTIFACT_INDEX.md
```

Recommended registry entry:

```text
Artifact Name:
ROUTE_MANIFEST.md

Artifact Type:
Route Manifest Authority

Artifact Path:
ROUTE_MANIFEST.md

Status:
Created
```

---

## Migration Steps

1. Open the product repository in Codex.
2. Confirm the existing v1.5.0 Route Card or POST_BOOTSTRAP_ENTRY.md.
3. Create ROUTE_MANIFEST.md from the v1.6.0 template.
4. Populate Current Route from the latest Route Card.
5. Populate Artifact Routes with the latest accepted artifact and next action.
6. Register ROUTE_MANIFEST.md in ARTIFACT_INDEX.md.
7. Commit the migration.
8. Return Commit URL, Tests, and Result.

---

## Ownership After Migration

```text
Codex owns route generation.

ChatGPT owns route consumption.
```

ChatGPT should read ROUTE_MANIFEST.md when recovering route context.

Codex should update ROUTE_MANIFEST.md when repository state changes.

---

## PASS Criteria

```text
ROUTE_MANIFEST.md exists.
ARTIFACT_INDEX.md registers ROUTE_MANIFEST.md.
PROJECT_BOOTSTRAP.md remains Runtime Authority.
ARTIFACT_INDEX.md remains Artifact Discovery Authority.
Latest Route Card remains valid.
No lifecycle stage was added.
No runtime, CLI, or database was added.
```

---

## Migration Result

```text
MIGRATION GUIDE:
COMPLETE
```
