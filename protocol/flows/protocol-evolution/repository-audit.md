# Protocol Evolution - Repository Audit

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=protocol-evolution
component_id=repository-audit
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Mechanical Invocation

```bash
./scripts/sapdp-audit \
  --commit "<candidate-sha>" \
  --freeze-file "<repository-relative-freeze-path>" \
  --expected-freeze-digest "sha256:<digest>"
```

The script validates candidate and remote equality, Frozen Files, findings snapshot, Authority Registry and Digest, context budgets, compatibility baseline, tests, and repository layout. It prints `PASS` only for complete mechanical success.

Usage or malformed input returns `ERROR SAPDP_AUDIT_<CODE>`. A precondition returns `BLOCKED SAPDP_AUDIT_<CODE>`. Failures are one exact line on stderr with non-zero exit.

## Governance Audit

ChatGPT verifies Git Diff against Required Changes, approved behavior only, design ownership, runtime compatibility, script and test evidence, and unresolved findings.

## Output

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

Implementation mismatch returns to Materialization. Design defect returns to Design. Remote drift requires a new audit.
