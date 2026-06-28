# Goal System Runtime

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=goal-system
component_id=runtime
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Pipeline

```text
Normalized Goal
→ Goal Library Match
→ Registered Authority Resolution
→ Executor
→ Verifier
→ Normalized Output
```

## Resolution

1. Trim surrounding whitespace.
2. Apply the root Router classification.
3. Match only an explicit Goal Library category.
4. Resolve the target against the SAPDP Authority Registry.
5. Bind execution to the target authority from the same Git ref.
6. Verify output against the owning authority.

## Output

```text
SUCCESS <Category>
BLOCKED <Reason>
ERROR <Message>
```

Flow-specific output contracts override this category envelope when the root Router has entered that Flow.

## Failure

- Missing category: `BLOCKED GOAL_CATEGORY_MISSING`
- Missing authority target: `BLOCKED AUTHORITY_ROUTE_INVALID`
- Invalid output: `ERROR OUTPUT_CONTRACT_INVALID`

No inference, architecture completion, or silent fallback is allowed.
