# SAPDP Product DNA

Product DNA is a Protocol Asset used to replicate world-class product experience.

The DNA Library belongs to the SAPDP Protocol Repository. Official entries live under `dna/library/`, use the Product DNA template, and become selectable only after DNA Governance Release Audit passes.

## Selection

Product DNA Selection consumes an approved Problem and Solution and returns exactly one Selected DNA. A Human may select directly from the library or request a recommendation under `contracts/DNA_Recommendation_Contract.md`.

Single DNA Policy rejects:
- Multi DNA
- DNA Mixing
- DNA Composition

## Responsibility

The Human selects DNA and may propose DNA Evolution. The Human does not design DNA, define the DNA schema, or define the replication standard. SAPDP governance owns those responsibilities.

## Technology Neutrality

DNA MUST NOT prescribe a framework, language, database, or technology stack. DNA MUST define interaction constraints, experience constraints, implementation constraints, and execution constraints.

## Mandatory Structure

Every official Product DNA entry MUST use exactly these seven sections, in this order:

1. Experience Pattern
2. Layout Pattern
3. Visual Tokens
4. Component Rules
5. Interaction / Motion Rules
6. Do / Do Not Rules
7. Evidence References

Visual Tokens MUST be executable parameters. Each token must state an explicit value, a unit or format where applicable, and the scope or state in which it applies. Descriptive prose without executable parameter values is invalid.

Evidence References is mandatory. Every extracted pattern, token, and rule must map to an evidence identifier and an official source reference. Missing Evidence References blocks DNA Governance Release Audit.

## Consumption

The Selected DNA is mandatory from Product Representation through User Validation. See `contracts/DNA_Consumption_Contract.md`.

## Governance

```text
Reality Validation
↓
Issue
↓
Proposal
↓
Design Audit
↓
Materialization
↓
Release Audit
↓
Reality Validation
```

Governance keeps official DNA assets stable, auditable, technology-neutral, and suitable for low-token replication.
