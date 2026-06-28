# DNA Module Design

<!-- SAPDP Authority Metadata Start -->
authority=normative
kind=module
owner_id=dna
component_id=design
schema=sapdp-authority-v1
<!-- SAPDP Authority Metadata End -->

## DNA Types

DNA is a governed protocol asset with exactly two non-overlapping types:

- Visual DNA: transferable sensory and visual expression, or How It Looks.
- Product DNA: transferable experience and behavioral mechanisms, or How It Works.

Every new asset declares `DNA Type` as exactly `Visual DNA` or `Product DNA`.

## Visual DNA

Visual DNA may own:

- visual personality and hierarchy;
- layout, density, spacing, typography, color, and motion rules;
- component visual rules;
- executable visual tokens with values, units, formats, scope, and state.

Visual DNA must not own progression, motivation, reward, retention, economy, or behavioral mechanisms.

## Product DNA

Product DNA may own:

- experience and interaction patterns;
- motivation, reward, retention, progression, exploration, collection, creation, and competition mechanisms;
- relationships between those mechanisms.

Product DNA must not own color values, typography values, visual tokens, visual layout specifications, or component visual design.

## Technology Neutrality

DNA must not require a framework, language, database, vendor, or technology stack. Constraints describe transferable behavior or visual implementation requirements without prescribing a product technology.

## Templates

- Visual DNA uses `templates/dna/VisualDNA_Template.md`.
- Product DNA uses `templates/dna/ProductDNA_Template.md`.

Templates implement this design and are not independent authority.

## Evidence

Every new DNA fact maps to an evidence identifier and official source. Allowed sources are:

- official product reality;
- official documentation;
- official help content;
- direct, reproducible usage observation.

Blogs, reviews, forums, AI-generated claims, personal opinions, and unsupported statements are prohibited evidence inputs.

New evidence is stored under `library/dna/evidence/<product>/`.

## Library

- Visual assets: `library/dna/visual/`
- Product assets: `library/dna/product/`
- Evidence: `library/dna/evidence/`

Existing assets remain valid without retroactive evidence rewriting. New assets must satisfy this design and the matching template.

## Selection Invariants

- Exactly one Visual DNA and one Product DNA are selected.
- Multiple selections of either type are invalid.
- Visual plus Product DNA is valid.
- The protocol must not restrict otherwise valid cross-type combinations.

## Governance

Schema, templates, replication rules, and official library entries change only through an approved governance flow. The Human selects DNA but does not redefine the schema during Product Development.
