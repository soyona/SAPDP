# DNA Recommendation Contract

## Purpose

Recommend a suitable Product DNA based on an approved Problem and Solution.

## Required Inputs

- Approved Problem artifact or committed reference
- Approved Solution artifact or committed reference
- Available official entries in the SAPDP DNA Library

## Output

Return one recommendation containing:
- Recommended DNA name and version
- Library path and resolved protocol ref
- Fit rationale mapped to the Problem and Solution
- Material constraints or mismatches
- Human decision required: select or reject

A recommendation is advisory. It does not become Selected DNA until the Human explicitly selects it.

## Recommendation Rules

1. Evaluate only official, released DNA Library entries.
2. Match product type, experience target, interaction model, and information architecture.
3. Prefer the entry that requires the fewest exceptions while preserving the approved Solution.
4. Recommend exactly one DNA or return `BLOCKED NO_SUITABLE_DNA`.
5. Do not combine, mix, or compose DNA entries.
6. Do not infer a technology stack from a DNA entry.

## Forbidden Actions

- Selecting DNA on behalf of the Human
- Recommending multiple DNA entries as a combined solution
- Inventing an unreleased DNA
- Modifying Problem or Solution to force a match
- Treating framework, language, database, or stack similarity as DNA fit

## PASS Criteria

- Inputs are approved and traceable.
- One official DNA is recommended.
- Rationale and mismatches are explicit.
- Human selection remains pending.

Otherwise return `BLOCKED` with one missing input or selection blocker.
