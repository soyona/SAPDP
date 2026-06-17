# Reference Authorities System Addendum

This file defines the Reference Authorities System addendum for SAPDP v2.

Historical release context: introduced in v2.4.0.

The active consolidated protocol remains `SAPDP.md`. This addendum is limited to the approved Reference Authorities System and does not redesign protocol structure.

---

# Reference Authorities System

Reference Authorities are named external product references used to align product, requirement, UX, visual design, and MVP decisions against recognizable product models.

Reference Authorities are guidance references only. They do not replace current protocol authority, product artifacts, Human decisions, or acceptance criteria.

---

# Authority Selection

Product Representation must support Reference Authorities.

Each Product Representation may define:

- Primary Authority: exactly 1
- Secondary Authorities: 1 to 3

Authority selections must identify the authority name and the product behavior, model, or quality being referenced.

---

# Authority Loading

Authorities are not part of the Mandatory Load Set.

Authorities are loaded on demand only.

Runtime agents must not modify bootstrap behavior, lifecycle stages, artifact routing, or mandatory load sets to preload authorities.

When an artifact declares Authority Alignment, only the selected authority references needed for that artifact should be loaded.

---

# Authority Index

The authority index is located at:

```text
library/authorities/index.md
```

Domain folders may hold future authority details:

```text
library/authorities/games/
library/authorities/saas/
library/authorities/backend/
library/authorities/education/
```

---

# Artifact Requirements

Product Requirement must support Authority Alignment.

UX Specification must support Authority Alignment.

Visual Design Specification must support Authority Alignment.

MVP Definition must support Authority Compliance Check.

Authority Alignment and Authority Compliance Check sections must remain scoped to product behavior and artifact decisions. They must not introduce new lifecycle stages, new artifact types, bootstrap changes, mandatory load set changes, or implementation instructions.

---

# Status

Approved Reference Authorities System addendum.
