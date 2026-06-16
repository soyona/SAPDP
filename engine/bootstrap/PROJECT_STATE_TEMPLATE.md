# PROJECT_STATE.md Template

## Purpose

Authoritative lifecycle state for a SAPDP Product Repository.

`PROJECT_STATE.md` is the only file that owns current lifecycle stage, stage status, next action, allowed transition, required artifacts, required commits, last verified commit, and blocked reason.

Conversation history is not authority.

Assistant messages are not authority.

Git preserves authority.

ChatGPT reads this file.

Codex updates this file when repository state changes.

Missing `PROJECT_STATE.md` means lifecycle transition is BLOCKED.

---

## State

Project Name:
<PROJECT_NAME>

Protocol Version:
v1.6.3

Current Stage:
Problem

Current Artifact:
None

Stage Status:
READY

Next Action:
Create ProblemDefinition_CORE_v1.md

Allowed Transition:
None

Required Artifacts:

- PROJECT_STATE.md
- ARTIFACT_INDEX.md
- ROUTE_MANIFEST.md
- BOOTSTRAP_RESULT.md
- POST_BOOTSTRAP_ENTRY.md
- docs/protocol/SAPDP_CANONICAL_PROTOCOL.md
- docs/protocol/SAPDP_SOURCE_VERSION.md
- templates/problem/ProblemDefinition_Template.md

Required Commits:

- Bootstrap commit with PROJECT_STATE.md

Last Verified Commit:
<COMMIT_URL_OR_PENDING>

Blocked Reason:
None

Updated By:
Codex

Updated At:
<TIMESTAMP>

---

## Transition Guard

Any transition request must:

1. Read `PROJECT_STATE.md`.
2. Determine the current stage.
3. Verify current stage completion.
4. Verify required artifacts.
5. Verify required commits.
6. Decide `BLOCKED`, `EXECUTE_NEXT_ACTION`, or `ALLOW_TRANSITION`.
7. Update `PROJECT_STATE.md` when repository state changes.
