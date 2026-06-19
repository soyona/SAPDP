# DNA Consumption Contract

## Purpose

Make the Selected Visual DNA and Selected Product DNA executable, traceable constraints for downstream product development.

## Required Input

Exactly one Selected Visual DNA and exactly one Selected Product DNA. Each selection must include:
- DNA name and version
- DNA Type, except for backward-compatible existing Product DNA assets
- Official library path
- Resolved SAPDP protocol ref
- Human selection evidence

## Mandatory Consumers

The Selected Visual DNA and Selected Product DNA are mandatory inputs for:
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

1. Each consumer records both DNA references.
2. Each consumer translates relevant DNA constraints into its own acceptance criteria without copying irrelevant prose.
3. Conflicts between approved Problem or Solution and DNA return `BLOCKED DNA_CONFLICT`; they must not be silently resolved.
4. Visual DNA governs How It Looks; Product DNA governs How It Works. Their responsibilities must not overlap.
5. A DNA change invalidates downstream artifacts and requires readiness evaluation from Product Representation.
6. Any Selected Visual DNA may be freely combined with any Selected Product DNA. The protocol must not restrict valid combinations.
7. Multiple Visual DNA selections or multiple Product DNA selections are invalid.
8. Existing Product DNA assets remain valid without relocation or a `DNA Type` field and are treated as Product DNA when selected.

## Verification

Implementation Verification checks every applicable DNA checklist item against committed evidence. User Validation checks whether the intended experience is observable in real use. An unexplained deviation is a failure, not a discretionary adaptation.

## PASS Criteria

- Exactly one released Visual DNA and one released Product DNA are traceable.
- Every mandatory consumer references and applies both.
- Deviations are absent or governed by an approved DNA Evolution release.
- Verification evidence has no blocker.
