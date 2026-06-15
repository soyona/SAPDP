# SAPDP v1.6.0 Reality Validation Checklist

Theme:
Context Routing Optimization

---

## Bootstrap Validation

```text
[ ] Bootstrap creates ROUTE_MANIFEST.md.
[ ] ARTIFACT_INDEX.md registers ROUTE_MANIFEST.md.
[ ] PROJECT_BOOTSTRAP.md remains Runtime Authority.
[ ] ROUTE_MANIFEST.md does not duplicate runtime state.
[ ] Bootstrap final output remains a Route Card.
```

---

## Route Recovery Validation

```text
[ ] ChatGPT can recover Current Route from ROUTE_MANIFEST.md.
[ ] ChatGPT can identify Next Action without loading full artifact content.
[ ] Codex can update ROUTE_MANIFEST.md from an accepted Artifact Routing block.
[ ] Missing ROUTE_MANIFEST.md in a v1.5.0 product triggers migration, not failure.
```

---

## Artifact Template Validation

```text
[ ] Every artifact template includes Artifact Routing.
[ ] Artifact Routing block names ROUTE_MANIFEST.md.
[ ] Artifact Routing block includes Route Role.
[ ] Artifact Routing block includes Producer.
[ ] Artifact Routing block includes Consumer.
[ ] Artifact Routing block includes Next Action.
[ ] Artifact Routing block includes Audit Source.
[ ] Artifact Routing block does not redefine lifecycle rules.
```

---

## Handoff Validation

```text
[ ] Route Card still appears at every stage completion.
[ ] Full route map is not output by default.
[ ] ChatGPT to Codex handoff remains executable.
[ ] Codex to ChatGPT handoff remains audit-ready.
[ ] Human and Git exception routing remains explicit.
```

---

## Constraint Validation

```text
[ ] No new runtime introduced.
[ ] No CLI introduced.
[ ] No database introduced.
[ ] No lifecycle stage added.
[ ] No status model added.
[ ] Git-first audit remains intact.
```

---

## Reality Validation Result

```text
PASS / PATCH REQUIRED / FAIL
```
