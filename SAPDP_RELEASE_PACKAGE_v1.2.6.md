# SAPDP Release Package v1.2.6

## Version

```text
v1.2.6
```

## Release Name

```text
Minimal Protocol Release Audit Handoff
```

## Problem Fixed

SAPDP v1.2.5 required Codex final output to include duplicated release audit information.

The verbose handoff increased token cost by repeating repository, branch, commit SHA, tag, remote verification, validation checklist, and git execution logs.

## Scope

This release applies only to:

```text
SAPDP protocol upgrade final handoff output
```

This release does not:

```text
Change product Bootstrap behavior

Add lifecycle stages

Add artifacts

Add status models
```

## Required Rule

Codex final output for SAPDP protocol upgrades must use the minimal handoff format:

```text
Protocol Release Audit Handoff

Version:
vX.Y.Z

Commit URL:
https://github.com/soyona/SAPDP/commit/<sha>

Tag URL:
https://github.com/soyona/SAPDP/releases/tag/vX.Y.Z

Files Changed:
<n>

Release Result:
PASS / PATCH REQUIRED / FAIL

ChatGPT Audit:

Load SAPDP from:
https://github.com/soyona/SAPDP

Audit Release:
vX.Y.Z
```

## Output Suppression Rule

Final protocol release output must not repeat:

```text
Repository

Branch

Commit SHA

Tag

Remote verification

Validation checklist

Git execution logs
```

## PASS Gate

Release Result may be PASS only if:

```text
Commit URL is mandatory

Tag URL is mandatory

Commit is remotely verifiable

Tag is remotely verifiable
```

If the remote commit or tag is missing:

```text
Release Result:
PATCH REQUIRED
```

or:

```text
Release Result:
FAIL
```

## Files Changed

```text
START.md
DEVELOPER.md
engine/SAPDP_CANONICAL_PROTOCOL.md
engine/SAPDP_LIFECYCLE.md
README.md
README.zh-CN.md
SAPDP_RELEASE_PACKAGE_v1.2.6.md
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
