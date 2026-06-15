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

# 5.1 Git Truth Source Rule

Git remote state is the default audit source for SAPDP governance and workflow verification.

Protocol Release Audit must use remotely verifiable Git state.

Protocol release PASS requires:

```text
Commit URL

Tag URL

Remote commit verification

Remote tag verification
```

If the commit or tag is not remotely verifiable, the protocol release result must not be PASS.

Codex Completion Audit must prefer:

```text
Commit URL
```

over:

```text
Pasted diffs

Pasted files

Runtime-only output
```

Human copy/paste is fallback only.

---

# 5.2 Minimal Protocol Release Audit Handoff Rule

For SAPDP protocol upgrade releases, Codex must not report PASS until Git remote state is audit-ready for ChatGPT.

This rule applies only to the SAPDP protocol repository release workflow.

It does not define product Bootstrap behavior, product audit package rules, lifecycle stages, or lifecycle status models.

Protocol release PASS requires:

```text
Changes committed

Commit pushed to remote main

Version tag created

Tag pushed to remote

Remote commit verified on remote main

Remote tag verified on remote

Commit URL included in final output

Tag URL included in final output
```

If the commit or tag is not remotely verifiable, the protocol release result must be:

```text
PATCH REQUIRED
```

or:

```text
FAIL
```

The protocol release result must not be:

```text
PASS
```

Remote Git state is the audit authority for SAPDP protocol release verification.

Final protocol release output must use the minimal handoff format:

```text
Protocol Release Audit Handoff

Version:
vX.Y.Z

Commit URL:
https://github.com/soyona/SAPDP/commit/<sha>

Tag URL:
https://github.com/soyona/SAPDP/releases/tag/vX.Y.Z

Files Changed:
<n>

Release Result:
PASS / PATCH REQUIRED / FAIL
```

Final protocol release output must not repeat:

```text
Repository

Branch

Commit SHA

Tag

Remote verification

Validation checklist

Git execution logs
```

---

# 5.2.1 Protocol Evolution Lifecycle Rule

SAPDP protocol upgrades use the Protocol Evolution Lifecycle.

This lifecycle is a protocol governance route only.

It does not define product development stages.

It does not change:

```text
Product lifecycle stage set

Product bootstrap behavior

Product artifact set

Template directory structure

Product workflow routing rules

Git-first audit rules
```

Standard protocol upgrade route:

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

Stage ownership:

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

Protocol Evolution startup:

```text
Load SAPDP

Mode:
Protocol Evolution
```

Protocol Evolution startup must start or resume SAPDP protocol upgrade flow.

It must not start product development flow.

It must not invoke product Bootstrap.

## Protocol Upgrade Handoff Rule

When ChatGPT approves a protocol upgrade proposal, ChatGPT must output a low-token Codex command.

The command must include:

```text
Version

Release Name

Problem

Goal

Scope

Required Changes

Validation

Final Output Format
```

The command must be sufficient for Codex Upgrade without requiring the Human to re-agree the upgrade process.

The command must prefer concise references, requirements, and Git evidence over pasted protocol history.

## Protocol Release Audit Input Rule

ChatGPT Release Audit must use:

```text
Commit URL

Tag URL
```

Human paste of changed files is fallback only.

Release Audit PASS requires minimal Git URL evidence:

```text
Commit URL

Tag URL
```

If Commit URL or Tag URL is missing or not remotely verifiable, Release Audit must not return PASS.

---

# 5.3 Product Workflow Routing & Token Efficiency Rule

This rule applies only to product development workflow.

It does not change:

```text
Lifecycle Stage Set

Lifecycle status models
```

## 5.3.1 Codex Completion Handoff Rule

After Codex completes any product implementation task, final output must use this minimal format:

```text
Codex Completion Handoff

Project:
<name>

Commit URL:
<url>

Changed:
<n>

Tests:
PASS / FAIL / NOT RUN

Result:
PASS / PATCH REQUIRED / FAIL

ChatGPT Audit:
<Commit URL>
```

Rules:

```text
Commit URL is mandatory when origin exists.

If origin is missing, output local commit SHA and exact push commands.

Do not output repository duplication, branch duplication, commit SHA duplication, full diff, git logs, verbose summaries, or duplicated repository metadata.

Result may be PASS only if working tree is clean and required checks passed.
```

## 5.3.2 Task Package Token Budget Rule

When ChatGPT generates Codex execution instructions, use this minimal structure:

```text
Task:
<one sentence>

Inputs:
<artifact paths or commit URLs>

Scope:
<must do>
<must not do>

Acceptance:
<3-7 checks>

Output:
Commit URL
Tests
Result
```

Rules:

```text
Prefer artifact paths, commit URLs, and repository references over pasted full content.

Avoid pasted documents, lifecycle explanations, and repeated context.

Do not include lifecycle theory.

Do not request broad implementation beyond current stage scope.
```

## 5.3.3 Route Card Rule

Every product lifecycle stage completion must output one compact Route Card.

The Route Card is the user-facing handoff for the current transition.

ROUTE_MANIFEST.md is the persistent route recovery artifact.

Required format:

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

Rules:

```text
Current and Next must include stage, environment, project, and session when applicable.

Allowed Environment values:
ChatGPT
Codex
Git
Human

Allowed Session values:
CURRENT
NEW
REUSE_EXISTING

Action must be executable.

Do not show the full lifecycle by default.

Show only the current transition unless the user asks for a route map.

Do not require Human to infer the next environment, project, session, source, or executable action.

Do not include generic guidance.
```

The Route Card must be compatible with the current route recorded in ROUTE_MANIFEST.md when ROUTE_MANIFEST.md exists.

Missing ROUTE_MANIFEST.md in a pre-v1.6.0 product repository must not invalidate a valid v1.5.0 Route Card.

## 5.3.4 Stage Route Map

The default route map is:

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

The route map is a routing reference only.

It does not add lifecycle stages, artifacts, status models, or template directories.

The route map must not be output by default.

## 5.3.5 ChatGPT to Codex Handoff Rule

When the next environment is Codex, the Route Card must include:

```text
Codex workspace

Source artifact or commit URL

Minimal Codex startup instruction

Expected output:
Commit URL
Tests
Result
```

The Action must be directly executable in Codex.

The source artifact or commit URL must be sufficient for Codex to begin without pasted full lifecycle context.

## 5.3.6 Codex to ChatGPT Handoff Rule

When the next environment is ChatGPT, the Route Card must include:

```text
ChatGPT Project

Session mode

Startup prompt if NEW

Audit source commit URL if available

Next artifact or action
```

If context is heavy after Build, Codex may route to a NEW ChatGPT session; otherwise use CURRENT.

Commit URL is the preferred audit source when available.

## 5.3.7 ChatGPT Project Rule

For new products, create or use a ChatGPT Project named:

```text
<Product>
```

Bootstrap -> Problem uses NEW session by default.

Later ChatGPT stages use CURRENT unless context is heavy.

If a product-bound ChatGPT Project already exists, use that project and set Session to REUSE_EXISTING only when a previously established session must be reused.

## 5.3.8 Human and Git Exception Handoff Rule

When the next environment is Human or Git, the Route Card must identify the required exception action.

Examples:

```text
Human:
Review User Validation issue and choose PASS, PATCH REQUIRED, or FAIL.

Git:
Push commit and tag, then return Commit URL or Tag URL.
```

Human and Git exception paths must preserve Git-first audit rules.

## 5.3.9 Route Manifest Rule

SAPDP v1.6.0 introduces ROUTE_MANIFEST.md for context routing optimization.

ROUTE_MANIFEST.md records compact route metadata so ChatGPT can recover the current route without reloading the full artifact graph.

Ownership:

```text
Codex
=
Route Generation Owner

ChatGPT
=
Route Consumption Owner
```

ROUTE_MANIFEST.md owns:

```text
Current Route

Next Route

Artifact Routing Blocks

Route Audit Source

Route Update Timestamp
```

ROUTE_MANIFEST.md must not own:

```text
Runtime State

Artifact Discovery

Artifact Existence

Lifecycle Stage Rules

Artifact Formats
```

Authority remains:

```text
PROJECT_BOOTSTRAP.md
=
Runtime Authority

ARTIFACT_INDEX.md
=
Artifact Discovery Authority

SAPDP_LIFECYCLE.md
=
Lifecycle Authority
```

Rules:

```text
Codex creates ROUTE_MANIFEST.md during Bootstrap.

Codex persists accepted route updates when repository state changes.

ChatGPT reads ROUTE_MANIFEST.md when consuming or recovering route context.

ChatGPT may propose route updates through Artifact Routing Blocks.

Route Manifest absence in pre-v1.6.0 repositories is migration-required, not protocol failure.
```

## 5.3.10 Artifact Routing Block Rule

Every SAPDP artifact template must include an Artifact Routing Block.

Required block:

```text
# Artifact Routing

Route Manifest:
ROUTE_MANIFEST.md

Route Role:
<how this artifact participates in routing>

Producer:
<Human | ChatGPT | Codex | Git>

Consumer:
<Human | ChatGPT | Codex | Git>

Next Action:
<one executable action after this artifact is accepted>

Audit Source:
<artifact path or commit URL>
```

Rules:

```text
The block must use route metadata only.

The block must not redefine lifecycle stage rules.

The block must not duplicate full Required Load Sets.

The block must not paste full artifact content.

The block must be usable by Codex to update ROUTE_MANIFEST.md.

The block must be usable by ChatGPT to consume the next route.
```

## 5.3.11 Git Memory Rule

Git is the default audit memory for product development workflow.

Codex must commit completed work.

If origin exists, Codex must push and return Commit URL.

ChatGPT audit should use Commit URL before asking Human to paste files.

Human copy/paste is fallback only.

## 5.3.12 Product Bootstrap Route Card Rule

After product bootstrap, Codex final output must use:

```text
Route

Current:
Bootstrap · Codex · <Project>

Done:
<Commit URL>

Next:
Problem · ChatGPT · <Project> Project · NEW session

Action:
Create ProblemDefinition_CORE_v1.md

Start:
Load SAPDP from:
https://github.com/soyona/SAPDP

Audit product commit:
<remote product commit URL>

Audit:
<remote product commit URL>

Workspace:
<absolute project root>

Result:
PASS | PATCH REQUIRED | FAIL

Do not continue product implementation from the SAPDP protocol repository.
```

Problem Stage is executed in ChatGPT by default.

New product Bootstrap must recommend creating a ChatGPT Project named after the product.

If a product-bound ChatGPT Project already exists, reuse it.

If a remote product commit exists, ChatGPT audit must use the Commit URL.

The file upload list is fallback only.

If the remote product commit is missing, Codex must output the local commit SHA and exact push commands, and Result must not be PASS.

The final Bootstrap Route Card must not show internal Bootstrap state names, including:

```text
LOCAL_BOOTSTRAP_PASS
REMOTE_VALIDATION_PASS
REMOTE_VALIDATION_PENDING
PROBLEM_STAGE_ALLOWED
```

The Commit URL in the final handoff is the only ChatGPT audit target.

Do not output conflicting verified commit values.

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

## Route Card Rule

Lifecycle completion is not operationally complete until:

```text
Route Card
```

has been produced.

Every product Lifecycle Stage completion must produce a Route Card.

The Route Card is mandatory.

The Route Card is:

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

The Route Card must show only the current transition by default.

The full route map may be shown only when the user asks for it.

ROUTE_MANIFEST.md may be read when route recovery is needed.

ROUTE_MANIFEST.md must not replace the Route Card as the stage completion output.

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

ROUTE_MANIFEST.md
=
Stores Current Route Metadata
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

ROUTE_MANIFEST.md records:

```text
The compact route metadata
needed to recover the current transition.
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
Bootstrap Route Card
```

has been produced.

Bootstrap Route Card must disclose:

```text
Current stage/environment/project/session

Done commit or result

Next stage/environment/project/session

Action

Start

Result

Audit

Codex Workspace

Codex workspace boundary sentence
```

Bootstrap Route Card provides:

```text
Execution Guidance
```

only.

Bootstrap Route Card is not:

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

## Create Route Manifest Authority

Create:

```text
ROUTE_MANIFEST.md
```

ROUTE_MANIFEST.md owns:

```text
Route Recovery

Current Route Metadata

Next Route Metadata

Artifact Routing Blocks
```

Route Manifest ownership:

```text
Codex owns route generation.

ChatGPT owns route consumption.
```

ROUTE_MANIFEST.md must not redefine PROJECT_BOOTSTRAP.md, ARTIFACT_INDEX.md, or SAPDP_LIFECYCLE.md authority.

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

Route Card
Current stage/environment/project/session
Done commit or result
Next stage/environment/project/session
Action
Start
Audit
Workspace
Result
Codex workspace boundary sentence

Bootstrap PASS is not operationally complete unless all required Bootstrap artifacts exist and the Bootstrap Route Card is produced.


---

## Bootstrap Completion Route Card

Bootstrap Completion Route Card is mandatory.

Bootstrap must produce an explicit handoff into the first Lifecycle Stage.

Bootstrap Completion Route Card only outputs actionable instructions (POST_BOOTSTRAP_ENTRY.md) and does **not** define Lifecycle Stage rules.

Minimum Stage Entry Instruction:

Route
Current: Bootstrap · Codex · <Project Name>
Done: <Commit URL>
Next: Problem · ChatGPT · <Project Name> Project · NEW session
Action: Create ProblemDefinition_CORE_v1.md
Start:
Load SAPDP from:
https://github.com/soyona/SAPDP
Audit product commit:
<Commit URL>
Audit: <Commit URL>
Workspace: <absolute project root>
Do not continue product implementation from the SAPDP protocol repository.

Operational Completion Rule:

Bootstrap Route Card Result PASS does not imply operational completion.
Bootstrap is operationally complete only when Bootstrap Completion Route Card exists.

---

## Bootstrap Completion Route Card

Bootstrap Completion Route Card is mandatory.

Bootstrap must produce an explicit handoff into the first Lifecycle Stage.

The handoff must eliminate ambiguity regarding:

```text
Where execution continues

What Artifact must be created

What Commit URL the Startup prompt instructs ChatGPT to audit

What fallback applies if the remote commit is missing

What result was reached

Which workspace Codex must use
```

---

## Bootstrap Route Card Template

Bootstrap Route Card is represented by:

```text
POST_BOOTSTRAP_ENTRY.md
```

POST_BOOTSTRAP_ENTRY.md is generated during Project Bootstrap.

It exists to make the first Lifecycle Stage executable.

POST_BOOTSTRAP_ENTRY.md must contain:

```text
Project

Commit URL

Stage

Next

Result

ChatGPT Audit

Codex Workspace

Codex workspace boundary sentence
```

If no remote product commit exists, POST_BOOTSTRAP_ENTRY.md must include:

```text
Local Commit

Push Commands
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

After any Bootstrap Route Card repair, validation must restart from a clean project bootstrap.

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

Environment:
ChatGPT
```

Default Bootstrap Completion Route Card:

```text
Route

Current:
Bootstrap · Codex · <Project>

Done:
<remote product commit URL>

Next:
Problem · ChatGPT · <Project> Project · NEW session

Action:
Create ProblemDefinition_CORE_v1.md

Start:
Load SAPDP from:
https://github.com/soyona/SAPDP

Audit product commit:
<remote product commit URL>

Audit:
<remote product commit URL>

Workspace:
<absolute project root>

Result:
PASS | PATCH REQUIRED | FAIL

Do not continue product implementation from the SAPDP protocol repository.
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
Commit URL

ChatGPT Audit

Result

Codex Workspace

Codex workspace boundary sentence
```

Therefore the output is not executable.

---

## Operational Completion Rule

Bootstrap Route Card Result:

```text
PASS
```

does not imply operational completion.

Bootstrap is operationally complete only when:

```text
Result:
PASS

AND

Bootstrap Route Card exists
```

If the handoff is missing:

```text
Bootstrap Status:
Operationally Incomplete
```

even if:

```text
Result:
PASS
```

---

## POST_BOOTSTRAP_ENTRY.md Authority

POST_BOOTSTRAP_ENTRY.md is the authoritative Bootstrap Route Card template.

POST_BOOTSTRAP_ENTRY.md owns:

```text
Project

Commit URL

Stage

Next

Result

ChatGPT Audit

Codex Workspace

Codex workspace boundary sentence

Missing remote fallback commands
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

Bootstrap Route Card

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
Produce Route Card
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

Every completed product Lifecycle Stage must produce a minimal stage navigation handoff.

The stage completion handoff must identify the next execution environment:

```text
Current:
<stage>

Done:
<artifact/result>

Environment:
<next environment>

Session:
NEW | CURRENT | REUSE_EXISTING

Action:
<one executable action>
```

The handoff must not repeat:

```text
Full lifecycle

Generic guidance

Verbose artifact summaries

Runtime metadata
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

This release does not add or rename Stage Result values.

Minimal stage navigation handoff establishes the operational handoff between Lifecycle Stages.

Minimal stage navigation handoff is not:

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

If runtime state changes:

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
Route Card
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

When starting a new SAPDP product project:

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

When starting or resuming a SAPDP protocol upgrade:

```text
Load SAPDP

Mode:
Protocol Evolution
↓
Enter Protocol Evolution Lifecycle
↓
Resume current protocol upgrade stage
↓
Produce required Git URL evidence at Codex Upgrade and Release Audit
```

Protocol Evolution mode is distinct from Product Development mode.

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
