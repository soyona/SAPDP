# DNA Type

`Visual DNA`

# Visual Tokens

| Parameter | Value | Unit / Format | Scope / State | Evidence ID |
| --- | --- | --- | --- | --- |
| `color.text.primary` | `#6B5C43` | sRGB hex | Primary body and interface text | `EVID-002` |
| `color.surface.primary` | `#F8F8F0` | sRGB hex | Primary cards and soft page surfaces | `EVID-002` |
| `color.surface.white` | `#FFFFFF` | sRGB hex | High-contrast inset surfaces | `EVID-002` |
| `color.action.teal` | `#007D75` | sRGB hex | Primary interactive accent and link hover | `EVID-002` |
| `color.action.dark-teal` | `#015B55` | sRGB hex | Dark teal action variant | `EVID-002` |
| `color.action.blue` | `#2D6895` | sRGB hex | Blue action variant | `EVID-002` |
| `color.action.green` | `#19AD5E` | sRGB hex | Green action variant | `EVID-002` |
| `color.accent.yellow` | `#F1E26F` | sRGB hex | Button outline and bright decorative accent | `EVID-002` |
| `color.accent.mint` | `#82D7AA` | sRGB hex | Mint decorative accent | `EVID-002` |
| `color.accent.coral` | `#EC7175` | sRGB hex | Coral decorative accent | `EVID-002` |
| `color.accent.orange` | `#EF8341` | sRGB hex | Orange decorative accent | `EVID-002` |
| `color.accent.light-blue` | `#98D2E3` | sRGB hex | Light-blue decorative accent | `EVID-002` |
| `color.focus.inner` | `#000000` | sRGB hex | Inner keyboard-focus ring | `EVID-002` |
| `color.focus.outer` | `#FFEF00` | sRGB hex | Outer keyboard-focus ring | `EVID-002` |
| `font.body.family` | `Libre Franklin, sans-serif` | CSS font-family | Body and interface copy | `EVID-001` |
| `font.body.weight` | `500` | CSS font-weight | Default body copy | `EVID-001` |
| `font.body.emphasis-weight` | `800` | CSS font-weight | Bold body copy and text links | `EVID-001` |
| `font.heading.family` | `Zilla Slab, sans-serif` | CSS font-family | Headings, labels, and calls to action | `EVID-001` |
| `font.heading.weight` | `700` | CSS font-weight | All heading levels | `EVID-001` |
| `radius.base` | `8` | px | Standard inset surfaces and tabs | `EVID-004` |
| `radius.large` | `16` | px | Text cards and patterned blades | `EVID-004` |
| `border.frame.base` | `8px solid #F8F8F0` | CSS border | Media frame below `64em` | `EVID-004` |
| `shadow.surface` | `0 10px 20px rgba(0,0,0,0.2)` | CSS box-shadow | Elevated patterned blades and inset surfaces | `EVID-004` |
| `shadow.media` | `0 2px 8px rgba(0,0,0,0.5)` | CSS box-shadow | Framed photo and video media | `EVID-004` |
| `motion.standard` | `400ms ease` | CSS duration + timing | Viewport slide transform and opacity | `EVID-005` |
| `motion.pop` | `400ms cubic-bezier(0.68,-0.55,0.265,1.55)` | CSS duration + timing | Viewport pop transform and opacity | `EVID-005` |

# Layout Rules

- `layout.container`: set `width: 100%`, `max-width: 1136px`, and `margin-inline: auto`. Evidence: `EVID-003`.
- `layout.wrapper`: apply `24px` inline padding inside the centered container. Evidence: `EVID-003`.
- `layout.grid-gutter`: apply `12px` inline padding to each row and column so adjacent columns form a `24px` gutter. Evidence: `EVID-003`.
- `layout.breakpoints`: use `40em`, `64em`, and `71.5em` as the medium, large, and extra-large responsive thresholds. Evidence: `EVID-003`.
- `layout.columns`: below `40em`, stack content; at `40em` and above, use a wrapping 12-column flex grid with each column unit equal to `8.33333%`. Evidence: `EVID-003`.
- `layout.feature-blades`: alternate standard and reversed row direction for adjacent feature sections, pairing one prominent text card with layered photo or character imagery. Evidence: `EVID-006`.
- `layout.section-boundaries`: use patterned, illustrated, or organic wave-edged surfaces rather than plain rectangular section boundaries for primary feature blades. Evidence: `EVID-006`.

# Typography Rules

- `type.body`: use Libre Franklin at weight `500` with `line-height: 1.5`; set the root font size to `13px` below `64em` and `15px` at `64em` and above. Evidence: `EVID-001`.
- `type.body-emphasis`: use Libre Franklin at weight `800` for bold body copy and inline actions. Evidence: `EVID-001`.
- `type.heading`: use Zilla Slab at weight `700`. Evidence: `EVID-001`.
- `type.h1`: use `20px/1.2` below `40em`, `28px/1.2` from `40em`, and `36px/1.2` from `64em`. Evidence: `EVID-001`.
- `type.h2`: use `22px/1.3` below `64em` and `28px/1.3` from `64em`. Evidence: `EVID-001`.
- `type.h3`: use `18px/1.5` below `64em` and `26px/1.5` from `64em`. Evidence: `EVID-001`.
- `type.h4`: use `16px/1.3` below `40em`, `15px/1.3` from `40em`, and `22px/1.3` from `64em`. Evidence: `EVID-001`.
- `type.h5`: use `13px/1.5` below `64em` and `18px/1.5` from `64em`. Evidence: `EVID-001`.

# Color System

- `color.foundation`: use brown `#6B5C43` for primary text and off-white `#F8F8F0` for the dominant soft surface. Evidence: `EVID-002`.
- `color.actions`: use teal `#007D75`, dark teal `#015B55`, blue `#2D6895`, or green `#19AD5E` for solid action variants; keep action text at off-white `#F8F8F0` when a dark surface requires light text. Evidence: `EVID-002`.
- `color.accents`: use yellow `#F1E26F`, mint `#82D7AA`, coral `#EC7175`, orange `#EF8341`, light blue `#98D2E3`, sand `#F8EEBC`, or tan `#D2B195` for decorative surfaces, icons, and motifs. Evidence: `EVID-002`.
- `color.focus`: render keyboard focus as `0 0 0 2px #000000` plus `0 0 0 4px #FFEF00`; supplementary shadows may sit outside these two rings but must not replace them. Evidence: `EVID-002`.
- `color.play-control`: pair a teal `#008077` circular surface with an off-white `#F8F8F0` icon and border. Evidence: `EVID-002`.

# Spacing System

- `space.wrapper-inline`: use `24px` on both inline edges of the page wrapper. Evidence: `EVID-003`.
- `space.grid-half-gutter`: use `12px` on each row and column edge to construct the `24px` grid gutter. Evidence: `EVID-003`.
- `space.section`: use `30px` below `40em` and `100px` from `40em` for the bottom margin between major sections. Evidence: `EVID-003`.
- `space.subsection`: use `40px` below `40em`, `34px` from `40em`, and `70px` from `64em` for the bottom margin between subsections. Evidence: `EVID-003`.
- `space.card`: use `40px` padding below `40em`, `36px 42px` from `40em`, and `60px 48px` from `64em`. Evidence: `EVID-004`.
- `space.card-inset`: inset the inner card surface by `11px` below `64em` and `16px` from `64em`. Evidence: `EVID-004`.
- `space.button`: use `18px 30px 14px` padding and a minimum inline size of `240px` for the standard call to action. Evidence: `EVID-004`.

# Component Rules

- `component.text-card`: set the outer surface to `#F8F8F0`, radius to `16px`, and responsive padding to `space.card`; add an inset `#F8F8F0` surface using `space.card-inset`, radius `8px`, and shadow `0 10px 20px rgba(0,0,0,0.2)`. Evidence: `EVID-004`.
- `component.media-frame`: use border `8px solid #F8F8F0` and shadow `0 2px 8px rgba(0,0,0,0.5)`; from `64em`, use `11px` for semi-thick and `15px` for thick variants. Evidence: `EVID-004`.
- `component.button`: use Zilla Slab, minimum width `240px`, padding `18px 30px 14px`, and the official superellipse silhouette; place a yellow `#F1E26F` outline behind the action surface with `filter: drop-shadow(0 5px 5px rgba(107,92,67,0.3))`. Evidence: `EVID-004`.
- `component.feature-blade`: combine one patterned or illustrated surface, one rounded text card, one oversized slab-serif heading, short body copy, one superellipse call to action, and layered official-style photo or character imagery. Evidence: `EVID-006`.
- `component.pattern-library`: select motifs from acorns, characters, confetti, dots, leaves, stripes, trees, waves, wood grain, or vertical lines; use motifs as supporting surfaces and section edges rather than primary content. Evidence: `EVID-004`.
- `component.photo-stack`: layer multiple framed images with visible overlap and varied offsets; preserve one clear dominant image and keep all frames on the off-white border treatment. Evidence: `EVID-006`.

# Motion Rules

- `motion.viewport-slide`: start at `opacity: 0` with a directional translation of `50%` or a minimal upward translation of `30px`; transition to `opacity: 1` and `translate(0,0)` over `400ms ease`. Evidence: `EVID-005`.
- `motion.viewport-slide-lazy`: use `700ms ease` when the slower lazy slide variant is selected. Evidence: `EVID-005`.
- `motion.viewport-pop`: start at `opacity: 0; transform: scale(0.5)` and transition to `opacity: 1; transform: scale(1)` over `400ms cubic-bezier(0.68,-0.55,0.265,1.55)`. Evidence: `EVID-005`.
- `motion.stagger`: stagger grouped character, photo, or content entrances in `100ms` increments, using only delays from `100ms` through `1900ms`. Evidence: `EVID-005`.
- `motion.button-outline`: transition outline scale over `300ms`; use `cubic-bezier(0.6,-0.28,0.735,0.045)` for the resting transition and `cubic-bezier(0.68,-0.55,0.265,1.55)` for hover entry. Evidence: `EVID-005`.
- `motion.button-arrow`: translate the arrow `5px` on hover over `200ms ease`. Evidence: `EVID-005`.
- `motion.hero-pan`: where a horizontally oversized scenic hero is used, pan it over `16s ease-in-out` with alternate direction and infinite repetition. Evidence: `EVID-005`.
- `motion.reduced`: for `prefers-reduced-motion: reduce` or an explicit reduced-motion state, disable pattern and hero animations and set media play-control transition duration to `0s`. Evidence: `EVID-005`.

# Evidence References

| Evidence ID | Supported Items | Verified Fact | Evidence Artifact | Official Source |
| --- | --- | --- | --- | --- |
| `EVID-001` | Visual Tokens: fonts; Typography Rules | Official font families, weights, root sizes, heading sizes, and line heights | `dna/evidence/AnimalCrossing/Official_Visual_Evidence_Register.md` | https://animal-crossing.com/new-horizons/assets/css/global.css |
| `EVID-002` | Visual Tokens: colors; Color System | Official interface palette, play-control colors, and focus colors | `dna/evidence/AnimalCrossing/Official_Visual_Evidence_Register.md` | https://animal-crossing.com/new-horizons/assets/css/global.css |
| `EVID-003` | Layout Rules; Spacing System | Official breakpoints, container width, grid, gutters, and section spacing | `dna/evidence/AnimalCrossing/Official_Visual_Evidence_Register.md` | https://animal-crossing.com/new-horizons/assets/css/global.css |
| `EVID-004` | Visual Tokens: radii, borders, shadows; Spacing System; Component Rules | Official card, media-frame, button, surface, and motif parameters | `dna/evidence/AnimalCrossing/Official_Visual_Evidence_Register.md` | https://animal-crossing.com/new-horizons/assets/css/global.css |
| `EVID-005` | Visual Tokens: motion; Motion Rules | Official durations, easing curves, transforms, delays, and reduced-motion behavior | `dna/evidence/AnimalCrossing/Official_Visual_Evidence_Register.md` | https://animal-crossing.com/new-horizons/assets/css/global.css |
| `EVID-006` | Layout Rules; Component Rules | Official feature-blade hierarchy, alternating composition, organic edges, and layered imagery | `dna/evidence/AnimalCrossing/Official_Visual_Evidence_Register.md` | https://animal-crossing.com/new-horizons/ |
