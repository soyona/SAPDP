# DNA Architecture Design

## 1. Purpose

## 2. Core Concepts

### Product DNA

Definition:
Product DNA is Experience Mechanism DNA.
Product DNA describes why a product experience works.
Product DNA captures transferable experience mechanisms that drive user behavior and long-term engagement.
Product DNA does not describe visual implementation.

### Visual DNA

Definition:
Visual DNA is Sensory Expression DNA.
Visual DNA describes how a product experience is perceived by users.
Visual DNA captures transferable sensory expression patterns.
Visual DNA does not describe implementation details.

## 3. Architecture

## 4. Responsibilities

### Product DNA Responsibilities

Product DNA owns:
- Progression
- Reward
- Retention
- Exploration
- Collection
- Creation
- Competition
- Workflow

Product DNA explains why users engage with the product experience.

### Product DNA Non-Responsibilities

Product DNA does not own:
- Color Values
- Typography Values
- Design Tokens
- Component Definitions
- Visual Layout Specifications

### Visual DNA Responsibilities

Visual DNA owns:
- Visual Personality
- Information Density
- Visual Hierarchy
- Motion Language
- Layout Philosophy
- Typography Style
- Illustration Style

Visual DNA explains how users perceive the product experience.

### Visual DNA Non-Responsibilities

Visual DNA does not own:
- Reward Systems
- Progression Systems
- Retention Systems
- Economy Systems
- Social Systems

## 5. Boundary Rules

### Classification Rule

If a concept remains valid after replacing all visual expression:
Classify as Product DNA.

If a concept remains valid after replacing all experience mechanisms:
Classify as Visual DNA.

### Examples

Reward
→ Product DNA

Progression
→ Product DNA

Retention
→ Product DNA

Exploration
→ Product DNA

Competition
→ Product DNA

Information Density
→ Visual DNA

Motion Language
→ Visual DNA

Typography Style
→ Visual DNA

Layout Philosophy
→ Visual DNA

Visual Hierarchy
→ Visual DNA

## 6. Consumers

DNA Consumers are entities that use Product DNA and Visual DNA as design input.

Consumers do not define DNA.

Consumers do not own DNA structure.

Consumers do not own DNA governance.

Consumers only consume DNA.

---

### 6.1 Human

Responsibilities:

- Select Product DNA direction.
- Select Visual DNA direction.
- Approve DNA usage.
- Resolve DNA conflicts.
- Ensure DNA aligns with product goals.

Human does not:

- Define DNA architecture.
- Define DNA artifacts.
- Define DNA consumption workflow.

---

### 6.2 ChatGPT

Responsibilities:

- Interpret Product DNA.
- Interpret Visual DNA.
- Apply Product DNA during product design.
- Apply Visual DNA during design reasoning.
- Maintain Product DNA and Visual DNA boundaries.
- Ensure downstream design remains aligned with selected DNA.

ChatGPT does not:

- Own DNA definitions.
- Own DNA governance.
- Define DNA artifact structure.
- Define DNA consumption workflow.

---

### 6.3 Codex

Responsibilities:

- Preserve DNA-aligned design intent during implementation.
- Report implementation conflicts.
- Preserve consistency between implementation and approved specifications.

Codex does not:

- Select DNA.
- Define DNA.
- Modify DNA meaning.
- Define DNA artifact structure.
- Define DNA consumption workflow.

---

### 6.4 UX Specification

Responsibilities:

- Consume Product DNA.
- Apply Product DNA to:
  - Progression
  - Reward
  - Retention
  - Exploration
  - Collection
  - Creation
  - Competition
  - Workflow

UX Specification does not:

- Define Product DNA.
- Define Visual DNA.
- Own visual expression.
- Define DNA artifact structure.
- Define DNA consumption workflow.

---

### 6.5 Visual Design Specification

Responsibilities:

- Consume Visual DNA.
- Apply Visual DNA to:
  - Visual Personality
  - Information Density
  - Visual Hierarchy
  - Motion Language
  - Layout Philosophy
  - Typography Style
  - Illustration Style

Visual Design Specification does not:

- Define Product DNA.
- Define Visual DNA.
- Own experience mechanisms.
- Define DNA artifact structure.
- Define DNA consumption workflow.

---

### 6.6 Implementation

Responsibilities:

- Implement approved specifications.
- Preserve DNA-aligned design intent.
- Surface implementation constraints.

Implementation does not:

- Consume raw DNA directly.
- Define DNA.
- Modify DNA meaning.
- Define DNA artifact structure.
- Define DNA consumption workflow.


## 7. Artifact Model

### A-001
DNA Artifact Classification

SAPDP defines two DNA artifact types.

Product DNA Artifact

Visual DNA Artifact

No additional DNA artifact types exist in Phase 3.

---

### A-002
Artifact Independence Rule

Product DNA Artifact and Visual DNA Artifact are independent artifacts.

Neither artifact owns the other.

Neither artifact inherits from the other.

Neither artifact is a sub-artifact of the other.

---

### A-003
Artifact Combination Rule

A product may use:

- Product DNA only
- Visual DNA only
- Product DNA + Visual DNA

The existence of one artifact does not require the existence of the other.

---

### A-004
Artifact Authority Rule

A DNA artifact owns only DNA knowledge.

A DNA artifact does not own:

- UX decisions
- UI decisions
- Technical decisions
- Architecture decisions
- Implementation decisions

---

### A-005
Artifact Stability Rule

A DNA artifact must remain reusable across products.

A DNA artifact must not contain product-specific implementation details.

A DNA artifact must not depend on a specific technology stack.

---

### A-006
Artifact Identity Rule

Each DNA artifact represents a single DNA source.

Examples:

Minecraft Product DNA

Duolingo Product DNA

Pokemon Product DNA

Linear Visual DNA

Stripe Visual DNA

Notion Visual DNA

One artifact.

One DNA source.

---

### A-007
Artifact Relationship Rule

DNA artifacts may be combined.

DNA artifacts may not merge.

Combining DNA artifacts does not create a new DNA artifact.

Each artifact remains independently identifiable.

---

### A-008
Source Duality Rule

A DNA source may own:

- one Product DNA Artifact
- one Visual DNA Artifact

simultaneously.

Product DNA Artifact and Visual DNA Artifact remain independent artifacts.

Example:

Duolingo may have:

- Duolingo Product DNA
- Duolingo Visual DNA

as two separate artifacts.


## 8. Consumption Model

### C-001
Consumption Definition

DNA Consumption is the controlled use of approved Product DNA and Visual DNA as design input within SAPDP.

DNA Consumption does not redefine DNA.

DNA Consumption does not create new DNA artifact types.

DNA Consumption does not change Consumer responsibilities.

DNA Consumption does not change the Artifact Model.

---

### C-002
Consumption Direction Rule

DNA is consumed downstream only.

Allowed direction:

DNA Artifact
→ Human Selection
→ ChatGPT Interpretation
→ SAPDP Design Artifacts
→ Approved Specifications
→ Implementation

Implementation does not consume raw DNA directly.

Implementation consumes approved specifications that have already incorporated DNA intent.

---

### C-003
Human Selection Rule

Human selects which DNA artifacts may be used for a product.

Human may select:

- Product DNA only
- Visual DNA only
- Product DNA + Visual DNA

Human approval is required before DNA affects SAPDP design artifacts.

---

### C-004
ChatGPT Interpretation Rule

ChatGPT interprets selected DNA artifacts and applies them to the appropriate SAPDP design artifacts.

ChatGPT must preserve the boundary between:

- Product DNA
- Visual DNA

ChatGPT must not convert Visual DNA into experience mechanisms.

ChatGPT must not convert Product DNA into visual implementation details.

---

### C-005
Product DNA Consumption Rule

Product DNA is consumed by UX Specification.

UX Specification applies Product DNA to experience mechanism design, including:

- Progression
- Reward
- Retention
- Exploration
- Collection
- Creation
- Competition
- Workflow

Product DNA must not be used to define:

- color values
- typography values
- design tokens
- component definitions
- visual layout specifications

---

### C-006
Visual DNA Consumption Rule

Visual DNA is consumed by Visual Design Specification.

Visual Design Specification applies Visual DNA to sensory expression design, including:

- Visual Personality
- Information Density
- Visual Hierarchy
- Motion Language
- Layout Philosophy
- Typography Style
- Illustration Style

Visual DNA must not be used to define:

- reward systems
- progression systems
- retention systems
- economy systems
- social systems

---

### C-007
Combined DNA Consumption Rule

When Product DNA and Visual DNA are both selected, they are consumed independently.

Product DNA informs experience mechanisms.

Visual DNA informs sensory expression.

The two artifacts may be combined in product design, but they must not be merged into a single DNA artifact.

---

### C-008
Conflict Resolution Rule

If selected DNA artifacts conflict during consumption, ChatGPT must surface the conflict to Human.

Human resolves DNA conflicts.

ChatGPT must not silently override one selected DNA artifact with another.

Codex must not resolve DNA conflicts.

Implementation must preserve the Human-approved resolution.

---

### C-009
Specification Mediation Rule

DNA affects implementation only through approved specifications.

Raw DNA must not be used as direct implementation authority.

Implementation authority remains:

Approved UX Specification

Approved Visual Design Specification

Approved technical and product artifacts

DNA provides design input, not implementation command.

---

### C-011
Non-Consumption Rule

If no DNA artifact is selected, SAPDP proceeds without DNA consumption.

Absence of DNA does not block product development.

Absence of DNA does not require creating placeholder DNA artifacts.

---

### C-012
Consumption Completion Rule

DNA Consumption is complete when:

- Human-selected DNA artifacts are recorded
- Product DNA has been applied only to UX Specification, if selected
- Visual DNA has been applied only to Visual Design Specification, if selected
- DNA conflicts have been surfaced and resolved
- downstream specifications preserve DNA-aligned intent

After completion, implementation consumes approved specifications, not raw DNA.

## 9. Governance Rules

### G-001
Ownership Rule

DNA artifact ownership belongs to SAPDP.

Consumers may use DNA artifacts.

Consumers do not own DNA artifacts.

Consumers do not define DNA artifacts.

---

### G-002
Authority Rule

DNA authority belongs to the approved DNA artifact.

Consumers may interpret DNA.

Consumers may not redefine DNA.

Conflicting interpretations do not modify DNA meaning.

---

### G-003
Versioning Rule

DNA artifacts are immutable.

DNA changes create new versions.

Older versions remain valid.

Products may continue using approved older versions.

---

### G-004
Approval Rule

Only approved DNA artifacts may be consumed.

Approval status is determined by SAPDP governance.

Unapproved DNA artifacts may be researched.

Unapproved DNA artifacts may not influence product design.

---

### G-005
Conflict Governance Rule

Human owns final conflict resolution authority.

ChatGPT surfaces DNA conflicts.

Codex reports implementation conflicts.

Neither ChatGPT nor Codex may silently resolve DNA conflicts.

## 10. Open Questions

How should Product DNA and Visual DNA be synthesized?

What is the architecture of DNA Consumption?

Should an Experience Model layer exist?

How should DNA be consumed by UX Specification?

How should DNA be consumed by Visual Design Specification?

How should multiple Product DNA artifacts be combined?

How should multiple Visual DNA artifacts be combined?

How should Product DNA and Visual DNA be synthesized?

Should an Experience Model layer exist?

What is the internal architecture of DNA Consumption?

## 11. Design Roadmap

Phase 1
Definition Layer
PASS

Phase 2
Consumer Model Design
PASS

Phase 3
Artifact Model Design
PASS

Phase 4
Consumption Model Design
PASS

Phase 5
Governance Rules Design
PASS

Phase 6
Open Questions Resolution
CURRENT


### Roadmap Execution Rule

A later phase may not be designed before all earlier phases are frozen.

Example:

Artifact Model Design
cannot start before
Consumer Model Design is frozen.

Consumption Model Design
cannot start before
Artifact Model Design is frozen.

Governance Rules Design
cannot start before
Consumption Model Design is frozen.


## Freeze Rules

DNA Architecture Design Roadmap

Phase 1
Definition Layer
PASS

Phase 2
Consumer Model Design
PASS

Phase 3
Artifact Model Design
PASS

Phase 4
Consumption Model Design
PASS

Phase 5
Governance Rules Design
PASS

Phase 6
Open Questions Resolution
CURRENT

