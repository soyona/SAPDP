# NotionDNA

Version: `v1`

Status: Official

## DNA Name

NotionDNA

## Source Product

Notion

This DNA derives from observable product-experience patterns. It does not copy proprietary code, assets, content, or internal implementation.

## Applicable Product Types

- Collaborative knowledge workspaces
- Document and wiki products
- Structured note-taking products
- Lightweight project or content-management tools
- Products whose primary object is an editable, composable page

## Experience Target

Create a calm, direct-manipulation workspace where users can turn ideas into structured information without leaving the page or managing visible system complexity.

## Experience Constraints

- Primary authoring must feel continuous: navigation, editing, organization, and feedback must not fragment the user's working context.
- System complexity must remain subordinate to the user's content and current intent.
- Common actions must be discoverable without making all controls permanently visible.
- User input must survive recoverable network, synchronization, validation, and permission failures.
- The same conceptual action must behave consistently across page and content-unit contexts.

## Interaction Patterns

- The page is the primary work surface; reading and editing occur in place.
- Content is composed from movable blocks with predictable selection, insertion, duplication, transformation, and deletion behavior.
- Commands are discoverable near the user's focus through contextual controls and a searchable command surface.
- Keyboard operation supports the complete high-frequency authoring path.
- Drag and drop communicates destination before commit and preserves content integrity on cancellation.
- Progressive disclosure keeps secondary controls hidden until hover, focus, selection, or explicit invocation.
- Navigation preserves the user's editing context and makes the current location unambiguous.

## Information Architecture Patterns

- Organize durable content as pages in a visible hierarchy.
- Permit pages to contain content and child pages without splitting the mental model.
- Use a persistent workspace navigation region for hierarchy, search, and high-frequency destinations.
- Give every page a stable identity independent of its current title or parent.
- Represent structured collections through consistent views over the same underlying items, not duplicated datasets.
- Keep workspace, page, block, and property scopes distinguishable.

## Visual Patterns

- Prioritize content over chrome with restrained surfaces, borders, color, and elevation.
- Maintain generous whitespace and a readable content measure.
- Use typography and indentation to express hierarchy before decoration.
- Reveal action affordances contextually without causing layout shift.
- Use icons and color as optional recognition aids, never as the sole carrier of meaning.
- Keep dense collection views aligned, scannable, and visually subordinate to their content.

## Feedback Patterns

- Reflect edits immediately and communicate persistence without interrupting flow.
- Show collaboration presence and remote changes without obscuring local work.
- Provide visible focus, selection, drag destination, loading, empty, error, and permission states.
- Keep routine success feedback quiet; reserve prominent feedback for blocked, destructive, or failed actions.
- Make destructive actions reversible when feasible and confirm irreversible scope before commit.
- Preserve user input through retryable failures and reconnection.

## Implementation Constraints

- Model page content as addressable ordered units that can be edited and moved independently.
- Preserve stable identifiers across reorder, rename, nesting, synchronization, and view changes.
- Separate canonical content from its presentation in collection views.
- Support deterministic conflict handling so concurrent edits do not silently overwrite accepted work.
- Keep primary authoring interactions responsive and provide immediate optimistic feedback when safe.
- Enforce permissions consistently at workspace, page, and content-unit boundaries.
- These constraints prescribe no framework, language, database, or technology stack.

## Execution Constraints

- Build one complete page-authoring path before expanding secondary features.
- Materialize states for empty, loading, editing, selected, dragging, saving, saved, offline, failed, and permission denied.
- Verify keyboard, pointer, focus, and recovery behavior for every primary interaction.
- Reuse one content-unit interaction grammar across supported unit types.
- Do not imitate Notion branding, trademarks, proprietary assets, or exact visual trade dress.

## Anti Patterns

- Permanent toolbars that compete with content for attention
- Modal dialogs for routine inline authoring
- Separate read and edit pages for the primary workflow
- Unstable hierarchy after rename, move, or synchronization
- Hidden persistence failures or destructive conflict resolution
- Block behaviors that change unpredictably by content type
- Decorative complexity that weakens hierarchy or readability
- Copying source-product branding instead of reproducing experience constraints

## Codex Execution Rules

1. Treat the page and content units as the primary implementation model.
2. Implement direct manipulation, progressive disclosure, and keyboard parity as acceptance criteria.
3. Preserve stable identity and user input through all state transitions.
4. Implement observable feedback states before declaring a workflow complete.
5. Choose technology from approved product constraints; never infer it from this DNA.
6. Return `BLOCKED DNA_CONFLICT` when an approved artifact requires behavior incompatible with this DNA.
7. Do not combine NotionDNA with another Product DNA.

## Verification Checklist

- [ ] Exactly one Product DNA is selected and it is NotionDNA v1.
- [ ] The primary workflow stays on an editable page surface.
- [ ] Content units support predictable creation, selection, transformation, movement, and deletion.
- [ ] Page hierarchy and current location are visible and stable.
- [ ] High-frequency authoring is keyboard-accessible.
- [ ] Contextual controls use progressive disclosure without layout shift.
- [ ] Persistence, collaboration, failure, permission, and recovery states are observable.
- [ ] Stable identity survives rename, move, reorder, synchronization, and view changes.
- [ ] Destructive operations communicate scope and provide recovery when feasible.
- [ ] No prohibited anti pattern is present.
- [ ] No framework, language, database, or technology stack is prescribed.
- [ ] No Notion branding, proprietary asset, or exact visual trade dress is copied.
