# DNA Module

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=dna
component_id=entry
schema=sapdp-authority-v1
depends_on=module|artifact-materialization|design
depends_on=module|artifact-materialization|entry
depends_on=module|artifact-materialization|runtime
<!-- SAPDP Authority Metadata End -->

## Purpose

Own reusable Visual DNA and Product DNA design, governed assets, selection, runtime consumption, and Add DNA governance.

## Authority Map

- `design.md` owns DNA types, schemas, evidence, boundaries, and asset rules.
- `runtime.md` owns selection, state, downstream consumption, and validation.
- `flows/add-dna.md` owns the Add DNA flow.

## Repository Ownership

```text
templates/dna/       Non-authoritative templates
library/dna/visual/  Visual DNA assets
library/dna/product/ Product DNA assets
library/dna/evidence/Official evidence for new assets
```

## Consumers

- Product Development DNA Selection
- Product Representation through User Validation
- Add DNA Flow

## Compatibility

Existing assets under `library/dna/` remain valid. Evidence is mandatory for new assets; this release does not retroactively rewrite existing assets.
