# Bootstrap Validation Authority

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=bootstrap
component_id=validation
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Purpose

Validate that a Product Repository can begin the artifact-driven Product
Development Flow without persisted lifecycle state.

## Result Set

```text
PASS
PATCH REQUIRED
FAIL
```

## Validation Order

1. repository
2. product identity
3. `SAPDP.lock`
4. required directories
5. required templates
6. Git persistence
7. lifecycle boundary
8. result

## PASS

PASS requires:

- the Product Repository exists and is accessible;
- Product Name and repository root are resolved;
- `README.md` exists and contains no dynamic lifecycle authority;
- `SAPDP.lock` conforms to `sapdp-lock-v1`;
- lock version, source, commit, and Authority Digest resolve from one ref;
- all required Bootstrap directories and `.gitkeep` files exist;
- all thirteen required Product Development templates exist;
- generated Bootstrap files are tracked and committed;
- no required Bootstrap file has uncommitted changes;
- no Product Development conclusion artifact exists;
- no product source code exists; and
- none of the forbidden legacy runtime files exists.

Remote absence or an unpushed local Bootstrap commit does not block local
Product Development.

## PATCH REQUIRED

PATCH REQUIRED applies only when the lock and repository identity are valid and
the defect can be repaired without overwriting product work.

Examples:

- missing required directory or `.gitkeep`;
- missing template;
- incomplete static README; or
- generated Bootstrap file not yet committed.

## FAIL

FAIL applies when:

- Product Repository or root is unresolved;
- SAPDP source or locked ref is unavailable;
- `SAPDP.lock` is malformed or internally inconsistent;
- a conflicting lock exists;
- destructive overwrite would be required;
- Product Development artifacts or product code exist without an explicit
  migration; or
- any forbidden legacy runtime file would be treated as current authority.

## Lifecycle Boundary

Bootstrap must stop before creating:

```text
docs/problem/ProblemDefinition_CORE_v1.md
```

After PASS, Product Development determines progress by scanning canonical stage
artifacts. No state initialization or route generation occurs.

## Output

```text
RESULT:
PASS | PATCH REQUIRED | FAIL

PROTOCOL:
<resolved version>

PROJECT_DIR:
<absolute product repository>

NEXT:
CREATE docs/problem/ProblemDefinition_CORE_v1.md
```

FAIL adds one `BLOCKER`.
