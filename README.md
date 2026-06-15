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

SAPDP v1.6.2 requires a minimal protocol release handoff backed by remotely verifiable Git state.

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
```

Do not repeat Repository, Branch, Commit SHA, Tag, remote verification, validation checklist, or git execution logs in final output.

---

# Protocol Evolution Lifecycle

SAPDP v1.6.2 defines a formal governance route for upgrading SAPDP itself:

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

To start or resume protocol upgrade flow:

```text
Load SAPDP

Mode:
Protocol Evolution
```

Protocol Evolution mode is distinct from Product Development mode.

It does not change product lifecycle stages, product bootstrap behavior, product artifacts, template directory structure, or v1.6.1 routing and Git-first rules.

ChatGPT Release Audit must use Commit URL and Tag URL.

Human paste of changed files is fallback only.

---

# Lifecycle Execution Routing

SAPDP v1.5.0 requires every stage completion to output one compact Route Card.

SAPDP v1.6.0 adds ROUTE_MANIFEST.md as the persistent route recovery artifact for context routing optimization.

Ownership:

```text
Codex owns route generation.

ChatGPT owns route consumption.
```

ROUTE_MANIFEST.md does not replace Route Cards, PROJECT_BOOTSTRAP.md, or ARTIFACT_INDEX.md.

Required Route Card:

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

Allowed environments are ChatGPT, Codex, Git, and Human.

Allowed sessions are CURRENT, NEW, and REUSE_EXISTING.

Action must be executable.

Show only the current transition unless the user asks for a route map.
```

Default routing:

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

Git is the default audit memory. Human copy/paste is fallback only.

---

# Artifact Routing Block

SAPDP v1.6.0 requires every artifact template to include an Artifact Routing block:

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

The block is route metadata only. It must not redefine lifecycle rules or duplicate full artifact content.

---

# Bootstrap Completion Route Card

SAPDP v1.5.0 requires product bootstrap completion to use the Route Card format.

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

For a new product, create a ChatGPT Project named `<Name>` and start a NEW session inside that project.

If a product-bound ChatGPT Project already exists, reuse it.

If a remote product commit exists, ChatGPT audit must use the Commit URL.

File upload is fallback only.

If no remote product commit exists, Codex must output the local commit SHA and exact push commands, and Result must not be PASS.

Codex final output must not show internal Bootstrap state names or conflicting verified commit values.

---

# Bootstrap Workspace Boundary

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

SAPDP v1.3.1 requires product implementation completion to be minimal and verified from Git state.

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
<n>

Tests:
PASS / FAIL / NOT RUN

Result:
PASS / PATCH REQUIRED / FAIL

ChatGPT Audit:
<Commit URL>
```

If origin is missing, Codex must output the local commit SHA and exact push commands.

Codex must not output full diff, git logs, verbose summaries, or duplicated repository metadata.

Result may be PASS only if the working tree is clean and required checks passed.

---

# Token-Efficient Task Packages

When ChatGPT generates Codex execution instructions, SAPDP v1.3.1 requires:

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

Use artifact paths, commit URLs, and repository references instead of pasted full content.

Avoid pasted documents, lifecycle explanations, and repeated context.

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
Bootstrap Route Card
```

has been produced.

The Bootstrap Route Card is instantiated in:

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
