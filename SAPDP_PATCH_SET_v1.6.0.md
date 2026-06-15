# SAPDP Patch Set v1.6.0

Release:
v1.6.0

Theme:
Context Routing Optimization

---

## Patch Summary

v1.6.0 adds a persistent Route Manifest layer while preserving v1.5.0 Route Cards.

The patch introduces:

```text
ROUTE_MANIFEST.md

Route Manifest ownership

Artifact Routing Block

Bootstrap route manifest generation

Template route metadata

Migration path from v1.5.0
```

---

## Files Added

```text
engine/bootstrap/ROUTE_MANIFEST_TEMPLATE.md
SAPDP_PATCH_SET_v1.6.0.md
SAPDP_MIGRATION_GUIDE_v1.5.0_to_v1.6.0.md
SAPDP_AUDIT_REPORT_v1.6.0.md
SAPDP_REALITY_VALIDATION_CHECKLIST_v1.6.0.md
SAPDP_RELEASE_PACKAGE_v1.6.0.md
SAPDP_RELEASE_PATCH_v1.6.0.patch
```

---

## Files Updated

```text
engine/SAPDP_CANONICAL_PROTOCOL.md
engine/SAPDP_LIFECYCLE.md
engine/bootstrap/ARTIFACT_INDEX_TEMPLATE.md
engine/bootstrap/BOOTSTRAP.md
engine/bootstrap/BOOTSTRAP_RESULT_Template.md
engine/bootstrap/POST_BOOTSTRAP_ENTRY_Template.md
engine/bootstrap/PROJECT_BOOTSTRAP_TEMPLATE.md
engine/bootstrap/bootstrap_manifest.json
engine/contracts/BootstrapContract.md
engine/contracts/BootstrapValidationContract.md
templates/problem/ProblemDefinition_Template.md
templates/solution/SolutionDefinition_Template.md
templates/product/ProductRequirement_Template.md
templates/product/ProductRepresentation_Template.md
templates/product/UXSpecification_Template.md
templates/product/VisualDesignSpecification_Template.md
templates/product/TechnicalConstraint_Template.md
templates/mvp/MVPDefinition_Template.md
templates/tasks/TaskPackage_Template.md
templates/verification/ImplementationVerification_Template.md
templates/validation/UserValidation_Template.md
templates/release/ReleaseResult_Template.md
README.md
README.zh-CN.md
START.md
DEVELOPER.md
```

---

## Compatibility

```text
Backward compatible:
YES

New runtime:
NO

New CLI:
NO

New database:
NO

Codex owns route generation:
YES

ChatGPT owns route consumption:
YES
```

Existing v1.5.0 Route Cards remain valid.

Pre-v1.6.0 product repositories without ROUTE_MANIFEST.md require migration, not lifecycle failure.

---

## Patch Result

```text
PATCH SET:
COMPLETE
```
