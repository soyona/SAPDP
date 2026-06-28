# Protocol Evolution Flow

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=protocol-evolution
component_id=main
schema=sapdp-authority-v1
depends_on=execution-governance
depends_on=artifact-materialization
<!-- SAPDP Authority Metadata End -->

## Scope

This document is the sole authority for changing SAPDP protocol behavior, authority structure, Flows, Modules, repository governance, and protocol automation.

Protocol Evolution is separate from Product Development and must not change product runtime behavior unless the approved Evolution explicitly authorizes that behavior change.

## Fixed Flow

1. Evolution Definition - ChatGPT
2. Design - ChatGPT
3. Design Audit - ChatGPT
4. Design Freeze - ChatGPT
5. Materialization - Codex
6. Repository Audit - ChatGPT
7. Release - Codex

No stage may be added implicitly.

## Status

The full status card appears on initial entry, explicit status requests, and blockers:

```text
SAPDP Protocol Evolution Status

Target Version:
UNFROZEN | <vX.Y.Z>

Progress:
<completed>/<total>

Flow:
<seven stages with environment and state>

Next:
<stage or blocker>
```

Other responses use one compact status line plus the active stage contract. Valid states are completed, current, revision-required, blocked, and not-started.

Before Design Freeze, Target Version is `UNFROZEN`. Design Freeze sets the exact Target Version.

## Next Semantics

`next` performs the active stage readiness check.

- If readiness passes, execute the next stage in the same response or task.
- If readiness fails, return one blocker.
- A frozen Codex stage may execute only from its exact invocation.
- `next` never bypasses audit, approval, repository reality, or script requirements.

This Flow-specific behavior replaces the generic one-action transition behavior while Protocol Evolution is active.

## Stage 1: Evolution Definition

### Inputs

- Upgrade request
- Current repository state
- Current released protocol ref

### Outputs

- Upgrade Goal
- Scope
- Expected Outcome
- Change Type
- Non-goals
- Initial compatibility boundary

Change Type uses the classification owned by Repository Architecture.

## Stage 2: Design

### Inputs

- Evolution Definition
- Current authority and implementation
- Repository constraints

### Outputs

- Design Decisions
- Affected Authorities
- Affected Flows and Modules
- Directory Impact
- Runtime Compatibility Impact
- Documentation Impact
- Migration Plan
- Rejected Options

Design must resolve authority ownership, script interfaces, failure recovery, tests, and release evidence.

## Stage 3: Design Audit

Audit checks:

- single authority per concept;
- repository architecture and CAP ownership;
- backward compatibility and approved behavior changes;
- version classification;
- deterministic inputs and outputs;
- failure, retry, and interruption recovery;
- audit-to-release commit binding;
- token and loading impact;
- executable test coverage;
- documentation and migration completeness.

Output:

```text
Audit Result:
PASS | FAIL

Blockers:
None | <list>
```

FAIL returns to Design.

## Stage 4: Design Freeze

Design Freeze is the complete ChatGPT-to-Codex handoff.

Required fields:

- Base Commit SHA
- Current Version
- Target Version
- Upgrade Goal
- Approved Behavior Changes
- Runtime Compatibility Baseline
- Frozen Files
- Required Changes
- Validation
- Constraints
- Commit Message
- Execution Method
- Exact Invocation
- Output

Repository reality must be verified from local Git and remote `origin/main` immediately before Freeze.

### Freeze Evidence

Every Evolution writes:

```text
docs/history/protocol-evolution/<target-version>/design-freeze.md
```

The file is immutable evidence for the candidate commit, not current protocol authority.

Its machine-readable payload is bounded by:

```text
<!-- Frozen Payload Start -->
<key=value records>
<!-- Frozen Payload End -->
```

Allowed repeated keys include:

- `approved_behavior_change`
- `frozen_file`
- `required_change`
- `validation`
- `constraint`

The payload is data. Scripts must not source, evaluate, or execute payload values.

### Freeze Digest

Freeze Digest is SHA-256 over the exact payload bytes between the markers, excluding the marker lines. The payload includes its final newline.

Materialization receives the expected digest outside the Freeze file. Declared, calculated, and externally supplied digests must match.

Frozen Files are repository-relative, `LC_ALL=C` sorted, unique, and explicit. Added, modified, deleted, and both sides of moved paths are included.

## Version Policy

Use semantic versions:

- PATCH: backward-compatible correction with no required consumer change.
- MINOR: backward-compatible capability or optional contract addition.
- MAJOR: incompatible stage, required field, invocation, authority, loading, or runtime contract change.

Only a Git tag creates a released protocol version.

### Candidate Commit Policy

- A Target Version may have multiple pre-release candidate commits.
- A failed audit requires a new Freeze using the failed candidate as Base Commit.
- Only the latest audited candidate may be released.
- A released Target Version cannot be reused.

## Stage 5: Materialization

### Invocation

```bash
./scripts/sapdp-materialize \
  --freeze-file "<repository-relative-freeze-path>" \
  --expected-freeze-digest "sha256:<digest>"
```

### Required Behavior

- Accept only the exact options above.
- Validate repository, branch, origin, Base Commit, Target Version, Freeze path, and Freeze Digest.
- Reject path traversal, absolute paths, `.git`, duplicate paths, symlinks, unresolved conflicts, and out-of-scope changes.
- Compare Git status paths using a NUL-safe format.
- Stage only explicit Frozen Files.
- Never use `git add --all`.
- Update Authority Digest deterministically.
- Run `scripts/sapdp-validate`.
- Commit with the frozen Commit Message.
- Push without force.
- Print the Commit URL only.

### Recovery

Before committing, verify remote `main` equals Base Commit.

If a conforming local candidate already exists:

- remote at Base Commit: resume pushing the candidate;
- remote already at candidate: return the same Commit URL;
- remote elsewhere: return one drift blocker.

Materialization must be idempotent after commit, push, or output interruption.

### Failure Output

```text
Target Version:
<vX.Y.Z>

Status:
BLOCKED

Blocker:
<one concrete blocker>
```

## Stage 6: Repository Audit

### Inputs

- Frozen Design evidence
- Candidate Commit URL and SHA
- Target Version
- Freeze Digest

### Mechanical Invocation

```bash
./scripts/sapdp-audit \
  --commit "<candidate-sha>" \
  --freeze-file "<repository-relative-freeze-path>" \
  --expected-freeze-digest "sha256:<digest>"
```

### Audit Scope

- candidate and remote `main` are identical;
- Git Diff matches Frozen Files and Required Changes;
- Authority Registry and Authority Digest are consistent;
- repository layout and CAP ownership pass;
- runtime compatibility baseline passes;
- only Approved Behavior Changes alter behavior;
- scripts and tests pass;
- no blocker remains.

The script supplies mechanical evidence only. ChatGPT decides the governance result.

### Output

```text
Repository Audit Result:
PASS | FAIL

Audited Commit SHA:
<sha when PASS>

Freeze Digest:
<digest when PASS>

Blockers:
None | <list>

Next:
Release | Design | Materialization
```

Implementation mismatch returns to Materialization. Design defect returns to Design. Remote drift requires a new Repository Audit.

## Stage 7: Release

### Invocation

```bash
./scripts/sapdp-release \
  --version "<target-version>" \
  --audited-commit "<sha>" \
  --freeze-digest "sha256:<digest>"
```

### Required Behavior

- Require exact arguments.
- Require a clean working tree.
- Require local HEAD and remote `main` to equal Audited Commit SHA.
- Require SAPDP version to equal Target Version.
- Require Authority Digest, Freeze Digest, and validation to pass.
- Create an annotated tag on Audited Commit SHA.
- Push the tag without force.
- Verify the remote tag.
- Print the Tag URL only.

Tag annotation contains:

```text
Target-Version: <version>
Audited-Commit: <sha>
Freeze-Digest: <digest>
Repository-Audit: PASS
```

### Recovery

- A conforming local tag with no remote tag is pushed.
- A conforming remote tag returns the existing Tag URL.
- Any local or remote tag mismatch returns one blocker.

Release is idempotent after local tag creation, remote push, or output interruption.

## Repository Capabilities

```text
Materialization: ./scripts/sapdp-materialize
Audit:           ./scripts/sapdp-audit
Release:         ./scripts/sapdp-release
Validation:      ./scripts/sapdp-validate
```

These scripts implement this authority and must not infer design or governance decisions.

## History and Rollback

- A released tag and its Design Freeze evidence are immutable.
- A post-release defect starts a new Evolution and version.
- Do not delete or move a released tag to simulate rollback.
- Older tagged protocols remain loadable from their original Git ref.

## Completion

Protocol Evolution completes only when:

- the released tag points to the Repository Audit-approved commit;
- Freeze Digest and Authority Digest verify;
- remote evidence is resolvable;
- no blocker remains;
- Release returns the Tag URL.
