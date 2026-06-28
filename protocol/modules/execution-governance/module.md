# Execution Governance Module

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=execution-governance
component_id=entry
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Purpose

Own cross-flow execution state, readiness, closure, handoff, progress, and findings behavior.

## Authority Map

- `design.md` owns governance data structures and invariants.
- `runtime.md` owns readiness, transition, handoff, and output behavior.

## Consumers

All registered Flows and executable Modules.

## Boundary

This Module does not own Flow-specific stages or business rules. A Flow owns its stages; this Module owns the shared rules used to execute them.
