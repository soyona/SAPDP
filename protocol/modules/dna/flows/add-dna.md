# Add DNA Flow

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module-flow
owner_id=dna
component_id=add-dna
schema=sapdp-authority-v1
depends_on=module|artifact-materialization|design
depends_on=module|artifact-materialization|entry
depends_on=module|artifact-materialization|runtime
depends_on=module|execution-governance|design
depends_on=module|execution-governance|entry
depends_on=module|execution-governance|runtime
<!-- SAPDP Authority Metadata End -->

## Entry

- `Add Visual DNA <Product or Official URL>` sets DNA Type to Visual DNA.
- `Add Product DNA <Product or Official URL>` sets DNA Type to Product DNA.
- Generic `Add DNA <Product or Official URL>` returns exactly `HUMAN_INPUT: Select DNA Type` and stops before evidence collection.

## Stages

1. DNA Intake - Human + ChatGPT
2. Evidence Validation - Codex
3. DNA Design - ChatGPT
4. Design Audit - ChatGPT
5. Materialization - Codex
6. Repository Audit - ChatGPT
7. Release - Codex

No stage may be added implicitly.

## Stage Contracts

### DNA Intake

Input: product name or official URL and explicit DNA Type.

Output: target identity, DNA Type, evidence scope, and non-goals.

### Evidence Validation

Collect official product reality, official documentation, official help content, and direct usage evidence. Blogs, reviews, forums, AI-generated claims, and unsupported opinions are invalid.

Output: evidence identifiers, sources, observations, and blockers.

### DNA Design

Map validated evidence to the matching DNA schema. Do not bind a required framework, language, database, or technology stack.

### Design Audit

Validate evidence traceability, type boundaries, schema completeness, technology neutrality, and library compatibility.

### Materialization

Create the DNA asset and new evidence under `library/dna/`, using the matching template. Do not modify unrelated assets.

### Repository Audit

Compare Git Diff with the approved DNA design and verify template, evidence, paths, and scope.

### Release

Release only after Repository Audit PASS. Repository release mechanics follow the governing repository release contract.

## Rework

- Design Audit FAIL returns to DNA Design.
- Materialization BLOCKED remains in Materialization.
- Repository mismatch returns to Materialization.
- Design defect returns to DNA Design.
- Release environment failure remains in Release.
