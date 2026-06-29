# SAPDP Repository Maintenance Guide

This guide is non-authoritative. Current behavior is owned by `SAPDP.md` and its registered authorities.

## Authority Resolution

1. Read the version, Router, global rules, and Registry from `SAPDP.md`.
2. Resolve the owning authority by exact Registry kind, owner, and component.
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

For bounded runtime inspection, run:

```bash
./scripts/sapdp-context --ref "<git-ref>" --flow "<owner-id>" --stage "<stage-id>"
```

Dependencies use:

```text
depends_on=<kind>|<owner-id>|<component-id>
```

Staged Flows resolve one registered `stage_authority` component at a time.

CI must run the same command with read-only repository permissions.

## Protocol Evolution Thread Handoff

After Design Freeze PASS and Materialization PASS, SAPDP emits a self-contained Handoff Card and stops the source thread. Codex App links bind the current repository path, origin URL, and encoded prompt. CLI uses `/new`; IDE uses New Thread. The target thread validates Git and Freeze evidence before loading only its target-stage authority closure.

Render or validate mechanically with:

```bash
./scripts/sapdp-handoff render <frozen options>
./scripts/sapdp-handoff validate <frozen options>
```

The v5.0.0 to v6.0.0 migration alone materializes in the Design Freeze thread because v5.0.0 does not publish `authority_registry_location` in its Runtime Capsule.

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
