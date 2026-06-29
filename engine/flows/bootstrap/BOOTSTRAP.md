# Bootstrap Execution Guide

This file is non-authoritative. The registered Bootstrap Flow owns behavior.

## Execution

1. Resolve the Product Repository and Product Name.
2. Resolve one SAPDP version, commit, and Authority Digest.
3. Write `SAPDP.lock`.
4. Create required Product Development directories and `.gitkeep` files.
5. Copy the thirteen stage templates from the locked ref.
6. Create a static README.
7. Commit only generated Bootstrap files.
8. Validate the scaffold.
9. Stop before creating Problem Definition.

Bootstrap does not create lifecycle state, route, index, result, handoff, or
protocol snapshot files.

## Result

```text
RESULT:
PASS | PATCH REQUIRED | FAIL

PROTOCOL:
<resolved version>

PROJECT_DIR:
<absolute product repository>

NEXT:
CREATE docs/problem/ProblemDefinition_CORE_v1.md
```
