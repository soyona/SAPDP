# SAPDP Lifecycle

## Document Information

| Item       | Value               |
| ---------- | ------------------- |
| Document   | SAPDP_LIFECYCLE.md  |
| Status     | Frozen              |
| Purpose    | Lifecycle Authority |
| Scope      | Global              |
| Owner      | SAPDP               |
| Versioning | Git Managed         |

---

# 1. Purpose

## 1.1 Lifecycle Purpose

SAPDP Lifecycle defines:

```text
How product development progresses
inside SAPDP.
```

Lifecycle exists to solve:

```text
P-003
Solo-AI Development Lifecycle Problem

P-029
Cross-Session State Continuity Problem

P-030
Workflow Memory Ownership Problem

P-031
Workflow Progression Ownership Problem

P-032
Artifact Discovery Problem
```

The purpose of Lifecycle is:

```text
Stage Navigation

State Continuity

Workflow Progression

Artifact Discovery
```

Lifecycle is responsible for:

```text
Defining Stages

Defining Stage Progression

Defining Entry Rules

Defining Rollback Rules

Defining Lifecycle Closure
```

---

## 1.2 Lifecycle Responsibility Boundary

Lifecycle defines:
```text
How work enters lifecycle

When work happens

How stages progress

Who owns progression

How lifecycle closes
```

Lifecycle does not define:

```text
Artifact Formats

Artifact Templates

Artifact Naming

Artifact Directory Structures

Artifact Quality Standards

Design Standards

Implementation Standards

Verification Standards
```

These subjects are defined by other SAPDP systems.

---

## 1.3 Lifecycle Non Responsibilities

Lifecycle is not:

```text
Project Management

Task Management

Workflow Engine

Approval System

Enterprise Process Framework
```

Lifecycle remains:

```text
Minimal

Execution-Oriented

Problem-Driven
```

---

# 2. Lifecycle Foundation

## 2.1 Lifecycle Principles

SAPDP adopts:

```text
Single Lifecycle Principle
```

SAPDP maintains one product development lifecycle only.

The lifecycle supports:

```text
New Feature

Bug Fix

Refactor
```

through entry rules.

SAPDP does not maintain separate product development lifecycles for:

```text
Feature Development

Bug Fixing

Refactoring
```

---

## 2.2 Lifecycle Entry Types

Lifecycle Entry Types:

```text
New Feature

Bug Fix

Refactor
```

Each entry type enters the lifecycle through predefined lifecycle entry rules.

Lifecycle entry rules are authoritative.

Entry rules are defined in:

```text
Lifecycle Flow Rules
```

---

## 2.3 Lifecycle Scope Constraints

Lifecycle must remain:

```text
Minimal

Execution-Oriented

Problem-Driven
```

Lifecycle should not absorb responsibilities belonging to:

```text
Artifact System

Decision Gates

State Management

Implementation Protocols
```

---

# 3. Lifecycle Stage Definition Structure

## 3.1 Standard Stage Structure

Every lifecycle stage must define:

```text
Stage Name

Objective

Inputs

Outputs

Primary Owner

Exit Criteria

Completion Action
```

No lifecycle stage may omit any required field.

---

## 3.2 Primary Owner Rules

Primary Owner identifies the participant responsible for advancing a lifecycle stage.

Allowed Primary Owners:

```text
Human

ChatGPT

Codex

Git
```

No additional lifecycle owners are defined.

---

## 3.3 Completion Action Rules

Completion Action defines:

```text
What happens after a stage successfully completes.
```

Completion Action may:

```text
Advance Lifecycle

Rollback Lifecycle

Close Lifecycle
```

Completion Action must not define:

```text
Tool Commands

Implementation Details

Artifact Formats
```

### Runtime Completion Contract

Every product Lifecycle Stage completion must produce one Route Card.

The required Route Card contains:

```text
Route

Current:
<stage> · <environment> · <project/session>

Done:
<artifact/result/commit>

Next:
<stage> · <environment> · <project/session>

Action:
<one executable action>

Start:
<exact prompt/command or omit if not needed>

Audit:
<commit URL or artifact path, only when needed>
```

Allowed Environment values:

```text
ChatGPT
Codex
Git
Human
```

Allowed Session values:

```text
CURRENT
NEW
REUSE_EXISTING
```

The Route Card must not repeat the full lifecycle unless the user explicitly asks for a route map.

The Route Card must not include generic guidance.

Current and Next must include stage, environment, project, and session when applicable.

The Environment must identify where each side of the transition is performed.

The Action must be executable.

Route Card is a handoff contract.

Route Card is not a Runtime Authority.

Route Card is not the Route Manifest.

Lifecycle completion is not operationally complete until the Route Card has been produced.

Authoritative runtime state remains:

PROJECT_BOOTSTRAP.md

Persistent route recovery state is:

ROUTE_MANIFEST.md

Route Manifest ownership:

```text
Codex owns route generation.

ChatGPT owns route consumption.
```

### Default Stage Route Map

The default routing reference is:

```text
Bootstrap: Codex -> ChatGPT, NEW session, next Problem
Problem: ChatGPT -> ChatGPT, CURRENT session, next Solution
Solution: ChatGPT -> ChatGPT, CURRENT session, next MVP
MVP: ChatGPT -> ChatGPT, CURRENT session, next Task Package
Task Package: ChatGPT -> Codex, REUSE_EXISTING product workspace, next Build
Build: Codex -> ChatGPT, CURRENT or NEW if context is heavy, next Implementation Verification
Implementation Verification: ChatGPT -> ChatGPT if PASS, ChatGPT -> Codex if PATCH REQUIRED
User Validation: ChatGPT -> Release if PASS, ChatGPT -> Codex or ChatGPT if issues
Release: ChatGPT/Codex/Git -> Release Result
```

The route map is not output by default.



# 4. Lifecycle Stage Set

## 4.1 Lifecycle Overview

```text
Problem
↓
Solution
↓
Product Representation
↓
MVP Scope
↓
Build
↓
Implementation Verification
↓
User Validation
↓
Release
```

SAPDP Lifecycle contains:

```text
8 Stages
```

Lifecycle begins at:

```text
Problem
```

Lifecycle ends at:

```text
Release
```

Project Bootstrap is not part of the Lifecycle.

Project Bootstrap is a prerequisite system before Lifecycle begins.

---

## 4.2 Lifecycle Stage Summary

| Stage                       | Primary Owner | Input Type                         | Output Type                        |
| --------------------------- | ------------- | ---------------------------------- | ---------------------------------- |
| Problem                     | Human         | Lifecycle Entry                    | Problem Definition                 |
| Solution                    | ChatGPT       | Problem Definition                 | Solution Definition                |
| Product Representation      | ChatGPT       | Solution Definition                | Product Representation Artifact    |
| MVP Scope                   | Human         | Product Representation Artifact    | MVP Definition                     |
| Build                       | Codex         | MVP Definition                     | Build Artifact                     |
| Implementation Verification | ChatGPT       | Build Artifact                     | Implementation Verification Result |
| User Validation             | Human         | Implementation Verification Result | User Validation Result             |
| Release                     | Git           | User Validation Result             | Release Result                     |



---

## 4.3 Bootstrap to Problem Stage Entry Rule

Project Bootstrap is a prerequisite system and not part of the Lifecycle.

After Bootstrap PASS, Lifecycle defines the Stage Entry Rule:

- Current Stage: Problem
- Inputs: Required Load Set from Bootstrap (PROJECT_BOOTSTRAP.md, ARTIFACT_INDEX.md, ROUTE_MANIFEST.md, BOOTSTRAP_RESULT.md, POST_BOOTSTRAP_ENTRY.md, ProblemDefinition_Template.md)
- Environment: ChatGPT
- Session: NEW by default, or REUSE_EXISTING when a product-bound ChatGPT Project already exists
- Startup: Bootstrap Route Card Start prompt
- Produced Artifact: ProblemDefinition_CORE_v1.md
- Runtime Update Target: PROJECT_BOOTSTRAP.md

Lifecycle owns Stage Entry Rule. POST_BOOTSTRAP_ENTRY.md only contains actionable instructions instantiated for this project.

ROUTE_MANIFEST.md records recoverable route metadata for the transition but does not define the Stage Entry Rule.

Rationale:

Ensures unambiguous Bootstrap → Problem Stage transition while maintaining Authority Ownership Model (D-0022).

PATCH PASS criteria:

- ProblemDefinition_CORE_v1.md is generated according to template.
- Route Card is produced.
- ROUTE_MANIFEST.md exists or a pre-v1.6.0 migration path is identified.
- Action is executable and identifies the next stage action.

---

# 5. Lifecycle Stage Definitions

## 5.1 Problem

### Objective

Define and validate the problem worth solving.

### Inputs

Lifecycle Entry

### Outputs

Problem Definition

### Primary Owner

Human

### Exit Criteria

Problem definition accepted.

### Completion Action

Load Solution.

---

## 5.2 Solution

### Objective

Define the solution approach for the validated problem.

### Inputs

Problem Definition

### Outputs

Solution Definition

### Primary Owner

ChatGPT

### Exit Criteria

Solution definition accepted.

### Completion Action

Load Product Representation.

---

## 5.3 Product Representation

### Objective

Transform the intended product into an executable and reviewable representation.

### Inputs

Solution Definition

### Outputs

Product Representation Artifact

### Primary Owner

ChatGPT

### Exit Criteria

Product representation accepted.

### Completion Action

Load MVP Scope.

---

## 5.4 MVP Scope

### Objective

Define the minimum product boundary required for validation.

### Inputs

Product Representation Artifact

### Outputs

MVP Definition

### Primary Owner

Human

### Exit Criteria

MVP definition accepted.

### Completion Action

Load Build.

---

## 5.5 Build

### Objective

Implement the MVP.

### Inputs

MVP Definition

### Outputs

Build Artifact

### Primary Owner

Codex

### Exit Criteria

Implementation completed.

### Completion Action

Load Implementation Verification.

---

## 5.6 Implementation Verification

### Objective

Verify that implementation matches the intended product representation and MVP scope.

### Inputs

Build Artifact

### Outputs

Implementation Verification Result

### Primary Owner

ChatGPT

### Exit Criteria

Verification completed.

### Completion Action

PASS
→
Load User Validation

FAIL
→
Return Build

---

## 5.7 User Validation

### Objective

Verify that the product creates meaningful value for target users.

### Inputs

Implementation Verification Result

### Outputs

User Validation Result

### Primary Owner

Human

### Exit Criteria

Validation completed.

### Completion Action

PASS
→
Load Release

FAIL
→
Return MVP Scope

---

## 5.8 Release

### Objective

Release the validated product.

### Inputs

User Validation Result

### Outputs

Release Result

### Primary Owner

Git

### Exit Criteria

Release completed.

### Completion Action

Lifecycle Closed.


# 6. Lifecycle Flow Rules

## 6.1 Lifecycle Entry Rules

SAPDP supports the following Lifecycle Entry Types:

```text
New Feature

Bug Fix

Refactor
```

Lifecycle Entry Rules:

```text
New Feature
→
Problem

Bug Fix
→
Implementation Verification

Refactor
→
Build
```

Lifecycle Entry Rules are authoritative.

No additional Lifecycle Entry Types are defined.

---

## 6.2 Lifecycle Forward Progression Rules

SAPDP adopts fixed forward progression.

The only allowed forward progression is:

```text
Problem
↓
Solution
↓
Product Representation
↓
MVP Scope
↓
Build
↓
Implementation Verification
↓
User Validation
↓
Release
```

Lifecycle stages must not skip required intermediate stages.

The lifecycle must always progress through the defined stage sequence.

---

## 6.3 Lifecycle Rollback Rules

SAPDP adopts controlled rollback.

Allowed rollback paths:

```text
Implementation Verification

FAIL
→
Build
```

```text
User Validation

FAIL
→
MVP Scope
```

No additional rollback paths are defined.

Rollback must follow the predefined rollback rules.

---

## 6.4 Lifecycle Advancement Rules

Lifecycle advancement authority is defined as follows.

Human may:

```text
Accept

Reject

Terminate
```

a lifecycle stage.

ChatGPT may:

```text
Recommend Transition
```

but may not perform final acceptance.

Codex may:

```text
Execute Assigned Work
```

but may not advance lifecycle stages.

Git may:

```text
Persist Lifecycle State
```

but may not advance lifecycle stages.

---

## 6.5 Lifecycle Closure Rules

Lifecycle closes at:

```text
Release
```

Upon successful release:

```text
Lifecycle Closed
```

After Lifecycle Closed:

```text
New Feature
→
Problem

Bug Fix
→
Implementation Verification

Refactor
→
Build
```

A new lifecycle execution begins through the applicable entry rule.

---

## 6.6 Protocol Release Boundary Rule

SAPDP protocol upgrade release handoff is a repository maintenance rule.

It is not a lifecycle stage.

It does not change:

```text
Lifecycle Stage Set

Lifecycle Entry Types

Lifecycle Forward Progression Rules

Lifecycle Rollback Rules

Lifecycle Closure Rules
```

Protocol release governance is owned by:

```text
engine/SAPDP_CANONICAL_PROTOCOL.md
```

---

## 6.7 Product Workflow Handoff Boundary Rule

Product workflow handoff rules apply only to product development workflow.

They do not change:

```text
Lifecycle Stage Set

Lifecycle Entry Types

Lifecycle Forward Progression Rules

Lifecycle Rollback Rules

Lifecycle Closure Rules

Lifecycle status models

Product Bootstrap behavior
```

Product workflow handoff, Git audit source, and token budget rules are owned by:

```text
engine/SAPDP_CANONICAL_PROTOCOL.md
```

---

## 6.8 Protocol Evolution Lifecycle Boundary Rule

SAPDP protocol upgrades use a separate governance route:

```text
Reality Validation
↓
Issue
↓
Proposal
↓
Design Audit
↓
Codex Upgrade
↓
Release Audit
↓
Freeze
↓
Reality Validation
```

This route is the Protocol Evolution Lifecycle.

It is not the product development lifecycle.

It does not change:

```text
Lifecycle Stage Set

Lifecycle Entry Types

Lifecycle Forward Progression Rules

Lifecycle Rollback Rules

Lifecycle Closure Rules

Product Bootstrap behavior

Product artifact set

Template directory structure
```

Protocol Evolution stage ownership:

```text
Reality Validation
=
Human + ChatGPT

Issue
=
ChatGPT

Proposal
=
ChatGPT

Design Audit
=
ChatGPT

Codex Upgrade
=
Codex

Release Audit
=
ChatGPT

Freeze
=
Git + Release Package
```

Protocol Evolution starts or resumes only when startup mode is:

```text
Load SAPDP

Mode:
Protocol Evolution
```

Product Development mode remains the default for new product bootstrap and product lifecycle execution.

Protocol Evolution mode must not invoke product Bootstrap.

Protocol Evolution governance is owned by:

```text
engine/SAPDP_CANONICAL_PROTOCOL.md
```

---

# 7. Lifecycle Constraints

## 7.1 Lifecycle Scope Constraints

Lifecycle is responsible for:

```text
Stage Navigation

State Continuity

Workflow Progression

Artifact Discovery
```

Lifecycle is not responsible for:

```text
Artifact Formats

Artifact Templates

Artifact Naming

Artifact Directory Structures

Artifact Quality Standards

Design Standards

Implementation Standards

Verification Standards
```

These responsibilities belong to other SAPDP systems.

---

## 7.2 Simplicity Constraints

Lifecycle must remain:

```text
Minimal

Execution-Oriented

Problem-Driven
```

Lifecycle must not introduce:

```text
Multiple Lifecycles

Workflow Engines

Approval Systems

Enterprise Process Frameworks
```

---

## 7.3 Authority Ownership Constraints

Lifecycle authority is maintained by:

```text
SAPDP_LIFECYCLE.md
```

Lifecycle-related decisions are maintained by:

```text
SAPDP_DECISION_LOG.md
```

Lifecycle runtime state is maintained by:

```text
SAPDP_BOOTSTRAP.md
```

No other SAPDP document may redefine Lifecycle rules.

---

# 8. Relationship To Other SAPDP Systems

## 8.1 Product Development Model

Product Development Model defines:

```text
What product development should accomplish.
```

Lifecycle defines:

```text
How product development progresses.
```

---

## 8.2 AI Collaboration Model

AI Collaboration Model defines:

```text
How Human,
ChatGPT,
Codex,
and Git collaborate.
```

Lifecycle defines:

```text
When collaboration occurs.
```

---

## 8.3 Artifact System

Artifact System defines:

```text
Artifact Formats

Artifact Templates

Artifact Naming

Artifact Directory Structures

Artifact Quality Standards
```

Lifecycle defines:

```text
When artifacts are produced and consumed.
```

---

## 8.4 Decision Gates

Decision Gates define:

```text
When progression is permitted.
```

Lifecycle defines:

```text
Where progression occurs.
```

---

## 8.5 State Management

State Management defines:

```text
How state is stored,
recovered,
and transferred.
```

Lifecycle defines:

```text
What state transitions exist.
```

---

# 9. Lifecycle Freeze Rules

Lifecycle authority is established through:

```text
D-0025
Lifecycle Foundation Freeze

D-0026
Lifecycle Stage Definition Structure Freeze

D-0027
Single Lifecycle Principle Freeze

D-0028
Lifecycle Stage Set Freeze

D-0029
Lifecycle Stage Definitions Freeze

D-0030
Lifecycle Flow Rules Freeze
```

Changes to Lifecycle require:

```text
Lifecycle Research

Decision Freeze

Decision Log Update

Lifecycle Authority Update
```

Lifecycle modifications must preserve:

```text
Single Lifecycle Principle

Minimal Structure

Execution Orientation

Problem-Driven Validation
```


## Lifecycle Progress UI Standard

The following format is mandatory.

```text
Lifecycle Progress

● Problem                    CURRENT

○ Solution

○ Product Representation

○ MVP Scope

○ Build

○ Implementation Verification

○ User Validation

○ Release
```

Definitions:

●

=
Current Lifecycle Stage

○

=
Future Lifecycle Stage

CURRENT

=
Active Lifecycle Position

Rules:

Only one stage may contain:

●

and

CURRENT

at any time.

All remaining stages must use:

○

The display order must follow
the SAPDP Lifecycle definition.

Alternative display formats are prohibited.
```
