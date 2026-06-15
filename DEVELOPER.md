# DEVELOPER.md

# SAPDP Developer Guide

This document is for maintainers of SAPDP.

If you only want to start a new product project, use:

```text
START.md
```

---

# Repository Model

SAPDP repository is organized into four layers:

```text
README.md
START.md
DEVELOPER.md

engine/
templates/
internal/
```

---

# Layer Responsibilities

## README.md

Public project entry.

Purpose:

```text
Explain what SAPDP is

Explain who should use SAPDP

Point users to START.md
```

README.md must not contain:

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

START.md should remain short.

START.md must answer only:

```text
How to start

What to paste into Codex

What result to expect

What to do next
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

SAPDP maintenance follows:

```text
Identify validated problem
↓
Record or reference problem source
↓
Design minimal change
↓
Freeze decision in internal/
↓
Patch affected runtime files in engine/
↓
Patch affected templates if needed
↓
Patch README.md / START.md only if user-facing behavior changes
↓
Validate with real project bootstrap or lifecycle execution
```

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

ChatGPT Audit:

Load SAPDP from:
https://github.com/soyona/SAPDP

Audit Release:
vX.Y.Z
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

# Product Workflow Handoff & Token Efficiency

SAPDP v1.3.0 adds product workflow handoff rules only.

This upgrade does not change product Bootstrap behavior, lifecycle stages, or lifecycle status models.

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
<n files>

Tests:
PASS / FAIL / NOT RUN

Result:
PASS / PATCH REQUIRED / FAIL

ChatGPT Audit:

Load SAPDP from:
https://github.com/soyona/SAPDP

Audit Codex result:
<Commit URL>
```

Product lifecycle stage completion handoff must show only:

```text
Current:
<stage>

Done:
<artifact/result>

Next:
<stage>

Action:
<one concrete action>
```

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

```text
README.md

START.md
```

A file should not duplicate authority owned by another layer.

---

# Codex Consumption Path

For project initialization, Codex should primarily consume:

```text
START.md

engine/

templates/
```

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
