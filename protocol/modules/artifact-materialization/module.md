# Artifact Materialization Module

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=artifact-materialization
component_id=entry
schema=sapdp-authority-v1
depends_on=module|execution-governance|design
depends_on=module|execution-governance|entry
depends_on=module|execution-governance|runtime
<!-- SAPDP Authority Metadata End -->

## Purpose

Own the conversion of frozen, approved artifact content into repository files without design interpretation.

## Authority Map

- `design.md` owns materialization boundaries and invariants.
- `runtime.md` owns execution, validation, repair, and stop behavior.

## Consumers

- Product Development
- Bootstrap
- Protocol Evolution
- DNA Add Flow

## Boundary

Materialization implements approved content. It must not create requirements, infer missing architecture, expand scope, or approve its own output.
