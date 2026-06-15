# SAPDP Release Package v1.3.1

## Release

```text
Version:
v1.3.1

Release Name:
Workflow Governance Consolidation
```

---

# Problem Fixed

SAPDP v1.2.7 governance fixes and v1.3.0 workflow optimization rules were valid but not fully consolidated across entry, protocol, lifecycle, template, and maintainer surfaces.

This created risk that future protocol use could duplicate governance ownership, over-expand START.md, or fall back to pasted context instead of Git-verifiable audit state.

---

# Files Changed

```text
START.md
README.md
README.zh-CN.md
DEVELOPER.md
engine/SAPDP_CANONICAL_PROTOCOL.md
engine/SAPDP_LIFECYCLE.md
templates/tasks/TaskPackage_Template.md
templates/verification/ImplementationVerification_Template.md
SAPDP_RELEASE_PACKAGE_v1.3.1.md
```

---

# Governance Consolidation

v1.3.1 establishes Git remote state as the default audit source.

Protocol Release Audit requires:

```text
Commit URL
Tag URL
Remote commit verification
Remote tag verification
```

Protocol release PASS is allowed only when the commit and tag are remotely verifiable.

Codex Completion Audit must prefer Commit URL over pasted diffs, pasted files, or runtime-only output.

Human copy/paste is fallback only.

START.md is reduced to entry responsibilities only:

```text
Load SAPDP
Required files
Current stage
Next action
```

Ownership boundaries are clarified:

```text
START.md
= Entry

SAPDP_LIFECYCLE.md
= Stages / Inputs / Outputs / Gates

SAPDP_CANONICAL_PROTOCOL.md
= Rules
```

---

# Workflow Optimization Consolidation

Codex Completion Handoff is standardized as:

```text
Codex Completion Handoff

Project:
<Name>

Commit URL:
<url>

Changed:
<n>

Tests:
PASS | FAIL | NOT RUN

Result:
PASS | PATCH REQUIRED | FAIL

ChatGPT Audit:
<Commit URL>
```

The handoff removes repository duplication, branch duplication, commit SHA duplication, verbose summaries, and git logs.

Minimal Stage Navigation is standardized as:

```text
Current:
<stage>

Done:
<artifact/result>

Next:
<stage>

Action:
<one executable action>
```

Task Package structure is standardized as:

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

Task packages prefer artifact paths, commit URLs, and repository references.

Task packages avoid pasted documents, lifecycle explanations, and repeated context.

The accepted v1.3.0 task and verification templates are marked Frozen.

---

# Backward Compatibility

v1.3.1 does not:

```text
Add lifecycle stages
Add artifacts
Add status models
Modify bootstrap directory structure
Modify bootstrap contracts
Modify template directory structure
```

Existing SAPDP product projects remain compatible.

The release changes governance wording, workflow handoff formats, template status, and ownership clarity only.

---

# Release Decision

```text
Release Result:
PASS

Reason:
Governance and workflow consistency rules are consolidated without changing lifecycle structure, artifact catalog, status models, bootstrap contracts, bootstrap directory structure, or template directory structure.
```
