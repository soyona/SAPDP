# SAPDP Release Package v1.2.5

## Version

```text
v1.2.5
```

## Release Name

```text
Protocol Release Audit Handoff Upgrade
```

## Problem Fixed

After Codex upgrades SAPDP, ChatGPT must audit the actual remote release.

If Codex commits only locally, omits the pushed commit, omits the pushed tag, or omits commit/tag URLs, ChatGPT cannot audit the real release state.

## Scope

This release applies only to:

```text
SAPDP protocol upgrade workflow
```

This release does not:

```text
Modify product Bootstrap behavior

Add product audit package rules

Introduce lifecycle stages

Introduce lifecycle status models
```

## Required Rule

Codex may report protocol release PASS only after:

```text
1. Changes are committed
2. Commit is pushed to remote main
3. Version tag is created
4. Tag is pushed to remote
5. Remote commit and remote tag are verified
6. Final output includes Commit URL and Tag URL for ChatGPT audit
```

If the commit or tag is not remotely verifiable:

```text
Final Release Result:
PATCH REQUIRED
```

or:

```text
Final Release Result:
FAIL
```

Codex must not report:

```text
Final Release Result:
PASS
```

unless both remote branch verification and remote tag verification PASS.

## Required Final Output Contract

Codex final output for SAPDP protocol release must use:

```text
Protocol Release Audit Handoff

Version:
v1.2.5

Repository:
https://github.com/soyona/SAPDP

Branch:
main

Commit:
<sha>

Commit URL:
https://github.com/soyona/SAPDP/commit/<sha>

Tag:
v1.2.5

Tag URL:
https://github.com/soyona/SAPDP/releases/tag/v1.2.5

Files Changed:
<list>

Remote Branch Verification:
PASS / FAIL

Remote Tag Verification:
PASS / FAIL

ChatGPT Release Audit Prompt:

Load SAPDP from:
https://github.com/soyona/SAPDP

Audit SAPDP protocol release:

Version:
v1.2.5

Repository:
https://github.com/soyona/SAPDP

Commit:
<sha>

Tag:
v1.2.5

Required audit targets:
https://github.com/soyona/SAPDP/commit/<sha>
https://github.com/soyona/SAPDP/releases/tag/v1.2.5

Task:
Perform SAPDP Protocol Release Audit and determine PASS / PATCH REQUIRED / FAIL.

Validation:
- Verify no product bootstrap behavior changed.
- Verify commit exists on remote main.
- Verify tag exists on remote.
- Verify final output includes Commit URL, Tag URL, and ChatGPT Release Audit Prompt.
- Commit, push, tag v1.2.5, push tag.

Final Release Result:
PASS only if remote branch and remote tag verification both PASS.
```

## Files Changed

```text
START.md
DEVELOPER.md
engine/SAPDP_CANONICAL_PROTOCOL.md
engine/SAPDP_LIFECYCLE.md
README.md
README.zh-CN.md
SAPDP_RELEASE_PACKAGE_v1.2.5.md
```

## Backward Compatibility

This upgrade preserves:

```text
Product Bootstrap behavior

Bootstrap Completion System v2

SAPDP Lifecycle Stage Set

Lifecycle Entry Types

Lifecycle status vocabulary
```

## Release Decision

```text
PASS only after remote main and remote tag verification pass.
```
