# Bootstrap Flow

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=bootstrap
component_id=main
schema=sapdp-authority-v1
depends_on=module|artifact-materialization|design
depends_on=module|artifact-materialization|entry
depends_on=module|artifact-materialization|runtime
<!-- SAPDP Authority Metadata End -->

## Purpose

Initialize a Product Repository for the artifact-driven Product Development
Flow.

Bootstrap prepares the workspace. It is not a lifecycle stage and does not
create lifecycle state.

## Required Input

- Product Repository
- SAPDP Repository access
- optional Product Name
- optional explicit SAPDP Git ref

When Product Name is omitted, use `NewProduct`. Project identity must not be
used to infer users, problems, solutions, requirements, design, or MVP scope.

## Required Output

```text
README.md
SAPDP.lock
docs/problem/
docs/solution/
docs/product/
docs/mvp/
docs/tasks/
docs/build/
docs/verification/
docs/validation/
docs/release/
templates/
src/
tests/
```

Required empty directories contain `.gitkeep`.

Bootstrap copies the Product Development templates resolved from the same
locked SAPDP ref. It does not copy the complete protocol repository or create a
second authority snapshot.

## SAPDP Lock

`SAPDP.lock` contains exactly:

```text
schema=sapdp-lock-v1
version=<resolved vX.Y.Z>
source=https://github.com/soyona/SAPDP
commit=<40-lowercase-hex>
authority_digest=sha256:<64-lowercase-hex>
```

The version, commit, and Authority Digest resolve from one Git ref. `latest`
must resolve to a concrete commit and version before the lock is written.

The lock is immutable during normal Product Development. Protocol upgrade is
an explicit operation.

## Required Templates

- `templates/problem/ProblemDefinition_Template.md`
- `templates/solution/SolutionDefinition_Template.md`
- `templates/product/DNASelection_Template.md`
- `templates/product/ProductRepresentation_Template.md`
- `templates/product/ProductRequirement_Template.md`
- `templates/product/UXSpecification_Template.md`
- `templates/product/VisualDesignSpecification_Template.md`
- `templates/mvp/MVPDefinition_Template.md`
- `templates/tasks/TaskPackage_Template.md`
- `templates/build/BuildResult_Template.md`
- `templates/verification/ImplementationVerification_Template.md`
- `templates/validation/UserValidation_Template.md`
- `templates/release/ReleaseResult_Template.md`

Templates preserve stage content standards and the Stage Artifact Contract.
They are shapes, not current product state.

## Forbidden Bootstrap Outputs

Bootstrap must not create:

```text
PROJECT_STATE.md
PROJECT_BOOTSTRAP.md
ARTIFACT_INDEX.md
ROUTE_MANIFEST.md
BOOTSTRAP_RESULT.md
POST_BOOTSTRAP_ENTRY.md
docs/protocol/SAPDP.md
docs/protocol/protocol/
```

Bootstrap must not create lifecycle conclusion artifacts, product source code,
decisions, activation state, route state, progress state, or fabricated Git
evidence.

## Execution

1. Verify the Product Repository and SAPDP source.
2. Resolve Product Name and the exact SAPDP ref.
3. Refuse destructive overwrite or ambiguous migration.
4. Create the required directories and `.gitkeep` files.
5. Create a static README.
6. Create `SAPDP.lock`.
7. Copy the required templates from the locked ref.
8. Add only generated Bootstrap paths.
9. Create one local Bootstrap commit.
10. Run Bootstrap Validation.
11. Stop before Problem execution.

The Human may perform the Git commit. Remote push is optional during
Bootstrap. Missing remote state is not a local Bootstrap failure.

## Idempotency

- Repeated execution must not overwrite existing product artifacts.
- A conforming existing lock and scaffold returns PASS without mutation.
- Recoverable missing scaffold files return `PATCH REQUIRED`.
- A conflicting lock, destructive overwrite, unresolved source, or ambiguous
  existing product state returns `FAIL`.
- Explicit migration is required for a legacy SAPDP workspace.

## Completion

Bootstrap is complete when:

- `SAPDP.lock` is valid;
- required directories and templates exist;
- generated Bootstrap files are committed;
- no conclusion artifact or product code was created; and
- Bootstrap Validation returns PASS.

Problem is then the first missing canonical Product Development artifact.

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

On failure add:

```text
BLOCKER:
<one concrete blocker>
```
