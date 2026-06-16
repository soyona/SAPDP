# PROJECT_STATE.md

## Purpose

Authoritative lifecycle state for the SAPDP protocol repository.

Conversation history is not authority.

Assistant messages are not authority.

Git preserves authority.

Codex updates this file when repository state changes.

ChatGPT reads this file before allowing lifecycle transitions.

---

## State

Project Name:
SAPDP

Protocol Version:
v1.6.4

Latest Stable Version:
v1.6.4

Protocol Source:
https://github.com/soyona/SAPDP.git

Version Lock:
true

Current Stage:
Protocol Evolution

Current Artifact:
v1.6.4 Token-Minimal Execution Protocol

Stage Status:
IN_PROGRESS

Next Action:
Commit token-minimal execution protocol and return Commit URL for ChatGPT audit.

Allowed Transition:
None until v1.6.4 commit exists and remote Commit URL is available.

Required Artifacts:

- [README.md](./README.md)
- [START.md](./START.md)
- [DEVELOPER.md](./DEVELOPER.md)
- [SAPDP_BOOTSTRAP.md](./engine/SAPDP_BOOTSTRAP.md)
- [SAPDP_CANONICAL_PROTOCOL.md](./engine/SAPDP_CANONICAL_PROTOCOL.md)
- [SAPDP_LIFECYCLE.md](./engine/SAPDP_LIFECYCLE.md)
- [BootstrapContract.md](./engine/contracts/BootstrapContract.md)
- [BootstrapValidationContract.md](./engine/contracts/BootstrapValidationContract.md)
- [bootstrap_manifest.json](./engine/bootstrap/bootstrap_manifest.json)
- [PROJECT_STATE_TEMPLATE.md](./templates/state/PROJECT_STATE_TEMPLATE.md)

Required Commits:

- SAPDP v1.6.4 Token-Minimal Execution Protocol

Last Verified Commit:
Pending

Blocked Reason:
Pending v1.6.4 commit and remote verification.

Updated By:
Codex

Updated At:
2026-06-16

---

## Authority Rules

Missing `PROJECT_STATE.md` means lifecycle transition is BLOCKED.

New sessions must load `PROJECT_STATE.md` before deciding stage, next action, or transition permission.

Protocol Version in `PROJECT_STATE.md` is authoritative state.

`latest` must resolve to a concrete Git tag at runtime before execution continues.

Version Lock means protocol version resolution is complete.

After Version Lock is true, ChatGPT and Codex must use `PROJECT_STATE.md` and must not re-check latest tag during normal operation.

Normal operation is compressed execution by default.

Explanations are opt-in.

Version mismatch between docs or state files means BLOCKED.

Commands such as `Continue`, `Next`, `Next Step`, `Proceed`, `进入下一阶段`, `下一步`, and `继续` must return only one `NEXT_ACTION:` line.
