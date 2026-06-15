# SAPDP Release Package v1.3.0

## Version

```text
v1.3.0
```

## Release Name

```text
Product Workflow Handoff & Token Efficiency Upgrade
```

## Problem Fixed

Product development handoff between ChatGPT, Codex, Human, and Git wasted tokens and human effort.

Codex completion output could omit a minimal ChatGPT audit entry.

ChatGPT task prompts to Codex could include excessive context.

Stage completion prompts could repeat lifecycle guidance instead of giving one executable next action.

Git was not stated clearly enough as the default product workflow audit memory.

## Scope

This release applies only to:

```text
Product development workflow
```

This release does not:

```text
Change product Bootstrap behavior

Add lifecycle stages

Add status models

Change lifecycle stage set
```

## Required Rules

### Codex Completion Handoff Rule

After Codex completes any product implementation task, final output must use:

```text
Codex Completion Handoff

Project:
<name>

Commit URL:
<url>

Changed:
<n files>

Tests:
PASS / FAIL / NOT RUN

Result:
PASS / PATCH REQUIRED / FAIL

ChatGPT Audit:

Load SAPDP from:
https://github.com/soyona/SAPDP

Audit Codex result:
<Commit URL>
```

Commit URL is mandatory when origin exists.

If origin is missing, Codex must output local commit SHA and exact push commands.

Codex must not output full diff, git logs, verbose summaries, or duplicated repository metadata.

Result may be PASS only if working tree is clean and required checks passed.

### Codex Task Package Token Budget Rule

When ChatGPT generates Codex execution instructions, it must use:

```text
Task:
<one sentence>

Inputs:
<artifact paths or commit URLs>

Scope:
<must do>
<must not do>

Acceptance:
<3-7 checks>

Output:
Commit URL
Tests
Result
```

Prefer paths, commit URLs, and artifact names over pasted full content.

Do not include background unless required for execution.

Do not include lifecycle theory.

Do not request broad implementation beyond current stage scope.

### Minimal Stage Navigation Prompt Rule

Every product lifecycle stage completion handoff must show only:

```text
Current:
<stage>

Done:
<artifact/result>

Next:
<stage>

Action:
<one concrete action>
```

Do not repeat the full lifecycle unless user is lost or explicitly asks.

Do not include generic guidance.

The next action must be executable.

### Git Memory Rule

Git is the default audit memory.

Codex must commit completed work.

If origin exists, Codex must push and return Commit URL.

ChatGPT audit should use Commit URL before asking Human to paste files.

Human copy/paste is fallback only.

## Files Changed

```text
START.md
DEVELOPER.md
engine/SAPDP_CANONICAL_PROTOCOL.md
engine/SAPDP_LIFECYCLE.md
templates/tasks/TaskPackage_Template.md
templates/verification/ImplementationVerification_Template.md
README.md
README.zh-CN.md
SAPDP_RELEASE_PACKAGE_v1.3.0.md
```

## Validation

```text
Lifecycle stage set unchanged:
PASS

No new status model introduced:
PASS

Product bootstrap behavior unchanged:
PASS

Codex completion output is minimal:
PASS

Codex task instruction format is token-efficient:
PASS

Stage completion handoff is minimal and actionable:
PASS
```

## Backward Compatibility

This upgrade preserves:

```text
Product Bootstrap behavior

SAPDP Lifecycle Stage Set

Lifecycle Entry Types

Lifecycle artifact model

Lifecycle status vocabulary
```

## Release Decision

```text
PASS only after remote commit and remote tag verification pass.
```
