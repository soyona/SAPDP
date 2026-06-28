# Goal System Design

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=goal-system
component_id=design
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Purpose

Map normalized Goals to explicit execution categories without semantic expansion.

## Categories

- Product Development
- Protocol Validation
- Protocol Audit
- Protocol Evolution
- DNA Governance
- Commit Audit
- Intent Clarification
- Adversarial Testing

## Design Rules

- Root Invocation and Router run before Goal resolution.
- Mapping is registry-based and deterministic.
- A mapped Goal binds to an existing registered Flow or Module Flow.
- Goal System must not create a missing category, Flow, Module, stage, or output.
- Unknown or malformed Goals return to root Intent Clarification.

## Implementation

- `engine/router/goal-library.md` contains non-authoritative matching data.
- `engine/modules/goal-system/entry.md`, `executor.md`, and `verifier.md` implement the runtime.
