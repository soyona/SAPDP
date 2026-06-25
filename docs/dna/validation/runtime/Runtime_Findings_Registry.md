# Runtime Findings Registry

## Purpose

This registry is the only authoritative findings source for SAPDP stage execution findings.

All stage findings must be appended here. Stage-local validation artifacts may reference registry entries but must not become independent findings authorities.

## Schema

Each finding must use this schema:

```text
finding_id:
<stable id>

source_stage:
<stage>

status:
OPEN | RESOLVED | DEFERRED

severity:
BLOCKER | MAJOR | MINOR

finding:
<concise finding>

evidence:
<artifact path, commit reference, or observed output>

timestamp:
<ISO-8601 timestamp>
```

## Findings

No runtime findings recorded.
