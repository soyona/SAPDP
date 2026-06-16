# PROJECT_STATE.md Template

## Purpose

Authoritative lifecycle state for a SAPDP Product Repository.

`PROJECT_STATE.md` owns protocol version, latest stable version, protocol source, current lifecycle stage, current artifact, stage status, next action, allowed transition, required artifacts, required commits, last verified commit, blocked reason, updater, and update time.

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
<RESOLVED_PROTOCOL_VERSION>

Latest Stable Version:
<LATEST_STABLE_VERSION>

Protocol Source:
https://github.com/soyona/SAPDP.git

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
- PROJECT_BOOTSTRAP.md
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

## Transition Review

Protocol Version is authoritative state.

`latest` must resolve to a concrete Git tag at runtime before `PROJECT_STATE.md` is written.

ChatGPT and Codex must both display the resolved Protocol Version.

Version mismatch between docs or state files means BLOCKED.

Any request such as `Continue`, `Next`, `Next Step`, `Proceed`, `进入下一阶段`, `下一步`, or `继续` must:

1. Read `PROJECT_STATE.md`.
2. Determine the current stage.
3. Verify current stage completion.
4. Verify required artifacts.
5. Verify required commits.
6. Decide `BLOCKED`, `EXECUTE_NEXT_ACTION`, or `ALLOW_TRANSITION`.
7. Execute the authoritative `Next Action` or block transition.
8. Update `PROJECT_STATE.md` when repository state changes.
