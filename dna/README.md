# SAPDP DNA

DNA is split into two non-overlapping Protocol Asset types:

- Visual DNA = How It Looks.
- Product DNA = How It Works.

## Library

New official entries live under `dna/visual/` or `dna/product/`, declare `DNA Type`, and become selectable only after DNA Governance Release Audit passes. Evidence lives under `dna/evidence/`.

Template mapping:

- New Visual DNA assets use `templates/dna/VisualDNA_Template.md`.
- New Product DNA assets use `templates/dna/ProductDNA_Template.md`.
- `templates/dna/DNA_Template.md` is backward compatibility only and must not be used for new DNA assets.

```text
dna/
├── visual/
├── product/
└── evidence/
```

The legacy `dna/library/` location remains valid for existing Product DNA assets. Existing assets do not require relocation or a `DNA Type` field. New assets must declare one of these exact values:

- `Visual DNA`
- `Product DNA`

## Selection

DNA Selection consumes an approved Problem and Solution and returns exactly one Selected Visual DNA and exactly one Selected Product DNA. A Human may select directly from the library or request a recommendation under `contracts/DNA_Recommendation_Contract.md`.

A Selected Visual DNA and a Selected Product DNA may be freely combined. The protocol does not restrict valid combinations. Multiple selections within the same DNA type are invalid.

## Visual DNA

Purpose: replicate visual appearance and UI implementation.

Primary sources: HTML, CSS, DOM, Assets, Design Tokens, and Component Libraries.

Source Of Truth is required. Every Visual DNA must declare one or more of these allowed sources:

- Official Website
- Official Product
- Official Documentation

Outputs: Visual Tokens, Layout Rules, Typography Rules, Color System, Spacing System, Component Rules, and Motion Rules.

Visual DNA is responsible for How It Looks. It is not responsible for Experience Pattern, Motivation Pattern, Retention Pattern, or Progression Pattern.

## Product DNA

Purpose: replicate product experience and behavioral mechanisms.

Primary sources: Official Product, Official Documentation, Official Help Center, and Real Usage Observation.

Outputs: Experience Pattern, Interaction Pattern, Motivation Pattern, Retention Pattern, and Progression Pattern.

Product DNA is responsible for How It Works. It is not responsible for Color System, Typography Rules, Visual Tokens, Layout Rules, or Component Visual Design.

Visual DNA and Product DNA must not overlap responsibilities.

## Responsibility

The Human selects DNA and may propose DNA Evolution. The Human does not design DNA, define the DNA schema, or define the replication standard. SAPDP governance owns those responsibilities.

## Technology Neutrality

DNA MUST NOT prescribe a framework, language, database, or technology stack. Visual DNA defines visual implementation constraints. Product DNA defines product experience and behavioral constraints.

## Mandatory Structure

The legacy template remains valid for existing Product DNA assets and uses these seven sections:

1. Experience Pattern
2. Layout Pattern
3. Visual Tokens
4. Component Rules
5. Interaction / Motion Rules
6. Do / Do Not Rules
7. Evidence References

Visual Tokens MUST be executable parameters. Each token must state an explicit value, a unit or format where applicable, and the scope or state in which it applies. Descriptive prose without executable parameter values is invalid.

## Consumption

The Selected Visual DNA and Selected Product DNA are mandatory from Product Representation through User Validation. See `contracts/DNA_Consumption_Contract.md`.

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
