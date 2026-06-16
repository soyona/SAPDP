# DEVELOPER.md

# SAPDP Developer Guide

This document is for maintainers of SAPDP.

If you only want to start a new product project, use:

[START.md](./START.md)

Current Protocol Version:
v1.6.3

Latest Stable Version:
v1.6.3

Version Detection Rules:

```text
Use latest stable version unless explicitly pinned.
Protocol Load Output must include Protocol Version, Current Stage, State Source, and Next Action.
State Source is PROJECT_STATE.md.
Missing PROJECT_STATE.md means BLOCKED.
```

---

# Repository Model

SAPDP repository is organized into four layers:

- [README.md](./README.md)
- [START.md](./START.md)
- [DEVELOPER.md](./DEVELOPER.md)
- [engine/](./engine/)
- [templates/](./templates/)
- [internal/](./internal/)

---

# Layer Responsibilities

## README.md

Public project entry.

Purpose:

```text
Explain what SAPDP is

Explain who should use SAPDP

Point users to [START.md](./START.md)
```

[README.md](./README.md) must not contain:

```text
Runtime State

Decision History

Internal Research

Detailed Protocol Maintenance Rules
```

---

## START.md

New project startup entry.

Purpose:

```text
Help a new user initialize a SAPDP project through Codex
```

[START.md](./START.md) should remain short.

[START.md](./START.md) must answer only:

```text
Load SAPDP

Required files

Current stage

Next action
```

---

## DEVELOPER.md

SAPDP maintainer entry.

Purpose:

```text
Explain repository structure

Explain file responsibilities

Explain maintenance workflow

Explain how SAPDP evolves
```

---

## engine/

Codex-consumable runtime layer.

Purpose:

```text
Provide the executable SAPDP runtime consumed by Codex
during project bootstrap and lifecycle execution.
```

Contains:

```text
SAPDP_BOOTSTRAP.md

SAPDP_CANONICAL_PROTOCOL.md

SAPDP_LIFECYCLE.md

bootstrap/

contracts/
```

Rules:

```text
engine/ must remain optimized for Codex consumption.

engine/ should not contain research history.

engine/ should not contain unnecessary internal decisions.

engine/ should contain only execution-relevant protocol assets.
```

---

## templates/

Artifact template layer.

Purpose:

```text
Provide reusable artifact templates for SAPDP projects.
```

Contains:

```text
ProblemDefinition_Template.md

SolutionDefinition_Template.md

ProductRequirement_Template.md

ProductRepresentation_Template.md

UXSpecification_Template.md

VisualDesignSpecification_Template.md

TechnicalConstraint_Template.md

MVPDefinition_Template.md

TaskPackage_Template.md

ImplementationVerification_Template.md

UserValidation_Template.md

ReleaseResult_Template.md
```

Rules:

```text
templates/ must contain only artifact templates.

templates/ must not contain runtime state.

templates/ must not contain research notes.
```

---

## internal/

SAPDP maintenance source layer.

Purpose:

```text
Preserve SAPDP source decisions, foundation, goals, problem baseline, and governance history.
```

Contains:

```text
SAPDP_FOUNDATION.md

SAPDP_DECISION_LOG.md

SAPDP_GOALS_DEFINITION.md

SAPDP_PROBLEM_BASELINE.md
```

Rules:

```text
internal/ is for SAPDP maintainers.

internal/ is not the default Codex consumption path.

internal/ may influence engine/ only through accepted patches.
```

---

# Maintenance Workflow

SAPDP protocol upgrades follow the Protocol Evolution Lifecycle.

Repository Hygiene Rule:

```text
Do not store release packages, patch dumps, audit reports, migration guides, or historical release evidence in the repository root.

Historical release evidence belongs in Git tags, GitHub Releases, and committed source history.

Temporary release artifacts must be removed before release commit.
```

Standard route:

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

Protocol Evolution is governance only.

v1.6.3 changes the product lifecycle only through the accepted Product Shape Layer and commit-gated lifecycle repair.

It must not otherwise change:

```text
Product bootstrap behavior

Product artifact set beyond accepted Product Shape artifacts

Template directory structure beyond accepted Product Shape templates

v1.6.1 routing and Git-first rules
```

To start or resume a SAPDP protocol upgrade:

```text
Load SAPDP

Mode:
Protocol Evolution
```

---

# Protocol Upgrade Handoff

When ChatGPT approves a protocol upgrade proposal, ChatGPT must output a low-token Codex command.

Required command fields:

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

The Codex command must be sufficient for Codex Upgrade without pasted protocol history or duplicated lifecycle theory.

Codex Upgrade must return minimal Git URL evidence for Release Audit.

---

# Minimal Protocol Release Audit Handoff

SAPDP protocol upgrade releases require a remote audit handoff before PASS.

Scope:

```text
SAPDP protocol upgrade workflow only
```

This rule must not be applied as:

```text
Product Bootstrap behavior

Product audit package rules

New lifecycle stages

New status models
```

Codex may report protocol release PASS only after:

```text
Changes are committed

Commit is pushed to remote main

Version tag is created

Tag is pushed to remote

Remote commit is verified on remote main

Remote tag is verified on remote

Final output includes Commit URL and Tag URL
```

ChatGPT Release Audit input must use:

```text
Commit URL

Tag URL
```

Human paste of changed files is fallback only.

If the remote commit or remote tag cannot be verified, the final protocol release result must be:

```text
PATCH REQUIRED
```

or:

```text
FAIL
```

It must not be:

```text
PASS
```

Required final protocol release output format:

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

# Product Workflow Routing & Token Efficiency

SAPDP v1.5.0 adds mandatory lifecycle execution Route Cards while preserving Git audit source rules.

This upgrade does not add lifecycle stages, artifacts, or lifecycle status models.

ChatGPT-generated Codex task packages must use:

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

Codex product implementation completion must use:

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

Every stage completion must output one Route Card:

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

Route Card rules:

```text
Current and Next must include stage, environment, project, and session when applicable.

Environment values are ChatGPT, Codex, Git, and Human.

Session values are CURRENT, NEW, and REUSE_EXISTING.

Action must be executable.

Do not output the full lifecycle unless explicitly requested.
```

Default route map:

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

When next environment is Codex, the Route Card must include:

```text
Codex workspace
Source artifact or commit URL
Minimal Codex startup instruction
Expected output: Commit URL, Tests, Result
```

When next environment is ChatGPT, the Route Card must include:

```text
ChatGPT Project
Session mode
Startup prompt if NEW
Audit source commit URL if available
Next artifact or action
```

For new products, create or use a ChatGPT Project named after the product.

## SAPDP v1.6.0 Context Routing Optimization

SAPDP v1.6.0 adds ROUTE_MANIFEST.md as a persistent route recovery artifact.

Compatibility rule:

```text
Valid v1.5.0 Route Cards remain valid.

Missing ROUTE_MANIFEST.md in an existing v1.5.0 product repository requires migration, not lifecycle failure.
```

Ownership:

```text
Codex owns route generation.

ChatGPT owns route consumption.
```

Authority boundaries:

```text
PROJECT_BOOTSTRAP.md
=
Bootstrap Metadata Authority

PROJECT_STATE.md
=
Lifecycle State Authority

ARTIFACT_INDEX.md
=
Artifact Discovery Authority

ROUTE_MANIFEST.md
=
Route Manifest Authority

SAPDP_LIFECYCLE.md
=
Lifecycle Authority
```

Every artifact template must include an Artifact Routing block:

```text
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

Artifact Routing blocks are route metadata only. They must not redefine lifecycle rules, artifact discovery, or runtime state.

Bootstrap -> Problem uses NEW session by default.

Later ChatGPT stages use CURRENT unless context is heavy.

Git is the default audit memory.

Human copy/paste is fallback only.

---

# Patch Rules

SAPDP uses PATCH MODE.

Preferred patch types:

```text
Append

Replace Section

Move File

Rename File
```

Avoid:

```text
Full document regeneration

Unnecessary file creation

Duplicate authority definitions

Protocol expansion without real validation
```

Every patch should preserve:

```text
Authority Ownership

Document Minimalism

Codex Executability

Developer Experience
```

---

# Authority Rules

SAPDP follows single authority ownership.

Runtime execution assets belong in:

```text
engine/
```

Artifact templates belong in:

```text
templates/
```

Protocol maintenance sources belong in:

```text
internal/
```

User onboarding belongs in:

- [README.md](./README.md)
- [START.md](./START.md)

A file should not duplicate authority owned by another layer.

---

# Codex Consumption Path

For project initialization, Codex should primarily consume:

- [START.md](./START.md)
- [engine/](./engine/)
- [templates/](./templates/)

Codex should not need to inspect:

```text
internal/
```

unless performing SAPDP maintenance.

---

# Bootstrap Validation

A project bootstrap is valid only when Codex can generate:

```text
Project Scaffold

PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

WORKSPACE_CONTRACT.md

STARTUP_PACKAGE.md

instructions/

docs/

templates/

src/

tests/
```

and return:

```text
Bootstrap Audit Result: PASS

Current Stage: Problem

Next Action: Generate ProblemDefinition
```

---

# Development Lifecycle

SAPDP runtime lifecycle:

```text
Bootstrap
↓
Problem
↓
Solution
↓
Product Representation
↓
MVP Definition
↓
Build
↓
Implementation Verification
↓
User Validation
↓
Release
```

Bootstrap is a prerequisite system before lifecycle execution.

Lifecycle begins at:

```text
Problem
```

---

# Maintainer Rule

SAPDP should evolve as a productized runtime system, not as an expanding theory document.

Every change must answer:

```text
Does this improve real SAPDP project execution?
```

If not, it should not enter SAPDP.
