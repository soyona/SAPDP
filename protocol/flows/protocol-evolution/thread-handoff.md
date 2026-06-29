# Protocol Evolution - Thread Handoff

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=protocol-evolution
component_id=thread-handoff
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Boundaries

Design Freeze PASS requires `design-freeze -> materialization`. Materialization PASS requires `materialization -> repository-audit`. The source thread stops after the Card; `next` re-renders it. Repository Audit PASS stays in-thread for Release. FAIL or BLOCKED never hands off.

## Contract

Exactly one ordered block is allowed:

```text
SAPDP_THREAD_HANDOFF_START
handoff_schema=sapdp-thread-handoff-v1
source_stage=<design-freeze|materialization>
target_stage=<materialization|repository-audit>
origin_url=<origin>
protocol_ref=<40-lowercase-hex>
freeze_file=<safe-relative-path>
freeze_digest=sha256:<64-lowercase-hex>
candidate_commit=<required only for repository-audit>
task=<fixed target task>
output=<fixed target output>
SAPDP_THREAD_HANDOFF_END
```

Materialization task is `Execute Protocol Evolution Materialization from the validated Design Freeze.` Its output is `Commit URL only; then emit the Repository Audit Handoff Card outside script stdout.` Repository Audit task is `Execute Protocol Evolution Repository Audit for the validated Candidate Commit.` Its output is `Repository Audit Result contract; PASS continues directly to Release in this thread.`

The new-thread prompt starts with `SAPDP`, then `Upgrade SAPDP`, then the block. It contains no prior-session dependency.

## Card

App URL order is `codex://threads/new?path=<encoded>&originUrl=<encoded>&prompt=<encoded>`. Path is the absolute repository root and disambiguates clones. Values use UTF-8 RFC 3986 encoding: only ASCII alphanumeric and `-._~` remain; percent octets are uppercase.

CLI renders `/new` plus the prompt. IDE renders New Thread plus the prompt. App links are local-machine handoffs; the prompt is portable.

Limits in raw bytes: authority 4096, prompt 2048, URL 6144, Card 8192.

## Validation

Parse errors stop in this order: `ERROR SAPDP_HANDOFF_USAGE`, `ARGUMENT_INVALID`, `TRANSITION_INVALID`, `CONTRACT_INVALID`, `ENCODING_FAILED`, `RENDER_FAILED`.

Preconditions stop in this order: `BLOCKED SAPDP_HANDOFF_ORIGIN_MISMATCH`, `REF_UNAVAILABLE`, `ROOT_AUTHORITY_INVALID`, `WORKSPACE_UNAVAILABLE`, `BRANCH_MISMATCH`, `HEAD_MISMATCH`, `REMOTE_MAIN_UNAVAILABLE`, `REMOTE_MAIN_MISMATCH`, `FREEZE_PATH_INVALID`, `FREEZE_DIGEST_MISMATCH`, `CANDIDATE_INVALID`, `TARGET_AUTHORITY_INVALID`, `BUDGET_EXCEEDED`.

Validation loads root and target-stage closure from `protocol_ref`. Materialization requires HEAD and remote main at that ref with no candidate. Repository Audit requires `candidate_commit=protocol_ref=HEAD=remote main`. Freeze path and digest always verify.

Errors and blockers are one stderr line, empty stdout, exit 1. `validate` success prints `PASS`; `render` success prints only the Card. Both are pure and idempotent. Output interruption is retried with identical inputs.
