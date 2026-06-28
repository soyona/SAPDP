# Goal System Module

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=goal-system
component_id=entry
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Purpose

Own deterministic normalization and resolution of structured SAPDP Goals after root invocation classification.

## Authority Map

- `design.md` owns Goal categories and mapping design.
- `runtime.md` owns resolution and execution binding.

## Implementation

`engine/router/goal-library.md` and `engine/modules/goal-system/` are non-authoritative runtime assets.

## Boundary

Root `SAPDP.md` owns Home and Intent Router entry. Goal System consumes the routed Goal and must not invent a Flow or fallback outside root rules.
