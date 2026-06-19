# Animal Crossing Official Visual Evidence Register

Retrieved: 2026-06-19

DNA Type: `Visual DNA`

Product scope: Animal Crossing, represented by Nintendo's official *Animal Crossing: New Horizons* product site.

This register contains only measurable visual facts from Nintendo's official product reality and first-party published site assets. No blogs, reviews, forums, AI-generated content, personal opinions, or unsupported statements are included.

## EVID-001 — Official typography

- Official product: https://animal-crossing.com/new-horizons/
- Official stylesheet: https://animal-crossing.com/new-horizons/assets/css/global.css
- Observed evidence: The official page loads `Libre Franklin` at weights `500` and `800` and `Zilla Slab` at weight `700`. The stylesheet assigns `Libre Franklin, sans-serif` to body copy with weight `500` and line-height `1.5`; it assigns `Zilla Slab, sans-serif` to headings with weight `700`. The root font base is `13px` below `64em` and `15px` from `64em`. Published heading sizes are `20/22/18/16/13px` for H1–H5 at the base viewport, `28/22/18/15/13px` from `40em`, and `36/28/26/22/18px` from `64em`.

## EVID-002 — Official color system

- Official product: https://animal-crossing.com/new-horizons/
- Official stylesheet: https://animal-crossing.com/new-horizons/assets/css/global.css
- Observed evidence: The official stylesheet defines brown `#6B5C43` as `--color-main` and publishes recurring interface colors including off-white `#F8F8F0`, teal `#007D75`, dark teal `#015B55`, teal-3 `#008077`, blue `#2D6895`, blue-2 `#68A1D7`, green `#19AD5E`, mint `#82D7AA`, yellow `#F1E26F`, light yellow `#FFF8B7`, coral `#EC7175`, orange `#EF8341`, light blue `#98D2E3`, sand `#F8EEBC`, tan `#D2B195`, and white `#FFFFFF`. The official play-circle asset pairs teal-3 `#008077` with off-white `#F8F8F0`; the official focus treatment pairs black with yellow `#FFEF00`.

## EVID-003 — Official responsive layout and spacing

- Official product: https://animal-crossing.com/new-horizons/
- Official stylesheet: https://animal-crossing.com/new-horizons/assets/css/global.css
- Observed evidence: The official layout uses breakpoints at `40em`, `64em`, and `71.5em`. Wrapper, row, and container width is `100%` with a centered maximum width of `1136px`. Wrapper inline padding is `24px`; rows and columns each use `12px` inline padding, producing a 24px grid gutter. From `40em`, rows become wrapping flex containers and expose a 12-column percentage grid in `8.33333%` increments. Section spacing changes from a `30px` bottom margin at the base viewport to `100px` from `40em`; subsection spacing is `40px` at the base viewport, `34px` from `40em`, and `70px` from `64em`.

## EVID-004 — Official shapes, surfaces, imagery, and components

- Official product: https://animal-crossing.com/new-horizons/
- Official stylesheet: https://animal-crossing.com/new-horizons/assets/css/global.css
- Official page stylesheet: https://animal-crossing.com/new-horizons/assets/css/pages/home.css
- Observed evidence: The official stylesheet defines base radii of `8px` and `16px`, a base border of `10px`, and a base shadow of `0 10px 20px rgba(0,0,0,0.2)`. Text cards use off-white `#F8F8F0`, the large radius, and `40px` base padding; their inset surface begins `11px` from the outer edge. At `40em` card padding becomes `36px 42px`; at `64em` it becomes `60px 48px` and the inset becomes `16px`. Media frames use an `8px` off-white border and `0 2px 8px rgba(0,0,0,0.5)` shadow, with published thick and semi-thick variants of `15px` and `11px` from `64em`. Buttons use a custom superellipse SVG shape, Zilla Slab, a `240px` minimum width, and `18px 30px 14px` padding; the outline is yellow `#F1E26F` with a `0 5px 5px rgba(107,92,67,0.3)` drop shadow. The product page repeatedly combines photographic scenes and character cutouts with first-party repeating motifs including acorns, characters, confetti, dots, leaves, stripes, trees, waves, wood grain, and vertical lines.

## EVID-005 — Official motion and reduced-motion behavior

- Official product: https://animal-crossing.com/new-horizons/
- Official stylesheet: https://animal-crossing.com/new-horizons/assets/css/global.css
- Official page stylesheet: https://animal-crossing.com/new-horizons/assets/css/pages/home.css
- Observed evidence: Viewport slides transition transform and opacity over `400ms ease`; the lazy slide variant uses `700ms`. Viewport pop elements begin at `scale(0.5)` and transition to `scale(1)` over `400ms` using `cubic-bezier(0.68,-0.55,0.265,1.55)`. Published stagger delays advance in `100ms` increments from `100ms` through `1900ms`. Button outlines transform over `300ms` using the published in/out cubic-bezier curves, while button arrows translate `5px` over `200ms ease`. The home hero pans horizontally over `16s ease-in-out` with alternating infinite playback. The official stylesheet disables pattern and hero animation for `prefers-reduced-motion: reduce`; it also supplies an `.is-reduced-motion` override and removes media-frame play-button transition duration.

## EVID-006 — Official compositional product reality

- Official product: https://animal-crossing.com/new-horizons/
- Official product sections: https://animal-crossing.com/new-horizons/explore/
- Official product sections: https://animal-crossing.com/new-horizons/create/
- Official product sections: https://animal-crossing.com/new-horizons/share/
- Observed evidence: Nintendo's official product reality organizes the page into large scenic blades for exploring, creating, and sharing. Each blade pairs a patterned or illustrated environmental surface with one prominent rounded text card, an oversized slab-serif heading, short body copy, a superellipse call-to-action, and layered official character or photo imagery. The official home page alternates normal and reversed row direction across adjacent blades and uses decorative organic edges, waves, leaves, shells, and image stacks instead of plain rectangular section boundaries.

## Source classification

| Evidence ID | Allowed source class | Official owner | Evidence scope |
| --- | --- | --- | --- |
| `EVID-001` | Official product reality / first-party asset | Nintendo | Typography families, weights, sizes, and leading |
| `EVID-002` | Official product reality / first-party asset | Nintendo | Published interface palette and focus colors |
| `EVID-003` | Official product reality / first-party asset | Nintendo | Breakpoints, container, grid, gutters, and section spacing |
| `EVID-004` | Official product reality / first-party asset | Nintendo | Radii, borders, shadows, cards, frames, buttons, and motifs |
| `EVID-005` | Official product reality / first-party asset | Nintendo | Durations, easing, transforms, staggering, and reduced motion |
| `EVID-006` | Official product reality | Nintendo | Page-level composition and recurring visual hierarchy |
