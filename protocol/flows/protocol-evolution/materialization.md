# Protocol Evolution - Materialization

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=protocol-evolution
component_id=materialization
schema=sapdp-authority-v1
depends_on=flow|protocol-evolution|thread-handoff
<!-- SAPDP Authority Metadata End -->

## Invocation

```bash
./scripts/sapdp-materialize \
  --freeze-file "<repository-relative-freeze-path>" \
  --expected-freeze-digest "sha256:<digest>"
```

## Required Behavior

- Accept only the exact options above.
- Validate repository, branch, origin, Base Commit, Target Version, Freeze, findings snapshot, and both digests.
- Reject traversal, absolute paths, `.git`, duplicates, symlinks, conflicts, and out-of-scope changes.
- Compare Git paths NUL-safely and stage only Frozen Files.
- Never use `git add --all`.
- Update Authority Digest deterministically.
- Run `scripts/sapdp-validate`.
- Commit with the frozen message and push without force.
- Print the Commit URL only.

## Recovery

Remote `main` must equal Base Commit before commit. A conforming local candidate resumes push when remote is at Base, returns the same URL when remote already equals candidate, and blocks on other drift.

Materialization is idempotent after commit, push, or output interruption.

## Failure

Usage or malformed input returns `ERROR SAPDP_MATERIALIZE_<CODE>`. A repository or governance precondition returns `BLOCKED SAPDP_MATERIALIZE_<CODE>`. Failures are one exact line on stderr with non-zero exit.

## Thread Boundary

Successful Commit URL remains the script stdout. The Flow then emits the Repository Audit Handoff Card and stops this thread. It does not append the Card to script stdout.
