# SAPDP Release Package v1.2.3

## Version

```text
v1.2.3
```

## Release Name

```text
Bootstrap Workspace Handoff Upgrade
```

## Problem Fixed

Bootstrap could initialize a new product project directory without explicitly telling the user how to continue the ChatGPT session, whether to create a product-bound ChatGPT Project, which files to upload, or how to switch Codex away from the SAPDP protocol repository and into the initialized product workspace.

## Files Changed

```text
START.md
engine/bootstrap/POST_BOOTSTRAP_ENTRY_Template.md
engine/bootstrap/BOOTSTRAP_RESULT_Template.md
engine/contracts/BootstrapValidationContract.md
engine/SAPDP_BOOTSTRAP.md
README.md
README.zh-CN.md
SAPDP_RELEASE_PACKAGE_v1.2.3.md
```

## Validation Rules Added

Bootstrap PASS now requires:

```text
ChatGPT Session Handoff exists and contains the exact SAPDP load prompt:

Load SAPDP from:
https://github.com/soyona/SAPDP

Codex Workspace Handoff exists and points to Project Root / Working Directory.
```

Bootstrap returns PATCH REQUIRED when:

```text
Post-Bootstrap handoff exists but wording is incomplete.

Upload list is incomplete.

Codex workspace switch instruction is missing but recoverable.
```

Bootstrap returns FAIL when:

```text
Project Root / Working Directory is unresolved.

Bootstrap handoff tells Codex to continue product work from the SAPDP protocol repository.

ChatGPT entry instruction is missing entirely.
```

## Expected Bootstrap Output After Upgrade

```text
Post-Bootstrap ChatGPT Session Handoff

Create a new ChatGPT Project if this is a new product or if no product-bound ChatGPT Project exists.

Use the initialized product project name as the ChatGPT Project name.

Upload the Required Load Set.

Start from Problem Stage.

Generate ProblemDefinition_CORE_v1.md using ProblemDefinition_Template.md.

Load SAPDP from:
https://github.com/soyona/SAPDP

Post-Bootstrap Codex Workspace Handoff

Open or switch Codex workspace to:

<Project Root>

Use this initialized project directory as the active workspace.
Do not continue product implementation from the SAPDP protocol repository.
Codex must not continue product work from the SAPDP protocol repository.
```

## Backward Compatibility

This upgrade preserves Bootstrap Completion System v2, the SAPDP lifecycle, and the default Problem Stage entry path.

It does not create lifecycle artifacts during Bootstrap.

It only strengthens Bootstrap handoff content and validation.

## Release Decision

```text
PASS
```
