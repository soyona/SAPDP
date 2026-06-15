# Bootstrap Validation Contract

## Purpose

Define the authoritative validation rules for Project Bootstrap.

This contract determines whether a Bootstrap execution result is:

```text
PASS
PATCH REQUIRED
FAIL
```

Bootstrap validation exists to ensure that a Product Repository has been correctly transformed into a SAPDP-Compatible Product Workspace.

---

## Scope

Bootstrap Validation is responsible for:

```text
Validation Rules
Result Determination
Bootstrap Completion Verification
Problem Stage Entry Decision
Remote Git Validation State
```

Bootstrap Validation is not responsible for:

```text
Bootstrap Execution
Runtime State Definition
Lifecycle Definition
Manifest Definition
Template Definition
Git Policy
```

These responsibilities belong to their respective SAPDP authorities.

---

## Validation Authority

BootstrapValidationContract.md is the authoritative source for:

```text
Bootstrap Result Determination
```

No other Bootstrap artifact may redefine:

```text
PASS
PATCH REQUIRED
FAIL
```

criteria.

---

## Required State Model

Bootstrap validation must separately report:

### Local Bootstrap Result

```text
LOCAL_BOOTSTRAP_PASS
LOCAL_BOOTSTRAP_FAIL
```

### Remote Git Validation

```text
REMOTE_VALIDATION_PASS
REMOTE_VALIDATION_PENDING
REMOTE_VALIDATION_FAIL
```

### Overall Stage Entry

```text
PROBLEM_STAGE_ALLOWED
PROBLEM_STAGE_BLOCKED
```

Required clarification:

```text
Remote Git Validation pending alone must not convert local Bootstrap success into FAIL.
```

If Local Bootstrap Result is LOCAL_BOOTSTRAP_PASS and all required bootstrap artifacts exist, then Problem Stage may be allowed even when Remote Git Validation is REMOTE_VALIDATION_PENDING.

Remote validation pending must be treated as a traceability limitation, not as local Bootstrap failure.

---

## Validation Result Set

The only allowed Bootstrap validation results are:

```text
PASS
PATCH REQUIRED
FAIL
```

No additional validation result types are defined.

The validation result must be accompanied by the required state model.

---

## PASS Criteria

Bootstrap returns PASS only when all of the following conditions are satisfied.

```text
Local scaffold valid
Required bootstrap artifacts exist
Project Root resolved
Working Directory resolved
ChatGPT Handoff exists
Codex Workspace Handoff exists
Problem Stage Entry exists
Remote validation pass if remote is configured
```

### Repository Validation

```text
Product Repository exists.
Product Repository is accessible.
Generated Bootstrap artifacts are committed to local Git.
git status --short is clean after commit.
If an origin remote is configured, committed local HEAD matches pushed remote state.
If an origin remote is configured, required files can be verified from committed remote state.
If an origin remote is configured, required release tag exists remotely when applicable.
```

### Structure Validation

```text
Required directories exist.
Required files exist.
README.md exists.
Required scaffold persistence files exist.
Required empty scaffold directories are Git-persistable.
Forbidden Bootstrap internal execution directories do not exist in the final Product Project Root.
```

### Project Identity Validation

```text
Project Name is resolved.
Project Root is derived only from Project Name.
Project Name is consistent across PROJECT_BOOTSTRAP.md, BOOTSTRAP_RESULT.md, and POST_BOOTSTRAP_ENTRY.md.
Project Root is consistent across PROJECT_BOOTSTRAP.md, BOOTSTRAP_RESULT.md, and POST_BOOTSTRAP_ENTRY.md.
Project Root and Working Directory are resolved in the Bootstrap handoff.
```

### Artifact Validation

```text
PROJECT_BOOTSTRAP.md exists.
ARTIFACT_INDEX.md exists.
BOOTSTRAP_RESULT.md exists.
POST_BOOTSTRAP_ENTRY.md exists.
Generated artifacts exist in committed local repository state.
Committed local Git state proves the scaffold structure.
ChatGPT Handoff exists.
Codex Workspace Handoff exists and points to Project Root / Working Directory.
Problem Stage Entry exists.
```

### Handoff Validation

ChatGPT Handoff must contain the exact SAPDP load prompt:

```text
Load SAPDP from:
https://github.com/soyona/SAPDP
```

ChatGPT Handoff must include required upload files:

```text
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
```

Codex Workspace Handoff must include:

```text
Open or switch Codex workspace to:

<Project Root>

Use this initialized product directory as the active workspace.
Do not continue product implementation from the SAPDP protocol repository.
```

Problem Stage Entry must include:

```text
Current Stage:
Problem

Next Artifact:
ProblemDefinition_CORE_v1.md

Template:
templates/problem/ProblemDefinition_Template.md

Next Action:
Create ProblemDefinition_CORE_v1.md.
```

### Protocol Validation

```text
Protocol Snapshot exists.
SAPDP Source Commit Hash exists.
Protocol Version exists.
```

### Runtime Validation

```text
Runtime State has been initialized.
Lifecycle is ready to enter Problem Stage.
```

### Boundary Validation

```text
No lifecycle artifact has been created.
No product source code has been created.
No forbidden action has been executed.
No required artifact exists only in runtime memory.
```

### Scaffold Conformance Validation

```text
Final Product Project Root conforms to SAPDP Project Scaffold.
All required scaffold directories and files defined by bootstrap_manifest.json exist.
Bootstrap internal execution directories defined by bootstrap_manifest.json do not exist.
```

### Lifecycle Progress UI Validation

```text
Lifecycle Progress UI matches the canonical format exactly:

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

Only when all PASS conditions are satisfied:

```text
PASS
```

---

## PATCH REQUIRED Criteria

Bootstrap returns PATCH REQUIRED when:

```text
Bootstrap is recoverable.
Repository integrity remains valid.
Reinitialization is not required.
```

Examples include:

```text
Local bootstrap succeeds.
Remote validation is pending.
Handoff wording incomplete but recoverable.
Upload list incomplete but recoverable.
Version metadata stale but source commit is traceable.
Missing optional metadata.
Incomplete BOOTSTRAP_RESULT fields.
Incomplete POST_BOOTSTRAP_ENTRY guidance.
Incorrect formatting.
Incorrect status wording.
Missing non-critical template.
Missing non-critical index entry.
```

PATCH REQUIRED indicates:

```text
Bootstrap Patch Allowed
Full Bootstrap Re-execution Not Required
```

When PATCH REQUIRED is caused only by REMOTE_VALIDATION_PENDING and the local scaffold is valid, the required state model may still report:

```text
Local Bootstrap Result:
LOCAL_BOOTSTRAP_PASS

Remote Git Validation:
REMOTE_VALIDATION_PENDING

Overall Stage Entry:
PROBLEM_STAGE_ALLOWED
```

---

## FAIL Criteria

Bootstrap returns FAIL when any of the following conditions occur.

```text
Project Root unresolved
Working Directory unresolved
Required bootstrap artifacts missing
Codex continues product work from SAPDP protocol repository
ChatGPT handoff missing entirely
Local scaffold incomplete
Problem Stage entry missing
```

### Repository Failure

```text
Product Repository unavailable.
Product Repository inaccessible.
Required generated artifact exists only in runtime memory.
Required generated artifact is uncommitted.
Unstaged changes exist.
Uncommitted changes exist.
Untracked required artifacts exist.
If an origin remote is configured, local commit has not been pushed.
If an origin remote is configured, required tag has not been pushed.
If an origin remote is configured, remote verification fails.
```

No origin remote configured must produce:

```text
Remote Git Validation:
REMOTE_VALIDATION_PENDING
```

It must not produce FAIL by itself.

### SAPDP Source Failure

```text
SAPDP Repository unavailable.
Bootstrap Manifest unavailable.
```

### Structure Failure

```text
Required directories missing.
Required files missing.
README.md missing.
Required .gitkeep file missing.
Scaffold only exists as local empty directories.
Scaffold cannot be verified from committed local Git state.
Forbidden Bootstrap internal execution directory exists in final Product Project Root.
```

### Project Identity Failure

```text
Project Name unresolved.
Project Root not derived from Project Name.
Project Name mismatch across required Bootstrap artifacts.
Project Root mismatch across required Bootstrap artifacts.
Project Root / Working Directory is unresolved.
```

### Artifact Failure

```text
PROJECT_BOOTSTRAP.md missing.
ARTIFACT_INDEX.md missing.
BOOTSTRAP_RESULT.md missing.
POST_BOOTSTRAP_ENTRY.md missing.
Required generated artifact missing from committed local repository state.
ChatGPT handoff missing entirely.
Codex Workspace Handoff missing entirely.
Problem Stage entry missing.
```

### Protocol Failure

```text
Protocol Snapshot missing.
Version compatibility failure.
```

### Runtime Failure

```text
Runtime State not initialized.
Lifecycle state invalid.
```

### Boundary Failure

```text
Lifecycle artifacts created.
Product source code created.
Forbidden action executed.
ChatGPT audit attempted against runtime-only output.
Lifecycle Progress UI uses non-canonical symbols such as "*" or "o".
Bootstrap handoff tells Codex to continue product work from the SAPDP protocol repository.
Codex continues product work from the SAPDP protocol repository.
```

### Scaffold Conformance Failure

```text
Final Product Project Root does not conform to SAPDP Project Scaffold.
```

### Recovery Failure

```text
Repository state unrecoverable.
```

Any FAIL condition immediately produces:

```text
FAIL
```

---

## Bootstrap Completion Output Contract Validation

Codex final output after initialization must contain these sections in this order:

```text
A. Bootstrap Summary
B. ChatGPT Handoff
C. Codex Workspace Handoff
D. Problem Stage Entry
E. Remote Git Validation
F. Final Decision
```

### Bootstrap Summary Required Fields

```text
Project:
<Project Name>

Project Root:
<absolute project root>

Working Directory:
<absolute working directory>

Local Bootstrap Result:
LOCAL_BOOTSTRAP_PASS or LOCAL_BOOTSTRAP_FAIL

Remote Git Validation:
REMOTE_VALIDATION_PASS or REMOTE_VALIDATION_PENDING or REMOTE_VALIDATION_FAIL

Overall Stage Entry:
PROBLEM_STAGE_ALLOWED or PROBLEM_STAGE_BLOCKED
```

### Remote Git Pending Required Output

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

### Final Decision Rule

Final Decision must not say plain FAIL when local bootstrap succeeds.

Correct:

```text
Final Decision:
LOCAL_BOOTSTRAP_PASS
PROBLEM_STAGE_ALLOWED
REMOTE_VALIDATION_PENDING
```

Incorrect:

```text
Bootstrap Audit Result:
FAIL
```

---

## Validation Execution Rule

Bootstrap validation must execute in the following order:

```text
Repository Validation
Structure Validation
Project Identity Validation
Artifact Validation
Handoff Validation
Runtime Validation
Protocol Validation
Boundary Validation
Scaffold Conformance Validation
Lifecycle Progress UI Validation
Remote Git Validation State
Result Determination
```

Validation execution order is authoritative.

---

## Git Artifact Commitment Validation

Validation cases:

```text
Generated artifact exists only in runtime
→
FAIL

Generated artifact exists in repository and committed locally
→
LOCAL_BOOTSTRAP_PASS

Origin remote exists and committed state is pushed and verified
→
REMOTE_VALIDATION_PASS

Origin remote exists and remote verification fails
→
REMOTE_VALIDATION_FAIL

No origin remote exists
→
REMOTE_VALIDATION_PENDING
```

ChatGPT audit must use committed repository state only.

Runtime-only outputs are invalid audit inputs.

Codex final output must include Remote Git Validation state.

---

## Result Authority Rule

PASS allows:

```text
Bootstrap Complete
Problem Stage Entry
```

PATCH REQUIRED allows:

```text
Bootstrap Patch
Problem Stage Entry when Local Bootstrap Result is LOCAL_BOOTSTRAP_PASS and Overall Stage Entry is PROBLEM_STAGE_ALLOWED
```

FAIL allows:

```text
Bootstrap Recovery
Bootstrap Re-execution
```

FAIL must not allow:

```text
Problem Stage Entry
```

---

## Bootstrap Productionization Audit Checklist

### Project Structure

Required:

```text
PROJECT_BOOTSTRAP.md
README.md
ARTIFACT_INDEX.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
docs/
templates/
src/
tests/
.gitkeep scaffold persistence files for Git-empty directories
```

Forbidden:

```text
outputs/
work/
```

PASS Criteria:

```text
All required files and directories exist.
All required scaffold persistence files exist in committed local Git state.
No forbidden Bootstrap internal execution directories exist.
```

### Bootstrap Completion Handoff

Required:

```text
Project Root
Working Directory
ChatGPT Handoff
Codex Workspace Handoff
Problem Stage Entry
Remote Git Validation
Final Decision
```

PASS Criteria:

```text
All required sections exist.
ChatGPT Handoff contains the exact SAPDP load prompt.
Codex Workspace Handoff points to Project Root / Working Directory.
Remote Git Validation pending is clearly labeled if no origin remote exists.
Final Decision uses separate state lines.
```

---

## Ownership

BootstrapValidationContract owns:

```text
Validation Rules
Validation Results
PASS Criteria
PATCH REQUIRED Criteria
FAIL Criteria
Remote Git Validation State
Problem Stage Entry Decision
```

BootstrapValidationContract does not own:

```text
Bootstrap Execution
Runtime State
Lifecycle State
Artifact Governance
Manifest Governance
```

These responsibilities belong to their respective SAPDP authorities.

---

## Status

Frozen Candidate
