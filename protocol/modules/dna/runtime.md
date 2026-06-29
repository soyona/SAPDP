# DNA Module Runtime

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=dna
component_id=runtime
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## DNA Selection

DNA Selection consumes approved Problem and Solution outputs and produces:

- exactly one Selected Visual DNA;
- exactly one Selected Product DNA;
- the resolved protocol source ref for each selection.

Visual plus Product DNA is valid. Multiple selections of either type, two selections of the same type, or a missing type are invalid.

## Product Runtime Integration

Selected Visual DNA and Selected Product DNA are mandatory inputs for:

1. Product Representation
2. Product Requirement
3. UX Specification
4. Visual Design Specification when applicable
5. MVP Definition
6. Task Package
7. Build
8. Implementation Verification
9. User Validation

Missing either selection returns `BLOCKED` before the consuming stage.

## Recommendation and Consumption

Recommendation may propose library entries but the Human selects both DNA types. Product stages consume the selected assets by reference and must not reconstruct or redefine their rules.

## Runtime State

- Selected Visual DNA
- Selected Product DNA
- Visual DNA Source Ref
- Product DNA Source Ref
- Selection Decision Evidence
- Validation Status

## Validation

- Selected files exist in `library/dna/visual/` and `library/dna/product/`.
- Types do not overlap responsibilities.
- New assets conform to the matching template and include official Evidence References.
- DNA remains technology-neutral.

## Failure

Unknown type, missing selection, invalid combination, missing asset, or invalid evidence returns one concrete blocker without advancing Product Development.
