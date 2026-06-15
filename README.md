# SAPDP

AI-Native Solo Product Development System

SAPDP is a development operating system designed for:

```text
Human
+
ChatGPT
+
Codex
+
Git
```

It provides a structured way to build software products with AI while maintaining:

```text
Low Context Cost

Low Decision Cost

High Execution Consistency

High Traceability

High Reusability
```

---

# Why SAPDP Exists

AI-assisted development often suffers from:

```text
Lost Context

Repeated Decisions

Documentation Chaos

Implementation Drift

Unclear Next Steps
```

As projects grow, developers spend increasing time reconstructing state rather than building products.

SAPDP solves this by providing a consistent execution model from:

```text
Idea
↓
Release
```

with explicit stages, artifacts, validation, and ownership.

---

# Who Should Use SAPDP

SAPDP is designed for:

```text
Solo Developers

Indie Hackers

Product Builders

AI-Assisted Development Teams
```

especially those using:

```text
ChatGPT

Codex

GitHub
```

to build:

```text
Web Applications

SaaS Products

Internal Tools

Automation Systems

Content Systems
```

---

# Development Lifecycle

SAPDP follows:

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

At every stage SAPDP defines:

```text
Current Goal

Required Inputs

Expected Outputs

Next Action
```

so workflow state does not depend on human memory.

---

# Quick Start

To start a new project:

```text
Open START.md
```

A new SAPDP project can typically be initialized within minutes using Codex.

---

# Protocol Release Audit Handoff

SAPDP v1.2.6 requires a minimal protocol release handoff.

Codex may report a SAPDP protocol release PASS only after:

```text
Committed changes

Pushed commit to remote main

Created version tag

Pushed version tag to remote

Verified remote commit

Verified remote tag

Included Commit URL and Tag URL in the minimal final handoff
```

If the remote commit or remote tag cannot be verified, the final protocol release result must be:

```text
PATCH REQUIRED
```

or:

```text
FAIL
```

This rule applies only to SAPDP protocol upgrade workflow.

It does not change product Bootstrap behavior, add product audit package rules, or introduce lifecycle stages/status models.

Required final output:

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

Do not repeat Repository, Branch, Commit SHA, Tag, remote verification, validation checklist, or git execution logs in final output.

---

# Bootstrap Completion UX Repair

SAPDP v1.2.4 separates local Bootstrap success from remote Git validation.

Bootstrap completion must report:

```text
Local Bootstrap Result:
LOCAL_BOOTSTRAP_PASS or LOCAL_BOOTSTRAP_FAIL

Remote Git Validation:
REMOTE_VALIDATION_PASS or REMOTE_VALIDATION_PENDING or REMOTE_VALIDATION_FAIL

Overall Stage Entry:
PROBLEM_STAGE_ALLOWED or PROBLEM_STAGE_BLOCKED
```

If local Bootstrap succeeds and all required Bootstrap artifacts exist, Problem Stage may be allowed even when Remote Git Validation is REMOTE_VALIDATION_PENDING.

Remote validation pending is a traceability limitation, not a local Bootstrap failure.

Codex final output after initialization must contain:

```text
A. Bootstrap Summary
B. ChatGPT Handoff
C. Codex Workspace Handoff
D. Problem Stage Entry
E. Remote Git Validation
F. Final Decision
```

Final Decision must not say plain FAIL when local Bootstrap succeeds.

---

# Bootstrap Workspace Handoff

SAPDP v1.2.3 requires Bootstrap completion to explicitly hand off both AI workspaces.

## Post-Bootstrap ChatGPT Session Handoff

After LOCAL_BOOTSTRAP_PASS with PROBLEM_STAGE_ALLOWED, the generated handoff must tell the user:

```text
Load SAPDP from:
https://github.com/soyona/SAPDP
```

New products must create a product-bound ChatGPT Project and upload the Required Load Set.

Start from Problem Stage.

Generate ProblemDefinition_CORE_v1.md using ProblemDefinition_Template.md.

## Post-Bootstrap Codex Workspace Handoff

The generated handoff must also tell the user:

```text
Open or switch Codex workspace to:

<Project Root>

Use this initialized project directory as the active workspace.
Do not continue product implementation from the SAPDP protocol repository.
Codex must not continue product work from the SAPDP protocol repository.
```

---

# Codex Completion Verification

SAPDP v1.3.0 requires product implementation completion to be minimal and verified from Git state.

Codex completion requires:

```text
Clean git status

Committed work

Pushed commit when origin exists

Commit URL when origin exists

Required checks passed or reported

Minimal ChatGPT audit prompt
```

Codex must not claim completion based only on local changes, local runtime output, unstaged files, uncommitted files, or unpushed commits.

Required product implementation completion output:

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

If origin is missing, Codex must output the local commit SHA and exact push commands.

Codex must not output full diff, git logs, verbose summaries, or duplicated repository metadata.

Result may be PASS only if the working tree is clean and required checks passed.

---

# Token-Efficient Task Packages

When ChatGPT generates Codex execution instructions, SAPDP v1.3.0 requires:

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

Use paths, commit URLs, and artifact names instead of pasted full content.

---

# Minimal Stage Navigation

Every product lifecycle stage completion handoff must show only:

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

Do not repeat the full lifecycle unless the user is lost or explicitly asks.

---

# Bootstrap Scaffold Persistence

SAPDP v1.2.1 requires Bootstrap scaffold proof to be visible in committed Git state.

Bootstrap must create:

```text
README.md

.gitkeep files for scaffold directories that may otherwise be empty
```

Bootstrap PASS cannot be based only on local empty directories or runtime-only artifacts.

---

# Bootstrap Completion System

SAPDP v1.1 introduces:

```text
Bootstrap Completion System v2
```

A successful Bootstrap must now provide:

```text
Project Root

Working Directory

Execution Environment

Required Load Set

Codex Project Setup Guide

ChatGPT Project Setup Guide
```

Bootstrap PASS alone is insufficient.

Bootstrap is operationally complete only when:

```text
Bootstrap Completion Handoff
```

has been produced.

The Bootstrap Completion Handoff is instantiated in:

```text
POST_BOOTSTRAP_ENTRY.md
```

and enables direct entry into:

```text
Problem Stage
```

without additional workflow discovery.

---

# Runtime Navigation

SAPDP v1.1 introduces:

```text
Runtime Navigation System
```

Runtime Navigation provides:

```text
Current Stage

Next Stage

Lifecycle Progress
```

Navigation information is derived from:

```text
PROJECT_BOOTSTRAP.md
```

and never becomes an independent runtime authority.

---

# Bootstrap Productionization Audit

SAPDP v1.1 introduces:

```text
Bootstrap Productionization Audit
```

Bootstrap Validation verifies:

```text
Correctness
```

Bootstrap Productionization Audit verifies:

```text
Operational Usability
```

A project is ready to enter the Lifecycle only when:

```text
Bootstrap Validation
PASS

and

Bootstrap Productionization Audit
PASS
```


---

# Repository Structure

```text
README.md
START.md
DEVELOPER.md

engine/
templates/
internal/
```

### START.md

Project startup entry.

### DEVELOPER.md

SAPDP maintainer guide.

### engine/

Runtime assets consumed by Codex.

### templates/

Artifact template library.

### internal/

SAPDP source decisions, research, and maintenance materials.

---

# Philosophy

SAPDP is built on a simple principle:

```text
Humans make decisions.

AI performs execution.

The system owns the workflow.
```

---

# Next Step

If you want to start a project:

```text
Open START.md
```

If you want to contribute to SAPDP:

```text
Open DEVELOPER.md
```
