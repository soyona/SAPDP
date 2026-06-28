# SAPDP Repository Architecture

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=architecture
owner_id=repository
component_id=root
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## Scope

This document is the sole authority for SAPDP repository structure, authority placement, module packaging, directory creation, and CAP ownership.

## Allowed Root

Only these repository-root entries are allowed:

```text
.github/
.gitattributes
.gitignore
AGENTS.md
CHANGELOG.md
DEVELOPER.md
LICENSE
README.md
SAPDP.md
docs/
engine/
library/
protocol/
scripts/
templates/
tests/
```

Adding another root entry requires a Protocol Evolution Design Freeze that updates this allowlist.

## Directory Ownership

| Path | Responsibility | Authority |
| --- | --- | --- |
| `SAPDP.md` | Version, invocation, router, global rules, authority registry | Root authority |
| `protocol/flows/` | Flow behavior | Registered Flow authority |
| `protocol/modules/` | Module behavior | Registered Module authority |
| `engine/` | Non-authoritative runtime implementation | None |
| `scripts/` | Deterministic automation | Owning Flow or Module |
| `templates/` | Non-authoritative artifact shapes | Owning Flow or Module |
| `library/` | Governed reusable assets | Owning Module |
| `tests/` | Non-authoritative verification | Referenced authority |
| `docs/` | Guides and historical evidence | None |
| `.github/` | Read-only validation automation | None |

`engine/`, `scripts/`, `templates/`, `library/`, `tests/`, and `docs/` must not define current protocol behavior.

## Change Classification

Every Evolution Definition must classify its change as one or more of:

```text
NEW_FLOW
NEW_MODULE
NEW_FEATURE
UPGRADE
FIX
ASSET
DOCUMENTATION
TOOLING
```

A feature belongs to an existing owner by default. A new Flow requires an independent entry, state, transitions, and output. A new Module requires explicit consumers, interface, and responsibility boundary.

## Naming and Path Safety

- New directories use lowercase kebab-case.
- `misc`, `common`, `temp`, and `new` are prohibited ownership names.
- Empty directories and placeholder-only module packages are prohibited.
- Repository paths must be relative, unique, free of `..`, and outside `.git`.
- Normative files and Design Freeze files must not be symlinks.
- Moves are represented as one deleted path plus one added path.

## Module Package Standard

```text
protocol/modules/<module-id>/
├── module.md
├── design.md
├── runtime.md
└── flows/
```

`module.md`, `design.md`, and `runtime.md` are required. `flows/` exists only when the Module owns a flow. Every normative file must be registered individually in `SAPDP.md`.

## Flow Authority Standard

Every Flow authority defines:

1. Authority and scope
2. Entry conditions
3. Inputs
4. Stages and execution environments
5. Readiness gates
6. Transitions and rework
7. Outputs
8. Runtime state and artifacts
9. Script contracts
10. Validation and audit
11. Failure and recovery

A large Flow may register additional components under the same owner ID when each component has a distinct, non-overlapping responsibility. Every component is registered and included in Authority Digest. A component does not create another Flow.

## Authority Dependencies

- Dependencies are declared as exact registered owner IDs.
- Circular dependencies are invalid.
- Runtime loads only the routed authority and its explicit dependency closure.
- Missing, duplicate, or cyclic dependencies return `BLOCKED AUTHORITY_DEPENDENCY_INVALID`.
- Global SAPDP rules and delegated authority scopes must not overlap.

## Historical Evidence

`docs/history/` contains non-authoritative evidence. Every historical Markdown record must state that it is not current runtime authority.

Protocol Evolution Design Freeze evidence uses:

```text
docs/history/protocol-evolution/<target-version>/design-freeze.md
```

After the target version is released, its directory is immutable. Later Evolutions must not include a released version's evidence path in Frozen Files.

## Candidate Commit Policy

- A Target Version may have multiple pre-release candidate commits.
- A failed Repository Audit requires a new Design Freeze with the failed candidate as the new Base Commit.
- Only the candidate approved by Repository Audit may be tagged.
- A released Target Version cannot be reused.

## CAP Ownership Matrix

| CAP | Status | Owner | Authority |
| --- | --- | --- | --- |
| CAP-001 | OWNED | root | `SAPDP.md` |
| CAP-002 | OWNED | bootstrap | `protocol/flows/bootstrap.md` |
| CAP-003 | OWNED | root | `SAPDP.md` |
| CAP-004 | OWNED | bootstrap | `protocol/flows/bootstrap.md` |
| CAP-005 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-006 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-007 | OWNED | artifact-materialization | `protocol/modules/artifact-materialization/module.md` |
| CAP-008 | OWNED | bootstrap | `protocol/flows/bootstrap.md` |
| CAP-009 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-010 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-011 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-012 | OWNED | execution-governance | `protocol/modules/execution-governance/runtime.md` |
| CAP-013 | OWNED | execution-governance | `protocol/modules/execution-governance/runtime.md` |
| CAP-014 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-015 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-016 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-017 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-018 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-019 | OWNED | execution-governance | `protocol/modules/execution-governance/runtime.md` |
| CAP-020 | OWNED | artifact-materialization | `protocol/modules/artifact-materialization/runtime.md` |
| CAP-021 | OWNED | execution-governance | `protocol/modules/execution-governance/runtime.md` |
| CAP-022 | OWNED | execution-governance | `protocol/modules/execution-governance/runtime.md` |
| CAP-023 | OWNED | execution-governance | `protocol/modules/execution-governance/runtime.md` |
| CAP-024 | OWNED | execution-governance | `protocol/modules/execution-governance/runtime.md` |
| CAP-025 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-026 | OWNED | dna | `protocol/modules/dna/design.md` |
| CAP-027 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-028 | OWNED | dna | `protocol/modules/dna/runtime.md` |
| CAP-029 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-030 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-031 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-032 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-033 | OWNED | root | `SAPDP.md` |
| CAP-034 | OWNED | protocol-evolution | `protocol/flows/protocol-evolution.md` |
| CAP-035 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-036 | OWNED | product-development | `protocol/flows/product-development.md` |
| CAP-037 | OWNED | execution-governance | `protocol/modules/execution-governance/runtime.md` |
| CAP-038 | RESERVED | none | none |
| CAP-039 | OWNED | dna | `protocol/modules/dna/module.md` |
| CAP-040 | OWNED | root | `SAPDP.md` |
| CAP-041 | OWNED | goal-system | `protocol/modules/goal-system/runtime.md` |
| CAP-042 | OWNED | goal-system | `protocol/modules/goal-system/runtime.md` |
| CAP-043 | OWNED | root | `SAPDP.md` |
| CAP-044 | OWNED | dna | `protocol/modules/dna/module.md` |
| CAP-045 | OWNED | repository | `protocol/repository-architecture.md` |

Every CAP from CAP-001 through CAP-045 must appear exactly once as `OWNED` or `RESERVED`.
