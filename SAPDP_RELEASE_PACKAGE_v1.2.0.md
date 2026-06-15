# SAPDP Release Package v1.2.0

## Version

```text
v1.2.0
```

## Upgrade ID

```text
SAPDP-v1.2.0
```

## Upgrade Title

```text
Git-Native Execution Persistence
```

## Decision Entries

```text
D-0108 | Git Artifact Commitment Rule
```

Decision summary:

```text
All Codex-generated SAPDP artifacts must be persisted into Git before audit.
Runtime-only artifacts are considered non-existent.
ChatGPT must audit committed repository state only.
```

## Files Changed

Protocol files:

```text
START.md
engine/SAPDP_BOOTSTRAP.md
engine/SAPDP_CANONICAL_PROTOCOL.md
engine/contracts/BootstrapContract.md
engine/contracts/BootstrapValidationContract.md
internal/SAPDP_DECISION_LOG.md
```

Generated artifacts committed for Git-native persistence:

```text
EXECUTION_PACKAGE_PROPOSAL.md
REALITY_VALIDATION_R3_REPORT.md
SAPDP_CONTEXT_BOOTSTRAP_REPORT.md
SAPDP_RELEASE_PACKAGE_v1.2.0.md
```

## Validation Result

```text
PASS
```

Validation checks:

```text
A. Generated artifact exists only in runtime
Expected: FAIL
Result: PASS

B. Generated artifact exists in repository and committed
Expected: PASS
Result: PASS

C. ChatGPT attempts to audit runtime-only output
Expected: FAIL
Result: PASS

D. ChatGPT audits committed repository state
Expected: PASS
Result: PASS
```

Validation evidence:

```text
git diff --check: PASS
Protocol rule present: PASS
Bootstrap contract persistence rule present: PASS
Bootstrap validation failure cases present: PASS
Startup guidance updated: PASS
D-0108 appended to Decision Log: PASS
```

## Commit Hash

```text
Authoritative release commit is the v1.2.0 tag target after Git commit and tag creation.
Resolve with: git rev-parse v1.2.0
```

## Tag

```text
v1.2.0
```

## Summary

SAPDP v1.2.0 makes Git persistence mandatory for Codex-generated SAPDP artifacts.

The required execution order is now:

```text
Codex Execution
→ Artifact Generation
→ Git Add
→ Git Commit
→ Git Push
→ ChatGPT Audit
```

ChatGPT audit must use committed Git repository state only. Runtime-only artifacts, uncommitted artifacts, and conversation-only artifacts are invalid audit inputs.

## Known Limitations

```text
The release package cannot embed the final commit hash of the commit that contains itself without changing that commit hash.
The Git tag target is therefore the authoritative release commit reference.
```

No new lifecycle stages, authority systems, branch workflows, pull request workflows, or Decision Log format changes were introduced.
