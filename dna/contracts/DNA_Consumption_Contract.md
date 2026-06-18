# DNA Consumption Contract

## Purpose

Make the Selected DNA an executable, traceable constraint for downstream product development.

## Required Input

Exactly one Selected DNA with:
- DNA name and version
- Official library path
- Resolved SAPDP protocol ref
- Human selection evidence

## Mandatory Consumers

The Selected DNA is a mandatory input for:
- Product Representation
- Product Requirement
- UX Specification
- Visual Design Specification
- MVP Definition
- Task Package
- Build
- Implementation Verification
- User Validation

## Consumption Rules

1. Each consumer records the Selected DNA reference.
2. Each consumer translates relevant DNA constraints into its own acceptance criteria without copying irrelevant prose.
3. Conflicts between approved Problem or Solution and DNA return `BLOCKED DNA_CONFLICT`; they must not be silently resolved.
4. Implementation choices may vary, but interaction, experience, implementation, and execution constraints remain binding.
5. A DNA change invalidates downstream artifacts and requires readiness evaluation from Product Representation.
6. Multi DNA, DNA Mixing, and DNA Composition are invalid.

## Verification

Implementation Verification checks every applicable DNA checklist item against committed evidence. User Validation checks whether the intended experience is observable in real use. An unexplained deviation is a failure, not a discretionary adaptation.

## PASS Criteria

- Exactly one released DNA is traceable.
- Every mandatory consumer references and applies it.
- Deviations are absent or governed by an approved DNA Evolution release.
- Verification evidence has no blocker.
