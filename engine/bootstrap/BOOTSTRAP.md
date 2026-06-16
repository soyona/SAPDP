# SAPDP Bootstrap Entry

## Purpose

This file is the human-readable Bootstrap entry point for Codex.

It tells Codex:

    Where to start

    What to read

    What to execute

    What not to do

    What to produce

    When to stop

---

## Human Pre-Bootstrap Checklist

Before running Bootstrap, Human must prepare:

    Product Repository

    SAPDP Repository Access

Optional:

    Project Name

Project Name is initialization metadata only.

If Project Name is omitted:

    NewProduct

must be used as the default Project Name.

Project Name must be resolved before creating Project Root.

Project Root must be derived only from Project Name.

Project Root must not be derived from:

    Prompt Name

    Conversation Name

    Task Name

    Workspace Name

Project Name must not be used to infer:

    Product Idea

    Problem Statement

    Target User

    Solution Direction

    MVP Definition

---

## Codex Bootstrap Command

Human may give Codex the following command:

    Read SAPDP bootstrap/BOOTSTRAP.md.

    Bootstrap this Product Repository according to bootstrap/bootstrap_manifest.json.

    Use Project Name if provided.

    Use Protocol Version if provided.

    If Protocol Version is omitted, resolve to latest.

    Resolve latest to the highest semantic Git tag before writing state.

    Pin exact tag if Protocol Version is specified.

    Write Version Lock: true after Protocol Version resolves to a concrete tag.

    Resolve Project Root from Project Name only.

    Do not create product artifacts.

    Do not implement product code.

    Do not enter Lifecycle execution.

    Stop after BOOTSTRAP_RESULT.md and POST_BOOTSTRAP_ENTRY.md are created.

    Run Bootstrap Validation.

    Run Bootstrap Productionization Audit.

    Produce Bootstrap Completion Output Contract.

---

## Required Reading Order

Codex must read Bootstrap sources in this order:

    1. bootstrap/BOOTSTRAP.md

    2. bootstrap/bootstrap_manifest.json

    3. contracts/bootstrap/BootstrapContract.md

    4. contracts/bootstrap/BootstrapValidationContract.md

    5. SAPDP_CANONICAL_PROTOCOL.md

    6. templates/

---

## Authority Map

    bootstrap/BOOTSTRAP.md
    =
    Codex Bootstrap Entry Guide

    bootstrap/bootstrap_manifest.json
    =
    Bootstrap Configuration Authority

    contracts/bootstrap/BootstrapContract.md
    =
    Bootstrap Execution Authority

    contracts/bootstrap/BootstrapValidationContract.md
    =
    Bootstrap Validation Authority

    PROJECT_STATE.md
    =
    Lifecycle State Authority

    PROJECT_BOOTSTRAP.md
    =
    Bootstrap Metadata Authority

    ARTIFACT_INDEX.md
    =
    Artifact Discovery Authority

    ROUTE_MANIFEST.md
    =
    Route Manifest Authority

---

## Execution Rule

Codex must execute Bootstrap according to:

    contracts/bootstrap/BootstrapContract.md

Codex must configure Bootstrap according to:

    bootstrap/bootstrap_manifest.json

Codex must validate Bootstrap according to:

    contracts/bootstrap/BootstrapValidationContract.md

If these sources conflict:

    Stop Bootstrap

    Return FAIL only when local Bootstrap cannot safely continue.

    If the conflict is limited to unavailable or unconfigured remote Git verification, return REMOTE_VALIDATION_PENDING and continue local Bootstrap validation.

    Record conflict in BOOTSTRAP_RESULT.md

---

## Forbidden Actions Summary

Codex must not:

    Create product lifecycle artifacts

    Create product source code

    Infer product requirements

    Infer target users

    Infer solution direction

    Infer MVP definition

    Modify the SAPDP Repository

    Create a second protocol repository

    Advance beyond Problem Stage

    Skip Bootstrap Validation

---

## Required Outputs

Bootstrap must produce:

    PROJECT_BOOTSTRAP.md

    PROJECT_STATE.md

    PROJECT_STATE.md generated from templates/state/PROJECT_STATE_TEMPLATE.md

    ARTIFACT_INDEX.md

    ROUTE_MANIFEST.md

    BOOTSTRAP_RESULT.md

    POST_BOOTSTRAP_ENTRY.md

    docs/protocol/SAPDP_CANONICAL_PROTOCOL.md

    docs/protocol/SAPDP_SOURCE_VERSION.md

    Required directories

    Required templates

Bootstrap must not leave Bootstrap internal execution directories in the final Product Project Root.

---

## Stop Condition

Codex must stop when:

    BOOTSTRAP_RESULT.md exists

    POST_BOOTSTRAP_ENTRY.md exists

    Bootstrap Validation has produced PASS, PATCH REQUIRED, or FAIL

Codex must not continue into:

    Problem Definition

    Solution Definition

    Product Requirement

    MVP Definition

    Build

---

## Next Human Action

After Bootstrap stops, Human must provide the Bootstrap result to ChatGPT for audit.

Required audit inputs:

    BOOTSTRAP_RESULT.md

    POST_BOOTSTRAP_ENTRY.md

    PROJECT_BOOTSTRAP.md

    PROJECT_STATE.md

    ARTIFACT_INDEX.md

    Product Repository file tree

After ChatGPT audit returns PASS:

    Human may accept Bootstrap.

    Product development may enter Problem Stage.

If ChatGPT audit confirms LOCAL_BOOTSTRAP_PASS with REMOTE_VALIDATION_PENDING:

    Human may enter Problem Stage if Overall Stage Entry is PROBLEM_STAGE_ALLOWED.

    Human should complete remote validation separately.

If ChatGPT audit returns PATCH REQUIRED:

    Human should request a Bootstrap Patch.

If ChatGPT audit returns FAIL:

    Human should stop Product development entry and recover Bootstrap.

---

## Status

Frozen Candidate

---

## Bootstrap Completion Output Contract

Codex final output after initialization must contain only:

```text
RESULT:
PASS / FAIL

PROTOCOL:
vX.Y.Z

STATE:
Problem -> Create ProblemDefinition_CORE_v1.md

PROJECT_DIR:
<absolute project root>
```

If FAIL, Codex may add only:

```text
BLOCKER:
<one concise blocker>
```

Detailed Bootstrap artifacts may retain audit details.

## Detailed Artifact Fields

The following fields may appear inside Bootstrap artifacts for audit and recovery.

They must not appear in the final user-facing Bootstrap output unless the Human explicitly asks for details.

### Environment Handoff

```text
Environment:
ChatGPT

ChatGPT Project:
<Project Name>

Session:
NEW

Startup:
Load SAPDP from:
https://github.com/soyona/SAPDP

Protocol Version:
<resolved version>

Latest Stable Version:
<repo latest tag>

Audit product commit:
<remote product commit URL>

State Source:
PROJECT_STATE.md

Action:
Create ProblemDefinition_CORE_v1.md
```

For a new product, create a ChatGPT Project named `<Project Name>` and start a NEW session inside that project.

If a product-bound ChatGPT Project already exists, reuse it.

Remote Commit URL is the default audit source.

Uploading bootstrap files is fallback only:

```text
PROJECT_BOOTSTRAP.md
PROJECT_STATE.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
Product repository file tree
```

### Codex Workspace Handoff

```text
Open or switch Codex workspace to:

<Project Root>

Use this initialized product directory as the active workspace.
Do not continue product implementation from the SAPDP protocol repository.
```

### D. Problem Stage Entry

```text
Current Stage:
Problem

Stage Status:
READY

State Source:
PROJECT_STATE.md

Environment:
ChatGPT

ChatGPT Project:
<Project Name>

Session:
NEW

Startup:
Load SAPDP from:
https://github.com/soyona/SAPDP

Protocol Version:
<resolved version>

Latest Stable Version:
<repo latest tag>

Audit product commit:
<remote product commit URL>

Next Artifact:
ProblemDefinition_CORE_v1.md

Template:
templates/problem/ProblemDefinition_Template.md

Next Action:
Create ProblemDefinition_CORE_v1.md.
```

### E. Remote Git Validation

If no origin remote exists, output:

```text
Remote Git Validation:
REMOTE_VALIDATION_PENDING

Reason:
No origin remote is configured.

To complete remote validation:

git remote add origin <your-product-repo-url>
git push -u origin main

Then rerun Bootstrap Validation.
```

### F. Final Decision

Do not output a single ambiguous Bootstrap Result when local scaffold succeeds but remote Git validation is pending.

Correct:

```text
Final Decision:
LOCAL_BOOTSTRAP_PASS
PROBLEM_STAGE_ALLOWED
REMOTE_VALIDATION_PENDING
```

Audit output must use:

```text
AUDIT:
PASS / FAIL

BLOCKERS:
<none or concise list>

NEXT_ACTION:
<single action>
```

---

## Remote Git Validation Rule

If Local Bootstrap Result is LOCAL_BOOTSTRAP_PASS and all required bootstrap artifacts exist, then Problem Stage may be allowed even when Remote Git Validation is REMOTE_VALIDATION_PENDING.

Remote validation pending must be treated as a traceability limitation, not as local Bootstrap failure.
