# Backward Compatibility Template

This template is backward compatibility only. It MUST NOT be used for new Visual DNA or Product DNA assets. New assets use `VisualDNA_Template.md` or `ProductDNA_Template.md` and declare `DNA Type`.

# Experience Pattern

## Pattern

<State the verified end-to-end experience pattern as an observable constraint.>

## Rules

- <Executable experience rule. Evidence: EVID-001.>

# Layout Pattern

## Pattern

<State the verified hierarchy, spatial organization, and responsive behavior.>

## Rules

- <Executable layout rule with measurable conditions. Evidence: EVID-001.>

# Visual Tokens

Visual Tokens MUST be executable parameters. Every parameter MUST provide an explicit value, a unit or format where applicable, its scope or state, and an Evidence ID. Descriptive prose without parameter values is invalid.

| Parameter | Value | Unit / Format | Scope / State | Evidence ID |
| --- | --- | --- | --- | --- |
| `<token-name>` | `<explicit value>` | `<unit or format, or none>` | `<application scope or state>` | `EVID-001` |

# Component Rules

## Rules

- <Component anatomy, variant, state, or composition rule. Evidence: EVID-001.>

# Interaction / Motion Rules

## Interaction Rules

- <Trigger, response, feedback, and state-transition rule. Evidence: EVID-001.>

## Motion Rules

- <Motion parameter or explicit no-motion rule, including duration and easing when applicable. Evidence: EVID-001.>

# Do / Do Not Rules

## Do

- <Required implementation or execution rule. Evidence: EVID-001.>

## Do Not

- <Prohibited pattern and the drift it prevents. Evidence: EVID-001.>

# Evidence References

Evidence References is mandatory. Every pattern, token, and rule MUST cite an Evidence ID defined in this section. Missing Evidence References blocks DNA Governance Release Audit.

| Evidence ID | Supported Items | Verified Fact | Evidence Artifact | Official Source |
| --- | --- | --- | --- | --- |
| `EVID-001` | `<section and item identifiers>` | `<verified fact>` | `dna/evidence/<Product>/<artifact>` | `<official source title and URL>` |
