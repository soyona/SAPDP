# Protocol Evolution - Release

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=protocol-evolution
component_id=release
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Invocation

```bash
./scripts/sapdp-release \
  --version "<target-version>" \
  --audited-commit "<sha>" \
  --freeze-digest "sha256:<digest>"
```

## Required Behavior

- Require exact arguments and a clean tree.
- Require local HEAD and remote `main` to equal Audited Commit.
- Require SAPDP version, Authority Digest, Freeze Digest, findings snapshot, and validation to pass.
- Create an annotated tag on Audited Commit and push without force.
- Verify the remote tag and print the Tag URL only.

Annotation:

```text
Target-Version: <version>
Audited-Commit: <sha>
Freeze-Digest: <digest>
Repository-Audit: PASS
```

Usage or malformed input returns `ERROR SAPDP_RELEASE_<CODE>`. A precondition returns `BLOCKED SAPDP_RELEASE_<CODE>`. Failures are one exact line on stderr with non-zero exit.

## Recovery

A conforming local tag is pushed when remote is absent. A conforming remote tag returns its existing URL. Any mismatch blocks. Release is idempotent after local tag creation, push, or output interruption.

## Completion

The remote tag, audited commit, Freeze Digest, findings snapshot, and Authority Digest must verify with no blocker.
