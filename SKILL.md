---
name: anti-vibecode
description: >-
  Strict house design standards for ANY frontend / UI work, building or restyling components,
  screens, pages, layouts, buttons, cards, navs, forms, charts, and ESPECIALLY mobile-first apps.
  Activate whenever writing or editing UI (HTML/CSS, React/JSX, Tailwind, Vue, Svelte, SwiftUI-like
  web, etc.) or when the user asks for a clean, standardised, premium, "not-AI-generated" or
  "anti-vibecode" look. Enforces one accent colour over a neutral grey/black/white system, no
  background spotlight gradients, no side accent stripes on cards/bars/buttons, mostly-grey buttons
  with dimmed strokes and an Apple-style raised edge glow, soft diffuse shadows, generous breathing
  room, a 12-col desktop / 2 to 4-col mobile grid, 13px desktop / 17px mobile base type in DM Sans /
  Geist / Plus Jakarta Sans with cap-to-baseline vertical trim, 2:1 button padding, four button
  states plus copy/confirm microinteractions, consistent SVG icons (Phosphor / Feather), hover
  tooltips, mobile long-press context menus, iOS-style swipe page transitions, clean single-axis bar
  charts, a semantic colour system (blue for trust/info, green for success/new, yellow for warning,
  red for danger) used only to carry meaning, full input and button feedback states with toasts and
  spinners so every interaction gets a response, dark-mode surfaces kept lighter than the canvas,
  sentence-case (never ALL-CAPS) eyebrows, and plain human copy with no em dashes. Applies to BOTH
  desktop and mobile. Use even when the user doesn't say "anti-vibecode" verbatim.
---

# Anti-Vibecode, house UI standards

The look these rules produce: near-monochrome, low-noise, lots of breathing room, one quiet accent,
and surfaces that feel gently *raised* rather than outlined or glowing. Vibecode is the opposite: many
colours, neon gradients, harsh borders, cramped spacing, drop shadows like black bars. Every rule below
is a *default you must follow* unless the user explicitly overrides it for a specific element.

Reference material: `references/anti-vibecode.css` (the full token sheet plus component classes, copy it
in and build from it), `references/patterns.md` (the JS-driven behaviours: copy microinteraction,
long-press menu, swipe transition, tooltips, charts), `references/demo.html` (open it to *see* the
target look). For premium glass surfaces that should refract the backdrop, defer to the
**[[liquid-glass]]** skill. For ordinary buttons the lighter "raise" below is enough.

## The non-negotiables (checklist)

1. **One accent for identity.** Everything structural is neutral grey, black, or white. The only other
   colours allowed are the semantic set, and only to carry meaning (see #13). No decorative second hue.
2. **No spotlight gradients** on backgrounds. Flat canvas. (A surface tint of 2% or less is fine.)
3. **Buttons are grey by default.** Accent fill is reserved for the *single* primary action per view.
4. **Shadows are soft and diffuse:** low opacity, large blur, negative spread, tinted to the bg. Never a
   hard `0 2px 4px rgba(0,0,0,.6)` slab. Go *stronger* for anything raised above a card (see #15).
5. **Spacing breathes.** Never tighter than 8px between text blocks. Mobile gets *more* vertical space.
6. **Grid is fixed:** 12 columns on desktop, 2 to 4 columns on mobile.
7. **Type is fixed:** 17px base on mobile, 13px base on desktop, sans-serif only, vertical-trimmed.
8. **Buttons are consistent:** same radius, padding, style, and size per tier. Horizontal padding is
   exactly **2× the vertical**. Small buttons use **10px** radius. Strokes dimmed or removed.
9. **Every interactive element has 4 states** (default, hover, clicked, disabled), a hover tooltip, and,
   for important actions, a confirm microinteraction ("Copied!").
10. **Icons are one family**, SVG, stroke-matched, sized to the text's line height.
11. **No side accents.** No accent stripe, edge bar, or coloured left-border on cards, bars, or buttons.
    The accent is a fill on the one primary action, nothing else.
12. **Copy is plain and human.** Sentence-case eyebrows, never ALL-CAPS. No em dashes. No salesy tone.
13. **Semantic colour carries meaning, never decoration.** Blue = trust/info, green = success/new, yellow
    = warning, red = danger/urgency. Use it for status, validation, chips, and announcement bars only.
14. **Every interaction gets a UI response.** Hover, press, focus ring, loading spinner, success or error
    message. No dead clicks, no silent waits.
15. **Dark mode keeps hierarchy.** Surfaces are *lighter* than the canvas, nothing is pure-white-bright,
    and depth reads through lightness steps plus a stronger shadow on anything sitting above a card.

> When in doubt: **remove an accessory.** Less visual noise is the better design.

---

## 1 · Colour and contrast

- **Exactly one accent token** (`--accent`). Swap its hue per project. Apart from the accent and the
  semantic set below, nothing gets colour.
- **Semantic colour, meaning only.** Four hues, each with a fixed job. Apart from the accent, a colour
  only appears when it *signals* something:
  | Hue | Token | Means | Typical use |
  |-----|-------|-------|-------------|
  | Blue | `--info` | trust, information | info banners, "Beta" chips, neutral notices |
  | Green | `--success` | success, new | success toasts, "New" chips, completed states |
  | Yellow/amber | `--warn` | warning | input warnings, caution banners |
  | Red | `--danger` | danger, urgency | errors, destructive actions, failed validation |
  Each comes as a triple: the base (text/icon), `-soft` (tint background), `-line` (hairline ring). Apply
  semantic emphasis as a full tint, a full ring, or a coloured icon. Never as a left-border stripe (#11).
- **No background spotlight or radial "glow" gradients.** The canvas is a flat near-black (or flat
  off-white). Depth comes from *surface elevation* and soft shadow, not light beams.
- **Buttons stay grey.** Use `--surface-1` and `--surface-2`. The accent fill appears at most once per
  screen (the primary CTA). Secondary and tertiary actions are grey or ghost.
- **No side accents.** No accent stripe, edge bar, or coloured left-border on cards, bars (nav, toolbar,
  progress), or buttons. A single chart bar may carry the accent as a data highlight. Everything else
  stays neutral.
- **Dim or drop strokes.** Prefer a *raised* surface (light top edge plus soft shadow) over a 1px border.
  If a hairline is truly needed, keep it at 6% white or 8% black or less.
- **Soft shadow recipe**, diffuse and gentle: `box-shadow: 0 14px 34px -18px rgba(0,0,0,.55);` (dark). On
  a *tinted* bg, tint the shadow toward that hue instead of pure black. Big blur plus negative spread
  keeps it soft. Use the deeper `--shadow-pop` for menus, popovers, and floating buttons over a card.

### Dark mode

- **Surfaces are lighter than the canvas.** Elevation reads as *more light*, not more shadow. Bg is the
  darkest layer; `--surface-1` (cards) sits clearly above it, `--surface-2`/`--surface-3` above that. A
  card must never be darker than or equal to its background.
- **Don't over-brighten.** No pure `#fff` body text (use `--ink` near `#f4f4f5`), no large pure-white
  fills, and keep semantic hues slightly muted rather than neon. Pure yellow is illegible on dark, so the
  warning token is an amber.
- **Hierarchy through lightness steps.** Separate primary, secondary, and muted text with the `--ink`,
  `--ink-2`, `--ink-3` ramp, not by making one element glaringly bright.
- **Stronger shadow above cards.** A button or popover sitting on an already-raised card needs `--shadow-pop`
  (deeper than the card's own shadow) so it separates instead of merging.

## 2 · Spacing and layout

- **4px spacing scale** (`--s1` to `--s8`). Pick from the scale. Don't invent one-off px values.
- **Generous, not tight.** Minimum gap between stacked text blocks is `--s2` (8px). Section gaps are
  `--s6` to `--s7`. White space is a feature.
- **Grid, desktop 12 columns, mobile 2 to 4 columns:**
  ```css
  .grid{ display:grid; gap:var(--gap); grid-template-columns:repeat(4,1fr); } /* mobile: 4 */
  @media (max-width:420px){ .grid{ grid-template-columns:repeat(2,1fr); } }   /* small phones: 2 */
  @media (min-width:1024px){ .grid{ grid-template-columns:repeat(12,1fr); } } /* desktop: 12 */
  ```
- **Mobile gets more vertical air.** Increase row and section vertical spacing on small screens so text
  can breathe under the thumb. Don't just shrink the desktop layout.
- **Cards: single padding, no nesting.** A card has ONE level of padding. Never put a padded card inside
  another padded card (double padding). Children space themselves with `gap` or margin, not nested boxes.
- **Consistent card rhythm.** Same internal padding and same child spacing across every card of a tier.

## 3 · Typography

- **Sans-serif only**, from this set: **DM Sans, Plus Jakarta Sans, Geist, Axiforma** (Axiforma is
  commercial, fall back to the others if unlicensed). No serif. No system-ui as the brand face.
- **Base size: 17px mobile, 13px desktop.** Mobile-first: `--fs-base:17px`, then
  `@media (min-width:1024px){ :root{ --fs-base:13px } }`. The whole type scale is multipliers off
  `--fs-base`, so it holds on both.
- **Vertical trim, cap-height to baseline**, for pixel-perfect vertical control. This is what makes text
  sit *exactly* centred against icons and inside buttons:
  ```css
  .trim{ text-box: trim-both cap alphabetic; }   /* modern shorthand */
  /* longhand fallback: text-box-trim: trim-both; text-box-edge: cap alphabetic; */
  ```
  Apply it to headings, button labels, and any text you're aligning an icon to. Where unsupported, tune
  `line-height` manually to compensate.
- **Eyebrows are sentence case, never ALL-CAPS.** Set a kicker or eyebrow apart by size, weight, colour,
  or letter-spacing, not by shouting in full capitals. Sentence case or title case only.
- **Lead with icons to lower reading burden.** A short label plus a meaningful icon parses faster than
  text alone. See §5 for alignment.

## 4 · Buttons

- **Consistent per tier:** same corner radius, padding, style, size. Define tiers once (`.btn`,
  `.btn-sm`, `.btn-accent`, `.btn-icon`) and reuse. Don't hand-tune individual buttons.
- **Padding ratio is 2:1.** Horizontal padding equals exactly twice the vertical: `padding: var(--btn-py)
  calc(var(--btn-py)*2)` (e.g. 12px becomes 24px).
- **Small buttons: 10px corner radius.** (Medium 14px, cards 20px, pills 999px.)
- **Strokes dimmed or removed.** Contrast comes from the raised surface, not an outline. And no accent
  side-stripe (see §1).
- **Apple-style raised edge glow** (the reference look): grey fill a notch above the canvas, a *lit top
  edge* for the raise, soft drop shadow, no hard border:
  ```css
  background: var(--surface-1);
  box-shadow:
    inset 0 1px 0 rgba(255,255,255,.10),   /* top specular edge = the raise */
    inset 0 -1px 0 rgba(0,0,0,.45),         /* base shade */
    0 14px 30px -18px rgba(0,0,0,.55);      /* soft diffuse drop */
  ```
- **Five states, always:** `default`, `:hover`, `:active` (clicked), `:disabled`, plus `:focus-visible`
  (accent ring) for keyboards. Async actions add a sixth, `.is-loading` (spinner, disabled, label held).
  No interactive element ships with fewer. Full recipe in the CSS file.
- **Microinteraction on important actions.** Copy-email, copy-link, and save buttons confirm inline:
  swap the label to **"Copied!"** with a check for about 1.2s, then revert. JS in `references/patterns.md`.

## 5 · Icons

- **One library, one style.** Prefer **Phosphor** or **Feather** (consistent stroke width and corner
  rounding). Keep stroke width uniform (Feather is 2, Phosphor is "regular"). Don't mix a thin set with a
  thick set inside one cluster.
- **SVG, sized to the text.** `width:1em;height:1em;flex:none` and align via flex so the icon matches the
  label's line height exactly (this pairs with the §3 vertical trim):
  ```css
  .with-icon{ display:inline-flex; align-items:center; gap:.5em; }
  .ico{ width:1em; height:1em; flex:none; }
  ```
- **Match fill, size, and style** across an icon group. A row of icons should look stamped from one die.
- **Different icon styles are OK only when visually separated**, for example a filled brand glyph far from
  an outline nav set. Never cluster mismatched styles together.

## 6 · Interaction and motion

- **Hover tooltip** on buttons and icons (pointer devices): `[data-tip]` to `::after`, hover and focus
  only, hidden on coarse pointers. (See CSS file.) On mobile, discovery comes from the long-press menu.
- **Mobile long-press to context menu.** Holding an item for about 500ms zooms it up slightly, **blurs the
  backdrop**, and pops a right-click-style menu (the iOS haptic-touch feel). Wire `contextmenu` for desktop
  right-click parity. Full implementation in `references/patterns.md`.
- **Mobile swipe page transition.** As the current page swipes out to the right (`translateX: 0 to 100%`),
  the previous page underneath **parallaxes in from the left** (`translateX: -25% to 0`) with an edge dim,
  the iOS back-swipe. Both move right together. Code in `references/patterns.md`.
- **Respect `prefers-reduced-motion`:** drop the zoom and parallax to a plain fade.

## 7 · Feedback and states

The governing rule: **every action the user takes gets an immediate, visible response.** No dead clicks,
no spinner-less waits, no form that fails silently. Components live in `references/anti-vibecode.css`.

- **Inputs have a full state set:** default, focus (accent ring), filled, **warning** (amber ring + hint),
  **danger** (red ring + hint), **success** (green ring + hint), and disabled. Put a one-line helper or
  validation message under the field in the matching semantic colour with a small icon. Validate inline,
  and the message says what is wrong and how to fix it (see §9), not just "invalid".
- **Buttons report async work.** On submit, switch to `.is-loading` (spinner in place of the label,
  disabled), then resolve to a success or error response. Never leave the user unsure if the click landed.
- **Confirm completion.** Show a success message when an action finishes (green toast or inline check),
  an error message when it fails (red), a warning (amber) or info (blue) when that is the meaning. Toasts
  are a neutral surface with a coloured icon, so they read without flooding the screen with colour.
  Auto-dismiss success after a few seconds, keep errors until acknowledged.
- **Show loading.** A spinner for actions, skeletons for content that is still arriving. The UI never
  freezes with no indicator.
- **Announcement bars** are full-width, a semantic soft tint plus a hairline ring plus an icon and text,
  dismissible. Colour by meaning: a new-feature notice is green or blue, an outage is red. No left stripe.
- **Chips and badges** are small status pills using the semantic tints: "New" is green, "Beta" is blue,
  "Deprecated" is amber, a failing count is red. Keep them quiet, they label, they don't decorate.

## 8 · Charts

- **Always show the value axis.** A bar or line chart needs a visible vertical (y) axis with ticks so
  users can read magnitude. Never leave bars floating without a scale.
- **Few bars, well spaced.** Don't overfill (aim for about 7 to 8 bars or fewer). Generous bar gap.
  Simple and neat beats dense.
- **Keep measurement legible:** axis labels and units stay even while you strip chartjunk. One accent for
  the highlighted bar, the rest grey. Guidance plus a minimal clean example in `references/patterns.md`.

## 9 · Copy and voice

- **No em dashes.** Use commas, periods, colons, or parentheses, or restructure the sentence. Em dashes
  read as machine-written. Their absence reads as human.
- **Give the facts straight.** Don't sell or persuade. Say what a thing is and what it does, plainly. Skip
  hype words like "seamlessly", "effortlessly", "supercharge".
- **Sentence case, plain verbs.** Buttons and labels say exactly what happens (see §4). Eyebrows are
  sentence case, never ALL-CAPS (see §3).
- **Active voice, one job per element.** A label labels, an example demonstrates. Keep the register
  conversational and human, matched to the audience.

---

## How to apply this skill

1. **Drop in `references/anti-vibecode.css`** (or port its tokens into the project's system, e.g. Tailwind
   `@theme` or CSS vars). Every colour, radius, space, and type value derives from those tokens.
2. **Build only from the tiers:** `.btn`, `.card`, `.grid`, `.field`, `.banner`, `.badge`, `.toast`, and
   so on. Don't reinvent per element.
3. **Self-check against the non-negotiables** before calling UI work done. If something has a second
   accent, a decorative non-semantic colour, a side accent stripe, a spotlight gradient, a harsh shadow, a
   hard border, cramped spacing, an off-grid column count, the wrong base type size, a missing button or
   input state, an interaction with no response, a dark-mode card darker than its background, an
   over-bright dark surface, an ALL-CAPS eyebrow, or em dashes in the copy, fix it first.
4. **Pixel-checking?** Open `references/demo.html` in a browser to compare against the reference look.
