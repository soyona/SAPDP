# DNA Recommendation Contract

## Purpose

Recommend a suitable Visual DNA and Product DNA based on an approved Problem and Solution.

## Required Inputs

- Approved Problem artifact or committed reference
- Approved Solution artifact or committed reference
- Available official entries in the SAPDP DNA Library

## Output

Return one recommendation containing:
- Recommended Visual DNA name, version, library path, and resolved protocol ref
- Recommended Product DNA name, version, library path, and resolved protocol ref
- Fit rationale mapped to the Problem and Solution
- Material constraints or mismatches
- Human decision required: select or reject each selection

A recommendation is advisory. It does not become Selected Visual DNA or Selected Product DNA until the Human explicitly selects each asset.

## Recommendation Rules

1. Evaluate only official, released DNA Library entries.
2. Evaluate visual fit for How It Looks and product-behavior fit for How It Works without overlapping responsibilities.
3. Prefer the entry of each type that requires the fewest exceptions while preserving the approved Solution.
4. Recommend exactly one Visual DNA and one Product DNA or return `BLOCKED NO_SUITABLE_DNA`.
5. Allow any valid Visual DNA + Product DNA combination without protocol restriction.
6. Do not recommend multiple entries within the same DNA type.
7. Do not infer a technology stack from a DNA entry.

## Forbidden Actions

- Selecting DNA on behalf of the Human
- Recommending multiple Visual DNA entries or multiple Product DNA entries
- Inventing an unreleased DNA
- Modifying Problem or Solution to force a match
- Treating framework, language, database, or stack similarity as DNA fit

## PASS Criteria

- Inputs are approved and traceable.
- One official Visual DNA and one official Product DNA are recommended.
- Rationale and mismatches are explicit.
- Human selection remains pending.

Otherwise return `BLOCKED` with one missing input or selection blocker.
