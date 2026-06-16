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

The validation record may be accompanied by the required state model.

Codex final user-facing output must not expose internal Bootstrap state names.

---

## PASS Criteria

Bootstrap returns PASS only when all of the following conditions are satisfied.

```text
Local scaffold valid
Required bootstrap artifacts exist
Route Manifest exists
Project Root resolved
ChatGPT Audit exists
Codex Workspace exists
Problem Stage Entry exists
Remote validation pass if remote is configured
Commit URL present when remote product commit exists
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
Project Root is resolved in the Bootstrap Handoff.
```

### Artifact Validation

```text
PROJECT_BOOTSTRAP.md exists.
PROJECT_STATE.md exists.
ARTIFACT_INDEX.md exists.
ROUTE_MANIFEST.md exists.
BOOTSTRAP_RESULT.md exists.
POST_BOOTSTRAP_ENTRY.md exists.
Generated artifacts exist in committed local repository state.
Committed local Git state proves the scaffold structure.
ChatGPT Audit exists.
Codex Workspace exists and points to absolute Project Root.
Problem Stage Entry exists.
Route Manifest ownership is valid.
```

Route Manifest ownership is valid when:

```text
Codex owns route generation.
ChatGPT owns route consumption.
ROUTE_MANIFEST.md does not redefine runtime state.
ROUTE_MANIFEST.md does not redefine artifact discovery.
```

### Handoff Validation

Bootstrap Handoff must include:

```text
Project
Commit URL
Environment
ChatGPT Project
Session
Startup
Action
Workspace
Result
Codex workspace boundary sentence
```

When remote product commit exists:

```text
Startup includes the Commit URL as the audit source.
Commit URL is mandatory for PASS.
File upload list is fallback only.
```

When remote product commit is missing:

```text
Local commit SHA is included.
Exact push commands are included.
Result is not PASS.
```

Problem Stage Entry must include:

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
NEW or REUSE_EXISTING

Startup:
Load SAPDP from:
https://github.com/soyona/SAPDP

Audit product commit:
<remote product commit URL>

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
Detected Protocol Version exists.
Latest Stable Version exists.
Protocol Source exists.
Protocol Version resolves to a concrete Git tag.
Protocol Version is not `latest`.
Protocol Version matches across PROJECT_STATE.md, PROJECT_BOOTSTRAP.md, BOOTSTRAP_RESULT.md, and POST_BOOTSTRAP_ENTRY.md.
```

### Runtime Validation

```text
PROJECT_STATE.md exists.
Lifecycle State has been initialized.
Lifecycle is ready to enter Problem Stage.
Current Stage is Problem.
Stage Status is READY.
Next Action is Create ProblemDefinition_CORE_v1.md.
Allowed Transition is None.
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

○ Product Requirement

○ UX Specification

○ Visual Design Specification

○ MVP Definition

○ Task Package

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
Missing ROUTE_MANIFEST.md in an existing pre-v1.6.0 product repository.
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
Project Root is unresolved.
```

### Artifact Failure

```text
PROJECT_BOOTSTRAP.md missing.
PROJECT_STATE.md missing.
ARTIFACT_INDEX.md missing.
BOOTSTRAP_RESULT.md missing.
POST_BOOTSTRAP_ENTRY.md missing.
Required generated artifact missing from committed local repository state.
ChatGPT Audit missing entirely.
Codex Workspace missing entirely.
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
PROJECT_STATE.md missing.
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

Codex final user-facing output after product bootstrap must contain only this handoff:

```text
Bootstrap Handoff

Project:
<Name>

Commit URL:
<remote product commit URL>

Environment:
ChatGPT

ChatGPT Project:
<Name>

Session:
NEW

Startup:
Load SAPDP from:
https://github.com/soyona/SAPDP

Audit product commit:
<remote product commit URL>

State Source:
PROJECT_STATE.md

Action:
Create ProblemDefinition_CORE_v1.md

Workspace:
<absolute project root>

Result:
PASS | PATCH REQUIRED | FAIL

Do not continue product implementation from the SAPDP protocol repository.
```

Problem Stage must be clearly assigned to ChatGPT.

For a new product, the handoff must recommend creating a ChatGPT Project named after the product and starting a NEW session inside it.

If a product-bound ChatGPT Project already exists, the handoff may use `Session: REUSE_EXISTING`.

### Git-First Audit Rule

If a remote product commit exists:

```text
Commit URL is mandatory.
Startup must use Commit URL as the audit source.
File upload list is fallback only.
Result may be PASS only when all other PASS criteria are satisfied.
```

The Commit URL in the final Bootstrap Handoff must be the default ChatGPT audit target.

Final output must not include conflicting verified commit values, duplicate commit identifiers, git logs, or verbose status summaries.

If no origin remote exists, output:

```text
Local Commit:
<local commit SHA>

Push Commands:
git remote add origin <your-product-repo-url>
git push -u origin main
```

When no remote product commit exists, Result must not be PASS.

### Hidden Internal State Rule

Codex final user-facing output must not show:

```text
LOCAL_BOOTSTRAP_PASS
REMOTE_VALIDATION_PASS
REMOTE_VALIDATION_PENDING
PROBLEM_STAGE_ALLOWED
```

These values may remain in BOOTSTRAP_RESULT.md for validation traceability.

### Final Decision Rule

Final user-facing output must use:

```text
Result:
PASS | PATCH REQUIRED | FAIL
```

It must not expose internal state lines such as:

```text
Local Bootstrap Result:
LOCAL_BOOTSTRAP_PASS
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

Codex final output must include Commit URL when a remote product commit exists.

File upload list is fallback only.

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
PROJECT_STATE.md
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
Project
Commit URL when remote product commit exists
Stage
Next
Result
ChatGPT Audit
Codex Workspace
Codex workspace boundary sentence
```

PASS Criteria:

```text
All required sections exist.
ChatGPT Audit equals the Commit URL when remote product commit exists.
Codex Workspace points to absolute Project Root.
Remote Git missing fallback includes local commit SHA and exact push commands.
Result is not PASS when remote product commit is missing.
Final output hides internal Bootstrap states.
Final output contains no conflicting commit identifiers.
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
