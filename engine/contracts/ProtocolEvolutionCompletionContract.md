# Protocol Evolution Completion Contract

## Purpose

Define the fixed seven-stage Protocol Evolution flow, execution environment, stage completion interfaces, handoffs, and minimal Codex returns.

## Fixed Flow and Environment

```text
Protocol Evolution  (ChatGPT)
↓
Design              (ChatGPT)
↓
Design Audit        (ChatGPT)
↓
Design Freeze       (ChatGPT)
↓
Materialization     (Codex)
↓
Repository Audit    (ChatGPT)
↓
Release             (Codex)
```

No stage may be added to this flow.

## Stage Contracts

### 1. Protocol Evolution

Input:
- Upgrade Request
- Current Repository State

Output:
- Upgrade Goal
- Scope
- Expected Outcome

### 2. Design

Input:
- Upgrade Goal
- Scope
- Current Constraints

Output:
- Design Decisions
- Affected Areas
- Rejected Options

### 3. Design Audit

Input:
- Design Decisions
- Affected Areas

Output:

```text
Audit Result:
PASS | FAIL

Blockers:
None | <list>
```

### 4. Design Freeze

Purpose: ChatGPT to Codex handoff.

Input:
- Design Decisions
- Design Audit Result

Output:

```text
Current Version:
<vX.Y.Z>

Target Version:
<vX.Y.Z>

Task:
Materialize frozen SAPDP protocol changes.

Goal:
<upgrade goal>

Scope:
<scope>

Required Changes:
<minimal concrete change list>

Validation:
<minimal checklist>

Return:
Commit URL
or
Blocker
```

Rules:
- `Current Version` appears only in the Design Freeze handoff.
- `Target Version` must be used after Design Freeze.
- Do not use the ambiguous standalone handoff field `Version`.
- Do not add Evolution ID fields.
- Runtime concepts are owned by `SAPDP.md`.
- Contracts may consume Runtime concepts.
- Contracts must not redefine Runtime concepts.
- Do not add new Protocol Evolution stages.

### 5. Materialization

Input:
- Design Freeze Output
- Commit Message

Actions:
- Apply the frozen repository changes, including the Target Version bump in the first heading of `SAPDP.md`.
- Run `scripts/sapdp-materialize "<commit message>"`.

Output:
- Commit URL

Codex failure return:

```text
Target Version:
<vX.Y.Z>

Status:
BLOCKED

Blocker:
<one concrete blocker>
```

Codex must not return:
- Files Changed
- Files Created
- Files Deleted
- Validation Report
- Execution Summary
- Long Explanation

Git Commit Diff is the repository audit source of truth.

`scripts/sapdp-materialize` contract:
- Accept exactly one non-empty commit message.
- Fail when the repository has no file changes.
- Run Git add, commit, and push.
- Print the Commit URL only on success.
- Do not tag or modify files.
- Do not infer or change the protocol version.

### 6. Repository Audit

Input:
- Frozen Design
- Target Version
- Commit URL

Audit Scope:
- Repository matches Frozen Design
- Version Consistency
- Release criteria

Output:

```text
Repository Audit Result:
PASS | FAIL

Blockers:
None | <list>

Next:
Release
or
Fix Materialization
```

### 7. Release

Input:
- Repository Audit PASS
- Target Version
- Commit URL

Codex success return:

```text
<url>
```

Codex failure return:

```text
Target Version:
<vX.Y.Z>

Status:
BLOCKED

Blocker:
<one concrete blocker>
```

`scripts/sapdp-release` contract:
- Accept no input.
- Read the version from the first heading of `SAPDP.md`.
- Fail when the working tree is dirty or the version tag already exists locally or remotely.
- Create `vX.Y.Z` on current `HEAD`, push that tag, and print the Tag URL only on success.
- Do not modify files, commit, infer a version, or bump a version.

## Completion Rules

- The first heading of `SAPDP.md` equals Target Version.
- The Protocol Evolution flow contains exactly the seven fixed stages.
- Flow Progress Information includes the full flow, current stage, next stage, progress, and environment.
- Current Version and Target Version follow the Version Field Rule.
- Materialization returns only the Commit URL.
- Release returns only the Tag URL.
- Git Commit Diff remains the source of truth for Repository Audit.
