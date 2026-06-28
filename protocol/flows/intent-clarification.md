# Intent Clarification Flow

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=intent-clarification
component_id=main
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Entry

Enter when:

- the Human selects the uncertainty entry;
- Router input does not match an explicit route;
- structured Goal normalization fails;
- required routing information is ambiguous.

## Behavior

Ask one minimal Human question that distinguishes the valid registered routes. Do not infer product scope, DNA Type, repository identity, version, or execution intent.

## Output

```text
HUMAN_INPUT: <one missing routing decision>
```

When the answer resolves exactly one registered route, return control to the root Router. Otherwise ask one further minimal clarification.

## Stop

Intent Clarification never creates product artifacts, edits repositories, enters a lifecycle stage, or fabricates a target authority.
