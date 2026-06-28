# SAPDP Repository Maintenance Guide

This guide is non-authoritative. Current behavior is owned by `SAPDP.md` and its registered authorities.

## Authority Resolution

1. Read the version, Router, global rules, and Registry from `SAPDP.md`.
2. Resolve the owning authority by Registry owner and component.
3. Edit one authority per concept.
4. Update implementation, tests, and CHANGELOG in the same Evolution.
5. Run `./scripts/sapdp-validate`.

Do not answer current protocol facts from README, this guide, historical records, templates, scripts, or session memory.

## Repository Responsibilities

| Path | Responsibility |
| --- | --- |
| `SAPDP.md` | Root authority |
| `protocol/` | Registered architecture, Flow, and Module authority |
| `engine/` | Runtime implementation |
| `scripts/` | Deterministic automation |
| `templates/` | Artifact templates |
| `library/` | Governed reusable assets |
| `tests/` | Validation |
| `docs/history/` | Historical evidence |
| `.github/` | Read-only CI |

The full placement and directory rules are in [Repository Architecture](protocol/repository-architecture.md).

## Change Rules

- Every repository change uses Protocol Evolution.
- Design identifies Change Type, owner, directory impact, compatibility, and tests.
- Design Freeze lists every changed path.
- Materialization stages only Frozen Files.
- Repository Audit compares Git Diff with committed Freeze evidence.
- Release tags only the audited commit.
- Released tags and their Freeze evidence are immutable.

## Validation

Run:

```bash
./scripts/sapdp-validate
```

Validation covers:

- root and registered authority;
- Authority Digest;
- repository layout;
- CAP ownership;
- authority dependencies;
- broken current references;
- runtime compatibility;
- script syntax and integration tests.

CI must run the same command with read-only repository permissions.

## Adding a Flow

A new Flow requires independent entry, state, stages, transitions, outputs, recovery, a registered authority, implementation ownership, and tests.

## Adding a Module

A Module uses:

```text
protocol/modules/<module-id>/
├── module.md
├── design.md
├── runtime.md
└── flows/
```

Every normative component is registered individually. Do not create empty packages or catch-all directories.

## Documentation

Authority files define runtime. Public guides explain without redefining. Historical records state that they are non-authoritative.
