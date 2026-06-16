# Bootstrap Contract

## Purpose

Define what Codex must do when bootstrapping a Product Repository into a SAPDP-compatible Product Workspace.

This contract applies only to Project Bootstrap.

---

## Scope

Bootstrap is responsible for:

```
Project Scaffold

Runtime Initialization

Artifact Initialization

Protocol Snapshot

Bootstrap Validation

Project Entry Point
```

Bootstrap is not responsible for:

```
Problem Definition

Solution Definition

Product Representation

UX Specification

Visual Design Specification

MVP Definition

Product Design

Build

Implementation Verification

User Validation

Release
```

---

## Required Input

Bootstrap requires:

    Product Repository

    SAPDP Repository Access

Bootstrap source files are resolved from the SAPDP Repository:

    bootstrap/BOOTSTRAP.md

    bootstrap/bootstrap_manifest.json

    contracts/bootstrap/BootstrapContract.md

    contracts/bootstrap/BootstrapValidationContract.md

    SAPDP_CANONICAL_PROTOCOL.md

    templates/

## Optional Input

Bootstrap may use:

    Project Name

Project Name is initialization metadata.

If Project Name is omitted:

    NewProduct

must be used as the default Project Name.

Project Name must be resolved before Project Root is created.

Project Root must be derived only from:

    Project Name

Project Root must not be derived from:

    Prompt Name

    Conversation Name

    Task Name

    Workspace Name

Valid Project Root forms include:

    Project Name

    Project-Name

Project Name must not be used to infer:

    Product Idea

    Problem Statement

    Target User

    Solution Direction

    MVP Definition

---

## Required Output

```
PROJECT_BOOTSTRAP.md

PROJECT_STATE.md

README.md

ARTIFACT_INDEX.md

ROUTE_MANIFEST.md

BOOTSTRAP_RESULT.md

POST_BOOTSTRAP_ENTRY.md

docs/protocol/SAPDP_CANONICAL_PROTOCOL.md

docs/protocol/SAPDP_SOURCE_VERSION.md

Required Directories

Required Templates
```
PROJECT_STATE.md is the authoritative lifecycle state source.

PROJECT_BOOTSTRAP.md records Bootstrap metadata and must not redefine lifecycle authority.

No other Bootstrap artifact may redefine runtime state.

ROUTE_MANIFEST.md is the authoritative route manifest.

ROUTE_MANIFEST.md records route metadata only and must not redefine runtime state, artifact discovery, lifecycle stage rules, or artifact formats.

Route Manifest ownership:

```
Codex owns route generation.

ChatGPT owns route consumption.
```

Bootstrap must create README.md during project initialization.

Bootstrap must create .gitkeep files in every required scaffold directory that may otherwise be empty at Bootstrap completion.

Bootstrap must not claim scaffold PASS based only on local empty directories.

Bootstrap must persist scaffold proof into Git.

---

## Required Final State

The Product Repository must be initialized as a valid SAPDP-Compatible Product Workspace.

Runtime State must be initialized.

Lifecycle must be ready to enter:

```
Problem Stage
```

Lifecycle state values are owned by:

```
PROJECT_STATE.md
```

Bootstrap Contract must not redefine runtime values.

Bootstrap must not create:

    ProblemDefinition artifacts

    SolutionDefinition artifacts

    Product Representation artifacts

    MVPDefinition artifacts

    TaskPackage artifacts

    Build artifacts

    Bootstrap internal execution directories in the final Product Project Root

Bootstrap prepares Lifecycle entry only.

Bootstrap must not enter Lifecycle execution.

---

## Protocol Snapshot Strategy

Bootstrap must use:

```
Copy Snapshot + Source Commit Hash
```

The Product Repository must contain:

```
docs/protocol/SAPDP_CANONICAL_PROTOCOL.md

docs/protocol/SAPDP_SOURCE_VERSION.md
```

Bootstrap must not use:

```
Git Submodule

Remote Reference Only

Live Protocol Dependency
```

---

## Version Compatibility

Bootstrap must verify:

```
Protocol Version

Bootstrap Version

Bootstrap Contract Version

Bootstrap Validation Contract Version
```

Version compatibility rules are defined by:

```
bootstrap/bootstrap_manifest.json
```

Bootstrap must stop if version compatibility requirements are not satisfied.

---

## Idempotency Rule

Bootstrap must be idempotent.

Rules:

```
Repeated Bootstrap execution must not destroy existing files.

Existing SAPDP files must not be overwritten without explicit Human confirmation.

If the Product Repository is empty, full Bootstrap is allowed.

If the Product Repository is non-empty but Bootstrap is incomplete, return PATCH REQUIRED.

If the Product Repository contains lifecycle artifacts or product source code before Bootstrap, return FAIL unless Human explicitly requests migration.

Bootstrap execution must not overwrite existing runtime state unless executing an explicit Bootstrap Patch.

Bootstrap must not advance beyond Problem Stage.
```

---

## Forbidden Actions

Codex must not:

```
Create ProblemDefinition artifacts

Create SolutionDefinition artifacts

Create MVPDefinition artifacts

Create TaskPackage artifacts

Create Build artifacts

Implement product source code

Infer product requirements

Infer target users

Infer solution direction

Infer MVP definition

Modify SAPDP Repository

Create a second protocol repository

Rename SAPDP protocol files

Store artifact activation state

Advance beyond Problem Stage

Skip Bootstrap Validation
```

---

## Execution Steps

Codex must execute:

    1. Verify current repository is the Product Repository.

    2. Verify SAPDP Repository is readable.

    3. Read bootstrap/BOOTSTRAP.md.

    4. Read bootstrap/bootstrap_manifest.json.
    
    4.1 Bootstrap Manifest is authoritative.

    4.2 Contract execution must conform to Bootstrap Manifest.  

    5. Verify version compatibility.

    6. Resolve Project Name.

    7. Resolve Project Root from Project Name.

    8. Check repository state.

    9. Check environment availability.

    10. Create required directories.

    11. Create required files.

    12. Create required .gitkeep scaffold persistence files.

    13. Copy required templates.

    14. Copy protocol snapshot.

    15. Record SAPDP source commit hash.

    16. Create PROJECT_BOOTSTRAP.md.

    17. Create PROJECT_STATE.md.

    18. Create ARTIFACT_INDEX.md.

    19. Create ROUTE_MANIFEST.md.

    20. Create BOOTSTRAP_RESULT.md.

    21. Create POST_BOOTSTRAP_ENTRY.md.

    22. Add generated Bootstrap artifacts and scaffold persistence files to Git.

    23. Commit generated Bootstrap artifacts and scaffold persistence files to Git.

    24. Push committed Git state.

    25. Run Codex Completion Verification.

    26. Run Bootstrap Validation.

    27. Produce Bootstrap Result.

    28. Stop.

## Git Artifact Commitment Rule

All Codex-generated Bootstrap artifacts must be persisted into Git before audit.

Bootstrap artifacts existing only in runtime memory are considered non-existent.

Required Bootstrap persistence order:

```
Artifact Generation
→ Git Add
→ Git Commit
→ Git Push
→ Git Fetch
→ Remote Verification
→ Clean Status Verification
→ ChatGPT Audit
```

ChatGPT must audit committed repository state only.

ChatGPT must not audit runtime-only Bootstrap outputs.

---

## Bootstrap Completion Verification

Bootstrap completion must include Codex Completion Verification.

Codex must run and report:

```text
git status --short

git fetch origin

git rev-parse HEAD

git rev-parse origin/main

git ls-remote origin main

git ls-remote --tags origin <release-tag-if-any>
```

If any verification fails, Codex must return FAIL or PATCH REQUIRED, not completion.

---

## Stop Condition

Bootstrap must stop when:

    Required files exist

    Required templates exist

    Required .gitkeep persistence files exist

    BOOTSTRAP_RESULT.md exists

    POST_BOOTSTRAP_ENTRY.md exists

    Runtime State has been initialized

    PROJECT_STATE.md exists and records Current Stage: Problem, Stage Status: READY, Next Action: Create ProblemDefinition_CORE_v1.md, and Allowed Transition: None

    Project Name and Project Root are consistent across required Bootstrap artifacts

    Final Product Project Root conforms to SAPDP Project Scaffold

    Lifecycle is ready to enter Problem Stage

    No lifecycle artifact has been created

    No product source code has been implemented

    Generated Bootstrap artifacts have been committed to Git

    Committed Git state has been pushed

    Committed GitHub repository state can prove the scaffold exists

    Codex Completion Verification has passed

Bootstrap is complete only when:

    BootstrapValidationContract returns PASS.

Stop does not imply success.

If BootstrapValidationContract returns PATCH REQUIRED or FAIL:

    BOOTSTRAP_RESULT.md must record the result.

    Codex must not advance execution.

---

## Bootstrap Result Requirements

BOOTSTRAP_RESULT.md must contain:

```
Result

Product Repository

Product Name

Project Root

SAPDP Source

SAPDP Source Commit Hash

Protocol Version

Lifecycle State Authority

Bootstrap Version

Contract Version

Validation Contract Version

Scaffold Result

Runtime Result

Artifact Index Result

Template Result

Protocol Snapshot Result

Environment Check Result

Git Result

Validation Result

Remaining Issues

Commit Hash
```

---

## Ownership

Bootstrap Contract owns:

```
Bootstrap Responsibilities

Bootstrap Inputs

Bootstrap Outputs

Bootstrap Execution Rules

Bootstrap Stop Conditions
```

Bootstrap Contract does not own:

```
Runtime State

Lifecycle State

Artifact Governance

Artifact Activation
```

These responsibilities belong to their respective SAPDP authorities.

---

## Status

Frozen Candidate


## Bootstrap Completion System v2

Bootstrap completion must disclose:

Project Root

Working Directory

Execution Environment

Required Load Set

Codex Project Setup Guide

ChatGPT Project Setup Guide

Bootstrap is not operationally complete
until all required Bootstrap Completion Handoff information
has been produced.
