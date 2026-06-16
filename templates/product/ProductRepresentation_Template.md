# ProductRepresentation Template

## Document Information

| Item | Value |
|--------|--------|
| Artifact Type | Product Representation |
| Owner | ChatGPT |
| Producer | ChatGPT |
| Lifecycle Stage | Product Representation |
| Status | Template |

---

# Purpose

Define the overall product structure.

This artifact exists to transform product requirements into a coherent product representation.

This artifact must not define:

- UX Design
- Visual Design
- Technical Design
- MVP Definition
- Build Plan

---

# Inputs

Product Requirement

---

# Outputs

UX Specification

Visual Design Specification

Technical Constraint

MVP Definition

Product Classification:

```text
Functional Product
or
Experience Product
```

Default Experience Product categories:

```text
Educational Products
Children Products
Consumer Apps
Games
Story-based Products
World-building Products
Growth Systems
Exploration Products
Community Products
```

Visual Design Requirement:

```text
Mandatory for Experience Product.
Optional for Functional Product unless visual judgment is required for validation.
```

---

# Required Load Set

PROJECT_STATE.md

PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

Problem Definition

Solution Definition

Product Requirement

Decision Log

---

# Artifact Routing

Route Manifest:
ROUTE_MANIFEST.md

Route Role:
Product Representation to UX, Visual, Technical, and MVP planning handoff

Producer:
ChatGPT

Consumer:
ChatGPT

Next Action:
Generate UXSpecification_CORE_v1.md, classify visual design requirement, generate VisualDesignSpecification_CORE_v1.md when required, and generate TechnicalConstraint_CORE_v1.md.

Audit Source:
ProductRepresentation_CORE_v1.md

---

# Product Overview

## Product Name

<PRODUCT_NAME>

---

## Product Description

<PRODUCT_DESCRIPTION>

---

# Product Structure

<PRODUCT_STRUCTURE>

---

# Core User Flows

<CORE_USER_FLOWS>

---

# Functional Domains

<FUNCTIONAL_DOMAINS>

---

# Information Structure

<INFORMATION_STRUCTURE>

---

# External Interfaces

<EXTERNAL_INTERFACES>

---

# Product Boundary

## In Scope

<IN_SCOPE>

---

## Out Of Scope

<OUT_OF_SCOPE>

---

# Assumptions

<ASSUMPTIONS>

---

# Acceptance Criteria

A valid Product Representation must satisfy:

- Product structure defined
- Core user flows identified
- Functional domains identified
- Information structure defined
- Scope boundary defined
- No UX specification included
- No visual design included
- No technical implementation included
- No MVP scope included

---

# Status

Draft
