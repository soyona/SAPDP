# SAPDP Release Package v1.3.2

## Release

```text
Version:
v1.3.2

Release Name:
Bootstrap Completion Handoff Consolidation
```

---

# Problem Fixed

Product bootstrap completion output was verbose, exposed internal Bootstrap validation states, defaulted to file upload instead of Git audit, and could create ambiguity between a remote verified commit and the ChatGPT audit commit.

---

# Files Changed

```text
START.md
README.md
README.zh-CN.md
engine/SAPDP_CANONICAL_PROTOCOL.md
engine/bootstrap/BOOTSTRAP_RESULT_Template.md
engine/bootstrap/POST_BOOTSTRAP_ENTRY_Template.md
engine/contracts/BootstrapValidationContract.md
SAPDP_RELEASE_PACKAGE_v1.3.2.md
```

---

# Bootstrap Handoff Consolidation

After product bootstrap, Codex final output must use:

```text
Bootstrap Handoff

Project:
<Name>

Commit URL:
<remote product commit URL>

Stage:
Problem

Next:
ProblemDefinition_CORE_v1.md

Result:
PASS | PATCH REQUIRED | FAIL

ChatGPT Audit:
<Commit URL>

Codex Workspace:
<absolute project root>

Do not continue product implementation from the SAPDP protocol repository.
```

The final Bootstrap Handoff is Git-first.

If a remote product commit exists:

```text
ChatGPT audit must use Commit URL.
File upload list is fallback only.
Commit URL is mandatory for PASS.
```

If the remote product commit is missing:

```text
Codex must output local commit SHA.
Codex must output exact push commands.
Result must not be PASS.
```

The Commit URL in the final handoff is the only ChatGPT audit target.

The final handoff must not output conflicting verified commit values.

---

# Hidden Internal Bootstrap States

Codex final user-facing output must not show:

```text
LOCAL_BOOTSTRAP_PASS
REMOTE_VALIDATION_PASS
REMOTE_VALIDATION_PENDING
PROBLEM_STAGE_ALLOWED
```

These states may remain inside BOOTSTRAP_RESULT.md for validation traceability.

---

# Backward Compatibility

v1.3.2 does not:

```text
Add lifecycle stages
Add artifacts
Add status models
Change template directory structure
Change lifecycle stage rules
```

Existing SAPDP product projects remain compatible.

The release changes product bootstrap completion handoff wording and validation requirements only.

---

# Release Decision

```text
Release Result:
PASS

Reason:
Bootstrap completion handoff is consolidated to a minimal Git-first audit format without changing lifecycle stages, artifacts, status models, or template directory structure.
```
