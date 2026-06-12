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

    Product Name

Product Name is initialization metadata.

Product Name must not be used to infer:

    Product Idea

    Problem Statement

    Target User

    Solution Direction

    MVP Scope

---

## Required Output

```
PROJECT_BOOTSTRAP.md

ARTIFACT_INDEX.md

BOOTSTRAP_RESULT.md

POST_BOOTSTRAP_ENTRY.md

docs/protocol/SAPDP_CANONICAL_PROTOCOL.md

docs/protocol/SAPDP_SOURCE_VERSION.md

Required Directories

Required Templates
```
PROJECT_BOOTSTRAP.md is the authoritative runtime state source.

No other Bootstrap artifact may redefine runtime state.

---

## Required Final State

The Product Repository must be initialized as a valid SAPDP-Compatible Product Workspace.

Runtime State must be initialized.

Lifecycle must be ready to enter:

```
Problem Stage
```

Runtime values are owned by:

```
PROJECT_BOOTSTRAP.md
```

Bootstrap Contract must not redefine runtime values.

Bootstrap must not create:

    ProblemDefinition artifacts

    SolutionDefinition artifacts

    Product Representation artifacts

    MVPDefinition artifacts

    TaskPackage artifacts

    Build artifacts

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

Infer MVP scope

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

    6. Check repository state.

    7. Check environment availability.

    8. Create required directories.

    9.  Create required files.

    10. Copy required templates.

    11. Copy protocol snapshot.

    12. Record SAPDP source commit hash.

    13. Create PROJECT_BOOTSTRAP.md.

    14. Create ARTIFACT_INDEX.md.

    15. Create BOOTSTRAP_RESULT.md.

    16. Create POST_BOOTSTRAP_ENTRY.md.

    17. Run Bootstrap Validation.

    18. Produce Bootstrap Result.

    19. Stop.

---

## Stop Condition

Bootstrap must stop when:

    BOOTSTRAP_RESULT.md exists

    POST_BOOTSTRAP_ENTRY.md exists

    Runtime State has been initialized

    Lifecycle is ready to enter Problem Stage

    No lifecycle artifact has been created

    No product source code has been implemented

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

SAPDP Source

SAPDP Source Commit Hash

Protocol Version

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
