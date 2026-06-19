# DNA Type

`Visual DNA`

# Visual Tokens

| Parameter | Value | Unit / Format | Scope / State | Evidence ID |
| --- | --- | --- | --- | --- |
| `color.brand.primary` | `#58CC02` | sRGB hex | Primary brand surface/accent | `EVID-001` |
| `color.brand.secondary-green` | `#89E219` | sRGB hex | Secondary green surface/accent | `EVID-001` |
| `color.text.primary` | `#4B4B4B` | sRGB hex | Primary typography | `EVID-001` |
| `color.background.primary` | `#FFFFFF` | sRGB hex | Primary page and card background | `EVID-001` |
| `color.accent.blue` | `#1CB0F6` | sRGB hex | Blue accent/link | `EVID-001` |
| `color.accent.red` | `#FF4B4B` | sRGB hex | Red accent | `EVID-001` |
| `color.accent.yellow` | `#FFC800` | sRGB hex | Yellow accent | `EVID-001` |
| `color.accent.orange` | `#FF9600` | sRGB hex | Orange accent | `EVID-001` |
| `color.accent.purple` | `#CE82FF` | sRGB hex | Purple accent | `EVID-001` |
| `color.accent.deep-blue` | `#2B70C9` | sRGB hex | Deep-blue accent | `EVID-001` |
| `color.neutral.surface` | `#F7F7F7` | sRGB hex | Subtle surface | `EVID-001` |
| `color.neutral.border` | `#E5E5E5` | sRGB hex | Borders and structural dividers | `EVID-001` |
| `color.neutral.muted` | `#AFAFAF` | sRGB hex | Muted text/icon | `EVID-001` |
| `color.neutral.secondary-text` | `#777777` | sRGB hex | Secondary body text | `EVID-001` |
| `font.headline.family` | `Feather, sans-serif` | CSS font-family | Large, brief headlines | `EVID-002` |
| `font.headline.weight` | `700` | CSS font-weight | Feather headline text | `EVID-002` |
| `font.body.family` | `DIN Next Rounded, DIN Round, sans-serif` | CSS font-family | Long headlines, subheadings, body | `EVID-002` |
| `font.body.weights` | `300, 400, 500, 700` | CSS font-weight list | DIN text variants | `EVID-002` |
| `font.fallback.family` | `Nunito, sans-serif` | CSS font-family | Substitute typeface | `EVID-002` |
| `radius.tile` | `8` | px | Content tile | `EVID-004` |
| `radius.card` | `10` | px | Bordered card | `EVID-004` |
| `radius.panel` | `12` | px | Navigation panel | `EVID-004` |
| `radius.guide-card` | `16` | px | Colored guide card | `EVID-004` |
| `border.structural` | `2px solid #E5E5E5` | CSS border | Cards, panels, dividers | `EVID-004` |
| `shadow.card` | `0 2px 0 #E5E5E5` | CSS box-shadow | Bordered card resting state | `EVID-004` |
| `motion.standard` | `300ms ease` | CSS duration + timing | Opacity, color, transform, filter | `EVID-005` |
| `motion.carousel` | `800ms ease` | CSS duration + timing | Carousel/content translation | `EVID-005` |

# Layout Rules

- `layout.container`: set `width: 100%`, `max-width: 1680px`, and `margin-inline: auto`. Evidence: `EVID-003`.
- `layout.page-gutter`: set inline padding to `24px`; at widths `>=768px`, `>=992px`, `>=1200px`, and `>=1600px`, use `32px`, `40px`, `50px`, and `80px` respectively. Evidence: `EVID-003`.
- `layout.breakpoints`: use `768px`, `992px`, `1200px`, and `1600px` as the four responsive thresholds. Evidence: `EVID-003`.
- `layout.content-grid`: use `display: grid`; select gaps only from the published gap tokens, and switch column count at the published responsive thresholds rather than at arbitrary widths. Evidence: `EVID-003`.
- `layout.navigation-panel`: hide the persistent panel below `768px`; from `768px` upward show it at `180px`, then `200px` at `992px`, `220px` at `1200px`, and `240px` at `1600px`. Evidence: `EVID-004`.

# Typography Rules

- `type.short-headline`: use Feather at weight `700`, lowercase, with `line-height: 1.00–1.10`; restrict this treatment to brief headlines of 10 words or fewer. Evidence: `EVID-002`.
- `type.long-headline`: for headlines longer than 10 words, use DIN Next Rounded with `line-height: 1.40`. Evidence: `EVID-002`.
- `type.body`: use DIN Next Rounded for subheadings and body copy with `line-height: 1.40`; available weights are `300`, `400`, `500`, and `700`. Evidence: `EVID-002`.
- `type.pairing`: when Feather and DIN Next Rounded share a composition, size Feather at `150%` of DIN, never size DIN larger, and do not mix the two families within one sentence. Evidence: `EVID-002`.
- `type.label`: use weight `700`, uppercase, and `letter-spacing: 0.5–0.75px` for compact labels. Evidence: `EVID-004`.
- `type.fallback`: when the proprietary faces are unavailable, use Nunito with weights `300`, `400`, `600`, or `700`. Evidence: `EVID-002`.

# Color System

- `color.core`: use Feather Green `#58CC02` as the primary brand color, Mask Green `#89E219` as the secondary green, Eel `#4B4B4B` for primary typography, and Snow `#FFFFFF` for the primary background. Evidence: `EVID-001`.
- `color.secondary`: select bold accents from Macaw `#1CB0F6`, Cardinal `#FF4B4B`, Bee `#FFC800`, Fox `#FF9600`, Beetle `#CE82FF`, or Humpback `#2B70C9`. Evidence: `EVID-001`.
- `color.neutral`: use Polar `#F7F7F7` for subtle surfaces, Swan `#E5E5E5` for borders, Hare `#AFAFAF` for muted content, Wolf `#777777` for secondary text, Eel `#4B4B4B` for primary text, and Snow `#FFFFFF` for base surfaces. Evidence: `EVID-001`.
- `color.guide-card`: render text as Snow `#FFFFFF` over a core or secondary solid-color surface. Evidence: `EVID-004`.

# Spacing System

- `space.padding`: choose component padding from `8`, `12`, `16`, `20`, `24`, `30`, `32`, `40`, `50`, or `70px`. Evidence: `EVID-003`.
- `space.grid-gap`: choose two-axis grid gaps from `10`, `15`, `16`, `20`, `24`, `30`, `40`, or `50px`. Evidence: `EVID-003`.
- `space.column-gap`: choose grid column gaps from `24`, `30`, `40`, `50`, `60`, or `70px`. Evidence: `EVID-003`.
- `space.responsive`: change spacing only at `768`, `992`, `1200`, or `1600px`; do not interpolate between breakpoints. Evidence: `EVID-003`.

# Component Rules

- `component.bordered-card`: set background to `#FFFFFF`, border to `2px solid #E5E5E5`, radius to `10px`, and resting shadow to `0 2px 0 #E5E5E5`. Evidence: `EVID-004`.
- `component.content-tile`: set background to `#F7F7F7`, radius to `8px`, use a column flex layout, and clip overflowing media. Evidence: `EVID-004`.
- `component.guide-card`: set radius to `16px`, text to `#FFFFFF`, and a solid core/secondary palette background; on hover apply `filter: brightness(1.1)`. Evidence: `EVID-004`.
- `component.navigation-panel`: set border to `2px solid #E5E5E5`, radius to `12px`, and `overflow: hidden`; separate groups with `2px` Swan dividers. Evidence: `EVID-004`.
- `component.divider`: render structural dividers as `2px solid #E5E5E5`; when a pill-ended divider is needed, set `border-radius: 16px`. Evidence: `EVID-004`.

# Motion Rules

- `motion.standard`: animate opacity, color, transform, or filter changes over `300ms` using CSS `ease`. Evidence: `EVID-005`.
- `motion.carousel`: animate horizontal content translation over `800ms` using CSS `ease`, with inactive panels positioned at `translateX(-100%)` or `translateX(100%)` and the active panel at `translateX(0)`. Evidence: `EVID-005`.
- `motion.off-canvas`: begin the panel at `translateX(-100%)`, enter to `transform: none` over `300ms ease`, and fade the full-screen overlay to `opacity: 0.3` over the same interval. Evidence: `EVID-005`.
- `motion.disclosure`: rotate the expand indicator to `90deg` over `300ms ease`. Evidence: `EVID-005`.
- `motion.guide-card-hover`: transition `filter` over `300ms ease` and end at `brightness(1.1)`. Evidence: `EVID-005`.

# Evidence References

| Evidence ID | Supported Items | Verified Fact | Evidence Artifact | Official Source |
| --- | --- | --- | --- | --- |
| `EVID-001` | Visual Tokens: colors; Color System | Official named core, secondary, and neutral palette values | `dna/evidence/Duolingo/Official_Visual_Evidence_Register.md` | https://design.duolingo.com/identity/color |
| `EVID-002` | Visual Tokens: fonts; Typography Rules | Official type families, weights, leading, casing, and pairing constraints | `dna/evidence/Duolingo/Official_Visual_Evidence_Register.md` | https://design.duolingo.com/identity/typography |
| `EVID-003` | Layout Rules; Spacing System | Official container, breakpoint, gutter, padding, and grid-gap declarations | `dna/evidence/Duolingo/Official_Visual_Evidence_Register.md` | https://design.duolingo.com/main.9d8e47afeb08c26c0f6b.css |
| `EVID-004` | Visual Tokens: radii/border/shadow; Layout Rules; Typography Rules: labels; Color System: guide cards; Component Rules | Official component dimensions, borders, surfaces, shadows, and label styling | `dna/evidence/Duolingo/Official_Visual_Evidence_Register.md` | https://design.duolingo.com/main.9d8e47afeb08c26c0f6b.css |
| `EVID-005` | Visual Tokens: motion; Motion Rules | Official transition durations, transforms, opacity, rotation, and hover filter | `dna/evidence/Duolingo/Official_Visual_Evidence_Register.md` | https://design.duolingo.com/main.9d8e47afeb08c26c0f6b.css |
