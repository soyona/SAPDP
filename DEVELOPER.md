# SAPDP Repository Maintenance Guide

This document is for maintainers of the SAPDP repository. It describes repository structure, maintenance practices, and release operations only.

For protocol behavior and evolution, use [SAPDP.md](./SAPDP.md). For the public project entry point, use [README.md](./README.md).

## Repository Model

The repository separates public entry points, protocol authority, executable assets, reusable templates, reference authorities, and maintainer guidance:

- [README.md](./README.md) introduces SAPDP.
- [SAPDP.md](./SAPDP.md) owns the protocol version and protocol evolution lifecycle.
- [DEVELOPER.md](./DEVELOPER.md) owns repository maintenance guidance.
- [engine/](./engine/) contains Codex-consumable execution assets and contracts.
- [templates/](./templates/) contains reusable project artifact templates.
- [library/authorities/](./library/authorities/) indexes reference authorities.

The repository follows **One Concept = One Authority**. A maintenance document may link to an authority, but must not restate or reinterpret the rules that authority owns.

## Authority Ownership Map

| Concept | Authority |
| --- | --- |
| Protocol Version | [SAPDP.md](./SAPDP.md) |
| Protocol Evolution Lifecycle | [SAPDP.md](./SAPDP.md) |
| Bootstrap Rules | [Bootstrap Contract](./engine/contracts/BootstrapContract.md) |
| Bootstrap Validation | [Bootstrap Validation Contract](./engine/contracts/BootstrapValidationContract.md) |
| Artifact Materialization | [Artifact Materialization Contract](./engine/contracts/ArtifactMaterializationContract.md) |
| Repository Maintenance | [DEVELOPER.md](./DEVELOPER.md) |

When a change affects an owned concept, edit its authority. Elsewhere, replace duplicated definitions with a reference to that authority.

## Authority Resolution Maintenance Rule

- For protocol fact questions, identify the concept first.
- Resolve the owning authority from the Authority Ownership Map.
- Read the owning authority before answering or editing.
- Do not answer protocol facts from memory, discussion history, release notes, or old decisions.
- If authority evidence is missing, report `BLOCKED` instead of inferring.

## Layer Responsibilities

### Public entry points

[README.md](./README.md) explains what SAPDP is, who it is for, and where to start. It should not accumulate maintainer history or duplicate protocol and contract definitions.

### Protocol authority

[SAPDP.md](./SAPDP.md) is the authority for protocol versioning and protocol evolution. DEVELOPER.md references that authority and does not define protocol behavior or lifecycle rules.

### Engine

[engine/](./engine/) contains execution-relevant protocol assets, bootstrap assets, and contracts. Keep it optimized for Codex consumption. Research history, release evidence, and maintenance commentary do not belong in this layer.

Contract definitions belong only in their respective authority documents:

- [Bootstrap Contract](./engine/contracts/BootstrapContract.md)
- [Bootstrap Validation Contract](./engine/contracts/BootstrapValidationContract.md)
- [Artifact Materialization Contract](./engine/contracts/ArtifactMaterializationContract.md)

### Templates

[templates/](./templates/) contains reusable artifact templates grouped by purpose. Templates define artifact shape; they must not become independent authorities for protocol, lifecycle, bootstrap, or repository maintenance rules.

### Reference authorities

[library/authorities/](./library/authorities/) provides the reference-authority index. Keep references traceable to their owning documents and avoid copying normative content into the index.

## Repository Structure

```text
SAPDP/
├── README.md
├── SAPDP.md
├── DEVELOPER.md
├── engine/
│   ├── SAPDP_CANONICAL_PROTOCOL.md
│   ├── bootstrap/
│   └── contracts/
├── templates/
│   ├── mvp/
│   ├── problem/
│   ├── product/
│   ├── release/
│   ├── solution/
│   ├── state/
│   ├── tasks/
│   ├── validation/
│   └── verification/
└── library/
    └── authorities/
```

Add files only when they have a distinct responsibility that cannot be served by an existing authority or layer.

## Repository Model Verification Rule

- DEVELOPER.md must describe only committed repository structure.
- Do not document planned or speculative directories.
- Before release, verify every path listed in Repository Structure exists on `main`.
- Remove or correct any non-existent path.

## Maintenance Workflow

1. Identify the concept being changed and locate its authority in the ownership map.
2. Inspect dependent references and templates for impact without copying authority definitions into them.
3. Make the smallest coherent patch in the owning document or layer.
4. Remove stale duplication introduced by the affected content.
5. Validate links, repository structure, authority uniqueness, and relevant automated checks.
6. Review the diff for unrelated changes and temporary files.
7. Commit the validated patch with a focused message.

Preferred changes are targeted section replacements, additions, file moves, and renames. Avoid unnecessary document regeneration, parallel authority definitions, speculative files, and unrelated cleanup.

## Release Workflow

Release operations must use the version and evolution rules owned by [SAPDP.md](./SAPDP.md); this guide does not duplicate them.

For repository maintenance during an approved release:

1. Confirm the intended changes are complete and limited to the approved scope.
2. Run checks relevant to the changed files and verify authority references resolve.
3. Confirm the working tree contains no temporary artifacts or unrelated modifications.
4. Commit the release changes with an explicit release-oriented message.
5. Perform the required Git tag and remote publication operations specified by [SAPDP.md](./SAPDP.md).
6. Verify the published commit and tag from the remote.
7. Use the remote commit and release/tag URLs as release evidence.

Release packages, audit dumps, migration scratch files, and generated evidence do not belong in the repository root. Preserve durable release evidence in Git history, tags, and the remote release system.

## Repository Hygiene

- Keep each concept in its single owning authority.
- Use references instead of duplicated normative text.
- Keep the repository root limited to stable entry points and repository-level files.
- Keep execution assets in [engine/](./engine/), templates in [templates/](./templates/), and reference indexes in [library/authorities/](./library/authorities/).
- Do not commit caches, local environment files, temporary release artifacts, generated audit output, or editor metadata.
- Preserve existing naming and directory conventions.
- Check links and paths after moving or renaming files.
- Keep commits focused, reviewable, and free of unrelated changes.
- Treat historical behavior as Git history, not current maintenance guidance.

DEVELOPER.md must remain a repository maintenance guide only. Protocol behavior, lifecycle definitions, bootstrap definitions, version authority, and product governance belong to their mapped authorities.
