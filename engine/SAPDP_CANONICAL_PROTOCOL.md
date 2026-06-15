# SAPDP Canonical Protocol

## Document Information

| Item       | Value                        |
| ---------- | ---------------------------- |
| Document   | SAPDP_CANONICAL_PROTOCOL.md  |
| Status     | Frozen                       |
| Purpose    | Canonical Execution Protocol |
| Scope      | Global                       |
| Owner      | SAPDP                        |
| Versioning | Git Managed                  |

---

# 1. Purpose

SAPDP is:

```text
AI-Assisted Solo Software Product Development Protocol
```

SAPDP defines:

```text
How one human collaborates with AI
to build software products
from idea to initial release.
```

SAPDP is optimized for:

```text
Human
+
ChatGPT
+
Codex
+
Git
```

working as a unified development system.

The primary outcome is:

```text
Idea
↓
Validation
↓
MVP
↓
Initial Release
```

with:

```text
Lower Risk

Lower Waste

Lower Context Cost

Higher Quality

Higher Reusability
```

---

# 2. System Definition

SAPDP defines:

```text
Human
+
ChatGPT
+
Codex
+
Git
```

as an:

```text
AI-Native Solo Product Development System
```

System Components:

```text
Human
=
Direction Owner

ChatGPT
=
Reasoning Layer

Codex
=
Execution Layer

Git
=
System Memory
```

The system is not:

```text
Project Management Framework

Team Collaboration Framework

Enterprise Governance System
```

---

# 3. Optimization Targets

SAPDP optimizes:

```text
G1
Reduce Waste Development

G2
Shorten Idea-To-Validation Cycle

G3
Reduce Context Recovery Cost

G4
Maximize AI Collaboration Efficiency

G5
Accumulate Reusable Assets

G6
Increase Solo Builder Complexity Capacity

G7
Default To High-Quality Product Outcomes
```

SAPDP does not optimize:

```text
Project Management

Enterprise Development

Team Collaboration

Business Growth

General AI Agent Frameworks
```

---

# 4. Product Development Model

SAPDP adopts:

```text
Validation-Driven Product Development
```

Development Sequence:

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

Purpose:

```text
Move from idea
to initial release
with minimum waste
and maximum validation speed.
```

---

# 5. AI Collaboration Model

Collaboration Runtime Loop:

```text
Goal
↓
Plan
↓
Execute
↓
Verify
↓
Accept
↓
Persist
```

Ownership:

```text
Goal
→ Human

Plan
→ ChatGPT

Execute
→ Codex

Verify
→ ChatGPT

Accept
→ Human

Persist
→ Git
```

Rules:

```text
Human owns direction.

ChatGPT owns reasoning.

Codex owns implementation.

Git owns system memory.
```

---

# 6. Lifecycle

SAPDP maintains one lifecycle.

Lifecycle Stages:

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

Lifecycle Entry Types:

```text
New Feature

Bug Fix

Refactor
```

Entry Rules:

```text
New Feature
→ Problem

Bug Fix
→ Implementation Verification

Refactor
→ Build
```

Rollback Rules:

```text
Implementation Verification FAIL
→ Build

User Validation FAIL
→ MVP Scope
```

Lifecycle closes at:

```text
Release
```


## Lifecycle Advancement Rules

Human may:

```text
Accept

Reject

Terminate
```

a Lifecycle Stage.

ChatGPT may:

```text
Recommend Transition
```

but may not perform final acceptance.

Codex may:

```text
Execute Assigned Work
```

but may not advance Lifecycle Stages.

Git may:

```text
Persist Lifecycle State
```

but may not advance Lifecycle Stages.

---

## Runtime Completion Rule

Lifecycle completion is not operationally complete until:

```text
Runtime Completion Block
```

has been produced.

Every Lifecycle Stage completion must produce a Runtime Completion Block.

The Runtime Completion Block is mandatory.

The Runtime Completion Block is:

```text
Stage Handoff Contract
```

not:

```text
Runtime Authority

Artifact

Lifecycle Stage
```

Authoritative runtime state remains:

```text
PROJECT_BOOTSTRAP.md
```

---

# 7. Artifact System

SAPDP adopts the following artifact catalog.

### System Governance Artifacts
Bootstrap State
Problem Baseline
Decision Log

Purpose:
Cross-Session Continuity
Decision Traceability
Protocol Governance

### Core Execution Artifacts
Problem Definition
Solution Definition
MVP Definition
Task Package
Build Artifact
Implementation Verification Result
User Validation Result
Release Result

Purpose:
Product Development Execution
Implementation Verification
User Validation
Release Traceability

Core Execution Artifacts are mandatory.

### Quality Layer Artifacts
Product Requirement Artifact
Product Representation Artifact
UX Specification Artifact
Visual Design Specification Artifact
Technical Constraint Artifact

Purpose:
Product Definition Quality
UX Quality
Visual Quality
Technical Quality

Quality Layer Artifacts are conditionally activated according to:
D-0058 | Artifact Activation Model Freeze
D-0060 | Artifact Activation Engine Freeze

---

# 8. Artifact Governance Rules

Every artifact must define:

```text
Owner

Producer

Consumer

Lifecycle Mapping

Validity
```

Every artifact must be:

```text
Discoverable

Referenceable

Versioned

Traceable
```

Only:

```text
Accepted
+
Latest
```

artifacts may participate in lifecycle progression.

---

## Artifact Lifecycle Mapping Rule

Each Artifact must have exactly one producing Lifecycle Stage.

Lifecycle Mapping:

```text
Problem
→ Problem Definition

Solution
→ Solution Definition

Product Representation
→ Product Requirement Artifact
→ Product Representation Artifact
→ UX Specification Artifact
→ Visual Design Specification Artifact
→ Technical Constraint Artifact

MVP Scope
→ MVP Definition

Build
→ Task Package
→ Build Artifact

Implementation Verification
→ Implementation Verification Result

User Validation
→ User Validation Result

Release
→ Release Result
```

Artifact Lifecycle Mapping defines:

```text
Producer Stage
```

only.

Artifact Lifecycle Mapping does not imply:

```text
Mandatory Artifact Creation
```

Artifact creation remains subject to:

```text
Artifact Activation Rules
```

---

## Artifact Loading Rule

Each Lifecycle Stage defines a Required Load Set.

Only Required Load Artifacts must be loaded by default.

If a Required Load Artifact is missing or invalid:

```text
Lifecycle progression must stop.
```

Optional references must not be treated as Required Load.

---

## Required Load Set Resolution Rule

Ownership:

```text
Lifecycle
=
Defines Required Load Set

ARTIFACT_INDEX.md
=
Stores Resolved Required Load Set

PROJECT_BOOTSTRAP.md
=
Stores Current Required Load Set
```

Responsibility:

Lifecycle defines:

```text
Which Artifact Types
must be loaded
for a Lifecycle Stage.
```

ARTIFACT_INDEX.md records:

```text
The current valid Artifact
that satisfies each required Artifact Type.
```

PROJECT_BOOTSTRAP.md records:

```text
The active Required Load Set
for the current Lifecycle Stage.
```

Lifecycle progression must stop if:

```text
Required Load Set
cannot be resolved.
```

---

## Artifact Validity Rule

An Artifact is Valid when:

```text
Owner exists

Lifecycle Mapping exists

Artifact is discoverable

Artifact is the latest accepted version

Artifact is not superseded
```

An Artifact becomes Invalid when:

```text
Superseded by a newer accepted version

Explicitly deprecated

No longer discoverable

Owner removed
```

Only Valid Artifacts may participate in Lifecycle progression.

---

## Artifact Identification Rule

Every Artifact must be uniquely identifiable.

Artifact identification must include:

```text
Artifact Type

Artifact Owner

Artifact Status
```

Artifact Identification Rules do not define:

```text
File Names

Directory Structures

Storage Locations
```

These subjects belong to Project Scaffold.

---

## Artifact Format Rule

SAPDP adopts Markdown as the canonical Artifact format.

Authoritative Artifact content must exist in Markdown.

Artifacts may reference:

```text
Images

URLs

Design Assets

Source Code
```

However, authoritative Artifact content must remain discoverable in Markdown.

---

# 9. Built-in Quality System

Quality is injected before implementation.

Quality Domains:

```text
Product Quality

UX Quality

Visual Quality

Technical Quality

Benchmark Quality
```

Quality Injection Points:

```text
Product Requirement

Product Representation

MVP Definition

Task Package

Build

Implementation Verification
```

Review Results:

```text
PASS

PATCH REQUIRED

FAIL
```

Quality must be built-in rather than discovered after implementation.

---

# 10. Project Scaffold

Every SAPDP project adopts:

```text
project/

README.md

PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

docs/
  problem/
  solution/
  product/
  mvp/
  tasks/
  verification/
  validation/
  release/

templates/
  problem/
  solution/
  product/
  mvp/
  tasks/
  verification/
  validation/
  release/

src/
tests/
```

Purpose:

```text
Provide a standard executable project structure.
```

Bootstrap internal execution directories must not exist in the final Product Project Root.

README.md is a required Project Scaffold file.

Required scaffold directories that may be empty at Bootstrap completion must contain .gitkeep so that GitHub committed state can prove scaffold existence.

Forbidden final Product Project Root directories:

```text
outputs/
work/
```

---

# 11. Project Runtime

Project Runtime Authority:

```text
PROJECT_BOOTSTRAP.md
```

Maintains:

```text
Project Name

Current Lifecycle Stage

Current Task

Current Goal

Required Load Set

Next Action

Last Accepted Artifact

Current Blocker
```

Runtime state must not be duplicated elsewhere.

---

# 12. Artifact Index

Artifact Discovery Authority:

```text
ARTIFACT_INDEX.md
```

Minimum Fields:

```text
Artifact Type

Artifact ID

Version

Status

Lifecycle Stage

Path

Owner

Latest

Superseded By

Required For
```

Responsibilities:

```text
Artifact Discovery

Artifact Status

Artifact Version Tracking

Required Load Set Resolution
```

# 12.1 Artifact Identity And Naming

Artifact Identity consists of:

```text
Artifact Type

Artifact ID

Version

Status
```

File Naming Rule:

```text
<ArtifactType>_<ArtifactId>_vN.md
```

Examples:

```text
ProblemDefinition_CORE_v1.md

SolutionDefinition_CORE_v1.md

TaskPackage_AUTH_v1.md
```

Status is maintained in:

```text
ARTIFACT_INDEX.md
```

and must not appear in file names.

---

# 13. Artifact Templates

Every artifact type must have a template.

Template Naming Rule:

```text
<ArtifactType>_Template.md
```

Every template must contain:

```text
Purpose

Inputs

Outputs

Owner

Required Load Set

Quality Constraints

Acceptance Criteria

Status
```


## 13.1 Artifact Activation Rules

SAPDP artifacts are activated by necessity.

SAPDP does not require every project to create every artifact.

Artifacts are divided into:
Core Execution Artifacts
Quality Layer Artifacts

### Core Execution Artifacts
ProblemDefinition
SolutionDefinition
MVPDefinition
TaskPackage
ImplementationVerification
UserValidation
ReleaseResult

Core Execution Artifacts are always required.

### Quality Layer Artifacts
ProductRequirement
ProductRepresentation
TechnicalConstraint
UXSpecification
VisualDesignSpecification

Quality Layer Artifacts are conditionally activated.

Activation Rules:
D-0058 | Artifact Activation Model Freeze

Activation Engine:
D-0060 | Artifact Activation Engine Freeze

Activation state:
Derived State
Not Stored State

Activation state must not be stored in:
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md

Activated Quality Layer Artifacts become mandatory.
Deactivated Quality Layer Artifacts do not block lifecycle progression.

---

# 14. Project Bootstrap Protocol

Every SAPDP project begins with:

```text
Project Bootstrap
```

Project Bootstrap is a prerequisite system.

Project Bootstrap is not part of the Lifecycle.

Lifecycle begins only after Project Bootstrap completes.


## Bootstrap System Components

Bootstrap System consists of:

- Bootstrap Contract
- Bootstrap Validation Contract
- Bootstrap Runtime
- Bootstrap Template Set
- Artifact Template Library

Bootstrap System definition is governed by:

D-0068 | Bootstrap System Freeze


## Bootstrap Completion System v2

SAPDP adopts:

```text
Bootstrap Completion System v2
```

Bootstrap PASS is not operationally complete until:

```text
Bootstrap Completion Handoff
```

has been produced.

Bootstrap Completion Handoff must disclose:

```text
Project Root

Working Directory

Execution Environment

Required Load Set

Codex Project Setup Guide

ChatGPT Project Setup Guide
```

Bootstrap Completion Handoff provides:

```text
Execution Guidance
```

only.

Bootstrap Completion Handoff is not:

```text
Runtime Authority

Lifecycle Authority

Artifact Authority
```

Project Runtime Authority remains:

```text
PROJECT_BOOTSTRAP.md
```


---

## Purpose

Project Bootstrap transforms:

```text
Idea
```

into:

```text
Bootstrap Ready Project
```

before entering:

```text
Problem
```

Lifecycle Stage.

---

## Project Bootstrap Sequence

```text
Create Project Workspace
↓
Resolve Project Name
↓
Resolve Project Root From Project Name
↓
Generate Project Scaffold
↓
Create Runtime Authority
↓
Create Artifact Authority
↓
Resolve Required Protocol Sources
↓
Bootstrap Validation
↓
Enter Problem Stage
```

---

## Create Project Workspace

Create the workspace that will contain:

```text
Source Code

Artifacts

Runtime State

Project Assets
```

Workspace implementation is tool-dependent.

Examples:

```text
Git Repository

Local Directory

Cloud Workspace
```

---

## Resolve Project Name

Bootstrap must resolve:

```text
Project Name
```

before creating Project Root.

If Project Name is omitted:

```text
NewProduct
```

is used as the default Project Name.

---

## Resolve Project Root From Project Name

Project Root must be derived only from:

```text
Project Name
```

Project Root must not be derived from:

```text
Prompt Name

Conversation Name

Task Name

Workspace Name
```

---

## Generate Project Scaffold

Generate the standard SAPDP project structure.

The structure is defined by:

```text
Project Scaffold
```

Bootstrap Scaffold Persistence Rule:

```text
Required scaffold directories that may be empty at Bootstrap completion must contain .gitkeep.

README.md is a required Project Scaffold file.

Bootstrap scaffold proof must be verifiable from committed and pushed Git repository state.
```

---

## Create Runtime Authority

Create:

```text
PROJECT_BOOTSTRAP.md
```

PROJECT_BOOTSTRAP.md owns:

```text
Project Name

Current Lifecycle Stage

Current Task

Current Goal

Required Load Set

Next Action

Current Blocker
```

---

## Create Artifact Authority

Create:

```text
ARTIFACT_INDEX.md
```

ARTIFACT_INDEX.md owns:

```text
Artifact Discovery

Artifact Status

Artifact Version Tracking

Required Load Set Resolution
```

---

## Resolve Required Protocol Sources

At minimum:

```text
SAPDP_CANONICAL_PROTOCOL.md
```

must be available.

Projects may additionally load:

```text
Design Assets

Reference Assets

Domain Assets

Product Assets
```

according to project needs.

---

## Bootstrap Validation

Project Bootstrap is complete only when:

```text
Project Workspace Exists

Project Scaffold Exists

Project Name and Project Root are consistent

Final Product Project Root conforms to SAPDP Project Scaffold

PROJECT_BOOTSTRAP.md Exists

ARTIFACT_INDEX.md Exists

Required Protocol Sources Resolved

Required .gitkeep scaffold persistence files exist

Committed and pushed Git repository state proves scaffold existence
```

---

## Enter Problem Stage

Upon successful Bootstrap Validation:

```text
Current Lifecycle Stage
=
Problem
```

Lifecycle execution may begin.

---

## Bootstrap Output

After Bootstrap Validation PASS, Bootstrap must produce:

PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md

Bootstrap output must include:

Bootstrap Audit Result
Current Stage
Next Lifecycle Stage Entry
Execution Environment
Required Load Set
Required Template
Artifact To Create
Exact Next User Action
Expected Output
Runtime Update Target
Next Stage After Completion

Bootstrap PASS is not operationally complete unless all required Bootstrap artifacts exist and the Bootstrap Completion Handoff is produced.


---

## Bootstrap Completion Handoff

Bootstrap Completion Handoff is mandatory.

Bootstrap must produce an explicit handoff into the first Lifecycle Stage.

Bootstrap Completion Handoff only outputs actionable instructions (POST_BOOTSTRAP_ENTRY.md) and does **not** define Lifecycle Stage rules.

Minimum Stage Entry Instruction:

Execution Environment: ChatGPT
Required Load Set:
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
ProblemDefinition_Template.md
Next User Action: Open ChatGPT SAPDP project session and generate ProblemDefinition_CORE_v1.md using ProblemDefinition_Template.md
Expected Output: ProblemDefinition_CORE_v1.md
Runtime Update Target: PROJECT_BOOTSTRAP.md
Next Stage After Completion: Solution

Operational Completion Rule:

Bootstrap Audit Result PASS does not imply operational completion.
Bootstrap is operationally complete only when Bootstrap Completion Handoff exists.

---

## Bootstrap Completion Handoff

Bootstrap Completion Handoff is mandatory.

Bootstrap must produce an explicit handoff into the first Lifecycle Stage.

The handoff must eliminate ambiguity regarding:

```text
Where execution continues

Who performs the next action

What Artifact must be created

What Template must be used

What files must be loaded

What output is expected

How Runtime is updated

Which Lifecycle Stage follows
```

---

## Bootstrap Completion Handoff Artifact

Bootstrap Completion Handoff is represented by:

```text
POST_BOOTSTRAP_ENTRY.md
```

POST_BOOTSTRAP_ENTRY.md is generated during Project Bootstrap.

It exists to make the first Lifecycle Stage executable.

POST_BOOTSTRAP_ENTRY.md must contain:

```text
Current Stage

Next Lifecycle Stage Entry

Execution Environment

Required Load Set

Required Template

Artifact To Create

Exact Next User Action

Expected Output

Runtime Update Target

Next Stage After Completion
```

For a new project, POST_BOOTSTRAP_ENTRY.md must instruct the user to generate:

```text
ProblemDefinition_CORE_v1.md
```

using:

```text
ProblemDefinition_Template.md
```

in:

```text
ChatGPT
```

POST_BOOTSTRAP_ENTRY.md does not own Lifecycle rules.

Lifecycle rules remain owned by:

```text
SAPDP_LIFECYCLE.md
```

POST_BOOTSTRAP_ENTRY.md does not own Project Runtime state.

Project Runtime state remains owned by:

```text
PROJECT_BOOTSTRAP.md
```

POST_BOOTSTRAP_ENTRY.md does not own Artifact Discovery.

Artifact Discovery remains owned by:

```text
ARTIFACT_INDEX.md
```

Bootstrap Validation must fail operationally if POST_BOOTSTRAP_ENTRY.md is missing or does not provide executable next-step guidance.

---

## Protocol Repair Validation Rule

After any Bootstrap Completion Handoff repair, validation must restart from a clean project bootstrap.

The repaired protocol must be validated by:

```text
New product

Clean workspace

Fresh Codex bootstrap

Fresh Bootstrap Audit

Fresh POST_BOOTSTRAP_ENTRY.md

Fresh Problem Stage Entry
```

Validation must not continue from a project created before the repair.

Reason:

A handoff repair affects Bootstrap behavior.

Only a clean bootstrap can verify whether the repaired protocol is executable from the beginning.


---

## Default New Project Handoff

For a new project, Bootstrap must hand off to:

```text
Lifecycle Stage:
Problem
```

Default Bootstrap Completion Handoff:

```text
Bootstrap Audit Result:
PASS

Current Stage:
Problem

Next Lifecycle Stage Entry:
Problem

Execution Environment:
ChatGPT

Required Load Set:

PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

BOOTSTRAP_RESULT.md

POST_BOOTSTRAP_ENTRY.md

ProblemDefinition_Template.md

Required Template:
ProblemDefinition_Template.md

Artifact To Create:
ProblemDefinition_CORE_v1.md

Exact Next User Action:

Open a ChatGPT SAPDP project session and generate:

ProblemDefinition_CORE_v1.md

using:

ProblemDefinition_Template.md

Expected Output:
ProblemDefinition_CORE_v1.md

Runtime Update Target:
PROJECT_BOOTSTRAP.md

Next Stage After Completion:
Solution
```

---

## Invalid Bootstrap Output Example

The following output is insufficient:

```text
Current Stage:
Problem

Next Action:
Create ProblemDefinition_CORE_v1.md
```

Reason:

The output does not define:

```text
Execution Environment

Required Load Set

Required Template

Expected Output

Runtime Update Target

Next Stage After Completion
```

Therefore the output is not executable.

---

## Operational Completion Rule

Bootstrap Audit Result:

```text
PASS
```

does not imply operational completion.

Bootstrap is operationally complete only when:

```text
Bootstrap Audit Result:
PASS

AND

Bootstrap Completion Handoff exists
```

If the handoff is missing:

```text
Bootstrap Status:
Operationally Incomplete
```

even if:

```text
Bootstrap Audit Result:
PASS
```

---

## POST_BOOTSTRAP_ENTRY.md Authority

POST_BOOTSTRAP_ENTRY.md is the authoritative Bootstrap Completion Handoff artifact.

POST_BOOTSTRAP_ENTRY.md owns:

```text
Next Lifecycle Stage Entry

Execution Environment

Required Load Set

Required Template

Artifact To Create

Exact Next User Action

Expected Output

Runtime Update Target

Next Stage After Completion
```

Bootstrap Validation is not complete until:

```text
POST_BOOTSTRAP_ENTRY.md
```

has been successfully generated.



---

## Runtime Navigation System

SAPDP adopts:

```text
Runtime Navigation System
```

Runtime Navigation provides:

```text
Lifecycle Progress

Current Stage

Next Stage
```

Runtime Navigation is:

```text
Navigation Information
```

only.

Runtime Navigation is derived from:

```text
PROJECT_BOOTSTRAP.md
```

Runtime Navigation never becomes:

```text
Runtime State
```

---

## Lifecycle Progress UI Standard

SAPDP adopts:

```text
Lifecycle Progress UI Standard
```

Standard format:

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

Alternative display formats are prohibited.

Lifecycle Progress UI must use the canonical ● / ○ format.

---

## Bootstrap Productionization Audit

SAPDP adopts:

```text
Bootstrap Productionization Audit
```

Bootstrap Productionization Audit verifies:

```text
Project Structure

Bootstrap Completion Handoff

Template Availability

Project Identity Readiness

Scaffold Conformance Readiness

Project Setup Readiness

Lifecycle Entry Readiness
```

Bootstrap Productionization Audit is:

```text
Compliance Audit
```

only.

Bootstrap Productionization Audit is not:

```text
Runtime Authority

Lifecycle Authority

Quality Authority
```

# 15. Runtime Execution Protocol

Execution Flow:

```text
Determine Current Lifecycle Stage
↓
Resolve Required Load Set
↓
Resolve Project Instruction Set
↓
Load Required Artifacts
↓
Artifact Delivery
↓
Artifact-Based Handoff
↓
Execute Current Stage
↓
Produce Artifact
↓
Persist Artifact To Git
↓
Push Git State
↓
Verify Quality
↓
Accept Artifact
↓
Produce Runtime Completion Block
↓
Update Runtime State
↓
Advance Lifecycle

```

Lifecycle progression must stop if:

```text
Required Load Set
cannot be resolved.
```

### Git Artifact Commitment Rule

All Codex-generated SAPDP artifacts must be persisted into Git before audit.

Artifacts existing only in runtime memory are considered:

```text
Non-existent
```

Mandatory execution order:

```text
Codex Execution
→ Artifact Generation
→ Git Add
→ Git Commit
→ Git Push
→ Git Fetch
→ Remote Verification
→ Clean Status Verification
→ ChatGPT Audit
```

This rule applies to:

```text
Reality Validation

Bootstrap

Upgrade

Audit

Release
```

ChatGPT must audit:

```text
Committed Git repository state
```

ChatGPT must not audit:

```text
Runtime-only outputs

Uncommitted artifacts

Conversation-only artifacts
```

Audit must fail when a required artifact has not been committed to Git.

Codex task completion requires:

```text
Codex Execution
→ Artifact Generation
→ Git Add
→ Git Commit
→ Git Push
→ Git Fetch
→ Remote Verification
→ Clean Status Verification
→ ChatGPT Audit
```

A Codex task is incomplete if:

```text
git status is not clean

generated artifacts are unstaged

generated artifacts are uncommitted

commits are unpushed

required tags are local only

remote GitHub state cannot prove the claimed result
```

Git remains:

```text
Single Source Of Truth
```

The Git Artifact Commitment Rule does not introduce:

```text
New Lifecycle Stage

New Authority System

Branch Workflow

Pull Request Workflow
```

### Runtime Completion Contract

Every completed Lifecycle Stage must produce a Runtime Completion Block.

The Runtime Completion Block must contain:

```text
Current Stage

Produced Artifact

Stage Result

Next Stage

Required Load Set

Execution Environment

Need New Session

Next Action
```

Allowed Stage Result values:

```text
ACCEPTED

PATCH REQUIRED

REJECTED

PASS

FAIL
```

Rules:

```text
PASS

FAIL
```

apply only to:

```text
Implementation Verification

User Validation
```

```text
ACCEPTED

PATCH REQUIRED

REJECTED
```

apply to all other Lifecycle Stages.

Need New Session must be:

```text
YES
```

when any condition is true:

```text
Primary execution environment changes

Current stage output is accepted and frozen

Required Load Set changes significantly

Human validation or offline execution is required
```

Otherwise:

```text
Need New Session
=
NO
```

Runtime Completion Block establishes the operational handoff between Lifecycle Stages.

Runtime Completion Block is not:

```text
Artifact

Runtime Authority

Lifecycle Stage

Governance Authority
```

Authoritative runtime state remains:

```text
PROJECT_BOOTSTRAP.md
```

If Runtime Completion changes:

```text
Current Lifecycle Stage

Current Task

Current Goal

Required Load Set

Next Action

Current Blocker
```

then:

```text
PROJECT_BOOTSTRAP.md
```

must be updated.

Lifecycle completion is not operationally complete until:

```text
Runtime Completion Block
```

has been produced.


### Artifact-Based Handoff Protocol

SAPDP adopts Artifact-Based Handoff.

Accepted Artifacts are the authoritative handoff unit.

Conversation history is optional.

Conversation history is not authoritative.

Cross-environment collaboration must be recoverable through:

PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

Accepted Artifacts

Stage handoff remains governed by:

Runtime Completion Contract

Artifact handoff remains governed by:

Artifact-Based Handoff Protocol

### Project Instruction Resolution Protocol

SAPDP adopts Project Instruction Resolution.

Project instructions must be resolved from existing accepted artifacts.

Project instructions are derived inputs.

Project instructions are not a new artifact type.

Project instructions are not a runtime authority.

Tool-level instructions for ChatGPT, Codex, or other AI tools must not duplicate project-specific facts.

Tool-level instructions should only route the AI participant to load:

PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

Required Load Set

Accepted Artifacts

The active Project Instruction Set is resolved from:

Current Lifecycle Stage

Current Task

Required Load Set

Accepted Artifacts

Activated quality-layer artifacts when applicable

Project Instruction Resolution must preserve:

Authority Ownership

Document Minimalism

Artifact-Based Handoff

Runtime Completion Contract

### Artifact Delivery Protocol

SAPDP adopts Artifact Delivery.

Artifact creation and artifact delivery are independent activities.

Accepted Artifacts are the authoritative delivery unit.

Multiple accepted artifacts may be delivered together as a Delivered Artifact Set.

Delivered Artifact Set is a delivery mechanism.

Delivered Artifact Set is not:

An Artifact Type

A Runtime Authority

A Lifecycle Artifact

Supporting Evidence may accompany accepted artifacts.

Supporting Evidence is delivery content only.

Supporting Evidence must not become an independent authority.

When delivery size or complexity exceeds conversation reliability:

Use:

Project Files

Git Repository

Document Upload

Artifact Storage

or equivalent persistent storage.

Conversation output should be used only for:

Reference

Navigation

Delivery Guidance

Artifact Delivery must preserve:

Authority Ownership

Document Minimalism

Artifact-Based Handoff

Runtime Completion Contract

Project Instruction Resolution

---

# 16. Release Criteria

Release is allowed only when:

```text
Implementation Verification
PASS

User Validation
PASS

Required Load Set
Resolved

Runtime State
Consistent

Artifact State
Consistent

Required Release Artifacts
Committed To Git

Git State
Pushed
```

Release Result becomes:

```text
Release Result
=
Accepted
```

and lifecycle status becomes:

```text
Lifecycle Closed
```

---

# 17. Authority Ownership Rule

SAPDP follows:

```text
One Information Type
=
One Authority Owner
```

Ownership:

```text
Foundation
→ SAPDP_FOUNDATION.md

Runtime State
→ SAPDP_BOOTSTRAP.md

Decision
→ SAPDP_DECISION_LOG.md

Goals
→ SAPDP_GOALS_DEFINITION.md

Problem Validation
→ SAPDP_PROBLEM_BASELINE.md

Lifecycle
→ SAPDP_LIFECYCLE.md
```

This document is:

```text
Consumption Layer
```

It consolidates protocol execution.

It does not replace authoritative ownership.

---

# 18. Canonical Execution Rule

When starting a new SAPDP project:

```text
Load SAPDP
↓
Read Canonical Document Set
↓
Determine Runtime State
↓
Load Required Artifacts
↓
Execute Lifecycle Stage
↓
Produce Accepted Artifact
↓
Advance Lifecycle
```

All SAPDP execution must comply with:

```text
Solo-AI Leverage First

Problem-Driven Validation

Authority Ownership

Built-in Quality

Document Minimalism
```

These principles are mandatory.

---

# End Of Protocol

SAPDP v1 is defined as:

```text
Canonical Protocol
+
Project Scaffold
+
Project Runtime
+
Artifact Index
+
Artifact Templates
+
Built-in Quality System
```

SAPDP v1 is considered:

```text
Released
```
