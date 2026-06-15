# Execution Package Proposal

## Purpose

Define a minimal, reusable, Git-native handoff artifact between Codex execution and ChatGPT audit.

The Execution Package exists to answer:

```text
What did Codex execute?
What repository state contains the result?
What files changed?
What evidence should ChatGPT audit?
What result is being requested?
```

The Execution Package is not:

```text
A lifecycle stage
A runtime authority
A decision log
A release artifact
A replacement for BOOTSTRAP_RESULT.md
A replacement for POST_BOOTSTRAP_ENTRY.md
```

It is a handoff artifact only.

## Structure

Recommended artifact name:

```text
EXECUTION_PACKAGE.md
```

Recommended location:

```text
Repository root
```

For historical packages, optional archived copies may be stored under:

```text
docs/execution/
```

The active handoff package should remain easy to find at repository root.

## Fields

### Package Identity

```text
Execution Package ID:
Execution Type:
Created At:
Created By:
```

Allowed Execution Type values:

```text
Reality Validation
Bootstrap
Upgrade
Release
Audit
```

### Git Context

```text
Repository URL:
Branch:
Base Commit:
Head Commit:
Working Tree Status:
```

### Execution Summary

```text
Objective:
Scope:
Non Goals:
Result:
```

Allowed Result values:

```text
PASS
FAIL
PATCH REQUIRED
READY FOR AUDIT
```

### Changed Files

```text
Added:
Modified:
Deleted:
Renamed:
```

Each entry should include repository-relative paths only.

### Required Audit Inputs

```text
Files To Load:
Reports To Review:
Templates To Check:
Contracts To Check:
```

All entries must be repository-relative paths.

### Evidence

```text
Commands Run:
Validation Performed:
Validation Not Performed:
Known Limitations:
```

Command outputs should be summarized, not pasted in full unless the output is short and essential.

### Audit Request

```text
Audit Goal:
Audit Questions:
Expected Audit Output:
Blocking Conditions:
```

### Handoff Status

```text
Ready For ChatGPT Audit:
Human Action Required:
Next Recommended Action:
```

## Usage Rules

1. One execution handoff uses one Execution Package.

2. The Execution Package must be generated after Codex execution and before ChatGPT audit.

3. The Execution Package must reference Git repository state using repository URL and commit hash.

4. The Execution Package must not rely on manual file upload as the primary context transfer mechanism.

5. The Execution Package must not store protocol authority, runtime authority, lifecycle rules, or accepted decisions.

6. The Execution Package may reference authoritative files, but must not redefine them.

7. The Execution Package must remain reusable across Reality Validation, Bootstrap, Upgrade, Release, and Audit.

8. The Execution Package must not introduce a new lifecycle stage.

9. The Execution Package must not require Decision Log expansion.

10. ChatGPT audit should treat the Execution Package as the entry point, then load referenced repository files from Git.

## Migration Impact

### Existing Files

No protocol files need to change for this proposal.

Future implementation may require patches to:

```text
DEVELOPER.md
engine/bootstrap/BOOTSTRAP.md
engine/bootstrap/BOOTSTRAP_RESULT_Template.md
engine/bootstrap/POST_BOOTSTRAP_ENTRY_Template.md
```

Only if accepted, these files should reference the Execution Package as the standard audit handoff artifact.

### Existing Workflow

Current workflow:

```text
Codex executes
Human manually summarizes or transfers files
ChatGPT audits from provided context
```

Proposed workflow:

```text
Codex executes
Codex generates EXECUTION_PACKAGE.md
ChatGPT loads repository at Head Commit
ChatGPT audits referenced files and evidence
ChatGPT returns audit result
```

### Authority Model

No authority changes are required.

The Execution Package is a delivery and audit handoff artifact. It does not own:

```text
Runtime State
Lifecycle Rules
Bootstrap Rules
Validation Rules
Release Rules
Decision History
```

### Git-Native Behavior

The package eliminates the need for manual file upload by making Git the primary context source.

Manual upload may remain an emergency fallback, but must not be required for the normal audit path.

## Recommendation

Adopt `EXECUTION_PACKAGE.md` as the single standard execution handoff artifact between Codex and ChatGPT.

Keep the artifact minimal and reusable. Do not create separate handoff artifacts for Reality Validation, Bootstrap, Upgrade, Release, and Audit unless future validation proves that one package cannot serve all five cases.

Recommended next step:

```text
Create an Upgrade Specification that patches SAPDP audit handoff instructions to reference EXECUTION_PACKAGE.md as the Git-native audit entry point.
```
