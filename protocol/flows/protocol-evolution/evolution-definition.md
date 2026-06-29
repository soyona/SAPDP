# Protocol Evolution - Evolution Definition

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=flow
owner_id=protocol-evolution
component_id=evolution-definition
schema=sapdp-authority-v1
depends_on=architecture|repository|root
<!-- SAPDP Authority Metadata End -->

## Inputs

- Upgrade request
- Current repository state
- Current released protocol ref

## Outputs

- Upgrade Goal
- Scope
- Expected Outcome
- Change Type
- Non-goals
- Initial compatibility boundary

Change Type uses the Repository Architecture classification.

## Readiness

PASS requires explicit outputs, current local and remote evidence, a resolved Runtime Findings Registry, and no OPEN BLOCKER. Otherwise return one concrete blocker.

## Transition

PASS enters Design. The repository-evolution closure uses the Base Commit reference.
