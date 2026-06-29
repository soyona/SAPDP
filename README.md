# SAPDP

SAPDP is an AI-assisted solo product development protocol for Human, ChatGPT, Codex, and Git collaboration.

Product Development advances through thirteen canonical conclusion artifacts.
Each artifact references the latest commit of its direct predecessor; no
persisted route, index, or lifecycle state file is required.

## Start

Use:

```text
sapdp
```

The current version and Home contract are resolved from [SAPDP.md](SAPDP.md).

## Authority

- [SAPDP.md](SAPDP.md): root authority, version, invocation, router, and global rules.
- [Repository Architecture](protocol/repository-architecture.md): directory, authority placement, Module packaging, and CAP ownership.
- [Product Development](protocol/flows/product-development.md)
- [Bootstrap](protocol/flows/bootstrap.md)
- [Protocol Evolution](protocol/flows/protocol-evolution.md)
- [Commit Audit](protocol/flows/commit-audit.md)
- [Intent Clarification](protocol/flows/intent-clarification.md)
- [DNA Module](protocol/modules/dna/module.md)

Registered authority paths in `SAPDP.md` are the source of truth. This README is a public entry point and is not protocol authority.

## Repository Areas

- `protocol/`: registered normative Flow, Module, and architecture files.
- `engine/`: non-authoritative execution assets.
- `scripts/`: deterministic repository automation.
- `templates/`: artifact shape implementations.
- `library/`: governed reusable assets.
- `tests/`: executable validation.
- `docs/history/`: non-authoritative historical evidence.

## Product and Protocol Repositories

Use this repository to maintain SAPDP itself. Product work belongs in a separate product repository initialized or continued under the resolved SAPDP version.

## License

See [LICENSE](LICENSE).
