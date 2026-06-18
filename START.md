# Start SAPDP

`SAPDP.md` is the protocol authority. Refresh `origin/main` before starting when no explicit version is pinned.

## Build a Product

```text
SAPDP

Protocol:
https://github.com/soyona/SAPDP.git

Goal:
Build <product name>
```

Bootstrap prepares the product workspace and stops before Problem. The product lifecycle is:

```text
Problem
↓
Solution
↓
Product DNA Selection
↓
Product Representation
↓
Product Requirement
↓
UX Specification
↓
Visual Design Specification
↓
MVP Definition
↓
Task Package
↓
Build
↓
Implementation Verification
↓
User Validation
↓
Release
```

At Product DNA Selection, use the approved Problem and Solution to select exactly one entry from the protocol's `dna/library/`. The Human may request a recommendation or select directly. Multi DNA, DNA Mixing, and DNA Composition are invalid.

Record the Selected DNA and resolved protocol ref in product runtime state. Every downstream stage through User Validation must consume it.

## Continue a Product

```text
SAPDP

Goal:
Continue <product name>
```

Runtime state and committed artifacts determine the current stage and next action.

## Upgrade SAPDP

```text
SAPDP

Goal:
Upgrade SAPDP
```

Protocol upgrades use Protocol Evolution. Product DNA changes use the DNA Governance lifecycle documented in `SAPDP.md`.
