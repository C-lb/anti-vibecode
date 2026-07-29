---
name: anti-vibecode
description: >-
  Strict house design standards for ANY frontend / UI work, building or restyling components,
  screens, pages, layouts, buttons, cards, navs, forms, charts, and ESPECIALLY mobile-first apps.
  Activate whenever writing or editing UI (HTML/CSS, React/JSX, Tailwind, Vue, Svelte, SwiftUI-like
  web, etc.) or when the user asks for a clean, standardised, premium, "not-AI-generated" or
  "anti-vibecode" look. Enforces one accent colour over a neutral grey/black/white system, no
  background spotlight gradients, no side accent stripes on cards/bars/buttons, mostly-grey buttons
  with dimmed strokes, flat and never shiny, soft diffuse shadows, generous breathing
  room, a 12-col desktop / 2 to 4-col mobile grid, 13px desktop / 17px mobile base type in DM Sans /
  Geist / Plus Jakarta Sans with cap-to-baseline vertical trim, breathable line rhythm where leading
  and tracking tighten as type grows, a capped measure, 2:1 button padding, single-line
  button labels, four button states plus copy/confirm microinteractions, consistent SVG icons
  (Phosphor / Feather, falling back to Ionicons then Remix Icon, with logos from Ionicons then Simple
  Icons or Remix Icon), hover
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
5. **Spacing breathes.** Never tighter than 8px between text blocks, and **no line ever touches the line
   above or below it**. Descenders must clear the next line's caps. Mobile gets *more* vertical space.
6. **Grid is fixed:** 12 columns on desktop, 2 to 4 columns on mobile.
7. **Type is fixed:** 17px base on mobile, 13px base on desktop, sans-serif only, vertical-trimmed.
   Leading and tracking scale inversely with size (1.05 and -0.032em at display, 1.55 and 0 at body),
   one leading per column, measure capped near 68 characters.
8. **Buttons are consistent and flat:** same radius, padding, style, and size per tier. Horizontal padding
   is exactly **2× the vertical**. Small buttons use **10px** radius. Strokes dimmed or removed. No shine,
   no raised specular edge. Labels never wrap, one line always.
9. **Every interactive element has 4 states** (default, hover, clicked, disabled), a hover tooltip, and,
   for important actions, a confirm microinteraction ("Copied!").
10. **Icons are one family**, SVG, stroke-matched, sized to the text's line height. Phosphor or Feather,
    then Ionicons, then Remix Icon. Logos are Ionicons `logo-*`, then Simple Icons or Remix Icon.
11. **No side accents.** No accent stripe, edge bar, or coloured left-border on cards, bars, or buttons.
    The accent is a fill on the one primary action, nothing else.
12. **Copy is plain and human.** Sentence-case eyebrows, never ALL-CAPS. No em dashes. No salesy tone.
13. **Semantic colour carries meaning, never decoration.** Blue = trust/info, green = success/new, yellow
    = warning, red = danger/urgency. Use it for status, validation, chips, and announcement bars only.
14. **Every interaction gets a UI response.** Hover, press, focus ring, loading spinner, success or error
    message. No dead clicks, no silent waits.
15. **Dark mode keeps hierarchy.** Surfaces are *lighter* than the canvas, nothing is pure-white-bright,
    and depth reads through lightness steps plus a stronger shadow on anything sitting above a card.

16. **Nothing collides.** No element overlaps, clips, crops, or hides another unless the overlap is
    deliberate. No fixed heights on text, long strings truncate or wrap, flex and grid children carry
    `min-width:0`, and z-index comes from the `--z-*` ladder, never a made-up 9999.

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
- **Dim or drop strokes.** Prefer a soft shadow over a 1px border. If a hairline is truly needed, keep it
  at 6% white or 8% black or less. Surfaces may carry a faint lit top edge for depth, but **buttons never
  do** (see §4).
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

## 2 · Spacing, layout, and breathability

Breathability has two halves. This section is the space *between* elements. The space *inside* a text
block, leading and tracking, is in §3 under "Line rhythm".

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

### No accidental collisions

Nothing overlaps, clips, crops, or hides anything else unless the overlap is the design. An avatar
stack, a badge notched onto an icon, a scrim over a page: intentional. Everything else is a bug, and it
almost always shows up on the narrow breakpoint, in the other language, or with the long name.

- **Never a fixed height on anything holding text.** Use `min-height` and let it grow. A fixed height
  plus one extra word equals clipped text.
- **Long strings must have an escape.** A single-line label that can run long gets `.truncate`
  (`min-width:0`, `overflow:hidden`, `text-overflow:ellipsis`) and a `title` or tooltip carrying the full
  value. Text that may wrap gets `overflow-wrap:anywhere` so a URL or token cannot push a column open.
- **Flex and grid children need `min-width:0`.** Without it a long child refuses to shrink and shoves its
  neighbour out of the container. This is the single most common source of overlap.
- **Sticky and fixed chrome reserves its own space.** A sticky header needs matching `scroll-padding-top`
  so anchored content does not land underneath it, and fixed bottom bars need bottom padding on the
  scroll container plus `env(safe-area-inset-bottom)` on mobile.
- **One z-index ladder, from tokens.** Base 0, sticky chrome 40, scrim 60, menus and popovers 70, toasts
  80 (`--z-*`). Never invent a `z-index: 9999`. If two things fight, one of them is on the wrong rung.
- **Absolute positioning is opt-in, and clamped.** Anything positioned against a trigger gets clamped
  inside the viewport. Anything positioned inside a card needs that card to be the containing block.
- **Media never breaks its box.** `max-width:100%` on images, video, and SVG, and icons carry `flex:none`
  so they can never be squashed by a long label.
- **Check the three states that break it:** the narrowest supported width, the longest realistic string,
  and text at 200 percent zoom. If nothing collides in those three, the layout holds.

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
### Line rhythm, leading and tracking

Breathability is not only the gaps between blocks (§2), it is the space *inside* a block. Leading and
tracking both scale **inversely with size**: the bigger the type, the tighter the lines and the tighter
the letters. Display text set at body leading looks like a wall, and body text set at display tracking
looks squeezed.

| Role | Leading | Tracking | Token pair |
|------|---------|----------|------------|
| h1 / display | 1.05 | -0.032em | `--lh-display` / `--tr-display` |
| h2 | 1.12 | -0.026em | `--lh-h2` / `--tr-h2` |
| h3 | 1.22 | -0.02em | `--lh-h3` / `--tr-h3` |
| Lead paragraph | 1.45 | -0.01em | `--lh-lead` / `--tr-lead` |
| Body | 1.55 | 0 | `--lh-body` / `--tr-body` |
| Caption, hint, dense UI rows | 1.30 | +0.006em | `--lh-tight` / `--tr-cap` |
| Eyebrow, chip | 1.30 | +0.012em | `--lh-tight` / `--tr-eyebrow` |
| Single-line label (button, tab) | 1 | 0 | `--lh-flat` |

- **Lines never touch.** No descender may come near the cap-height of the line under it, and no two
  stacked text elements may sit closer than `--s2` (8px). This is the most-broken rule in the set,
  because it usually looks fine in the editor and cramped on screen. Check an eyebrow sitting over a
  heading, a label over an input, a card title over its body, and a table cell over the row below.
- **Trimmed text needs the gap put back.** `text-box: trim-both` deliberately removes the font's built-in
  leading, so a trimmed label and a trimmed heading with a 2px gap really are 2px apart and will collide.
  Whenever you use `.trim`, set the stack gap explicitly, `--s2` minimum, `--s3` when the pair carries a
  size jump of more than about 1.5x.
- **One leading per column.** Even spacing means every paragraph in a block shares the same
  line-height and the same gap. Never mix 1.4 and 1.6 in the same column, the ragged rhythm is visible
  even when the reader can't name it.
- **Body leading is the metronome.** 1.55 is the default. Set it once on `body` and let roles override,
  don't retune it per component.
- **Tracking is optical, not decorative.** Negative tracking only ever goes on large text. Body is
  neutral at 0. Small text opens slightly (positive) because tight small type loses legibility.
- **Cap the measure.** Running text stops around 68 characters (`--measure`, class `.measure`). Past
  that the eye loses the line return no matter how good the leading is.
- **Paragraph gaps are one value.** `p + p{ margin-top:var(--s3) }`. Spacing between paragraphs comes
  from the scale, not from blank lines or a bumped line-height.
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
- **Labels stay on one line.** A button never wraps. Keep the word short enough that it fits, and set
  `white-space: nowrap` so it can't break. If a label is too long for its container, shorten the copy or
  widen the button, never let it run onto a second line.
- **Strokes dimmed or removed.** Contrast comes from the surface fill, not an outline. And no accent
  side-stripe (see §1).
- **Buttons are FLAT, never shiny.** Plain surface fill, a dim hairline stroke or none, at most a soft
  outer shadow. No inset specular top edge, no lit rim, no gradient sheen. A raised or glossy treatment
  requires an explicit instruction for that specific element:
  ```css
  background: var(--surface-1);
  border: 1px solid var(--line);              /* dim hairline, or drop it entirely */
  box-shadow: 0 14px 30px -18px rgba(0,0,0,.55);  /* soft diffuse drop, optional */
  /* NOT: inset 0 1px 0 rgba(255,255,255,.10) — that specular edge is the banned "shine" */
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
- **Fallback chain for interface icons:** Phosphor or Feather first. If neither is available, **Ionicons**
  (outline variants, to match the stroke look). If Ionicons doesn't have the glyph either, **Remix Icon**
  (`npm install remixicon --save`, or pull the SVG from remixicon.com, line variants). Pick the highest
  one that covers your set and stay in it.
- **Logos:** **Ionicons `logo-*`** first. When Ionicons has no mark for the brand, use
  **[Simple Icons](https://simpleicons.org/)** (the widest brand set, single-path SVGs) or **Remix Icon**'s
  logo glyphs. Never a webfont, and never a third brand set once one of these covers you.
- **SVG, sized to the text.** `width:1em;height:1em;flex:none` and align via flex so the icon matches the
  label's line height exactly (this pairs with the §3 vertical trim):
  ```css
  .with-icon{ display:inline-flex; align-items:center; gap:.5em; }
  .ico{ width:1em; height:1em; flex:none; }
  ```
### Optical alignment and proportion

Everything on a row shares one optical centre line, and every ornament is sized against the text it
serves. Three failures show up again and again:

- **Everything on a row centres on the same line.** `display:flex; align-items:center` on the row, and
  any inline ornament (icon, spinner, dot, badge) carries `vertical-align:middle` so it cannot ride high
  or sag. If something looks off-centre next to a trimmed label, the ornament's box is wrong, not the text.
- **Size the ornament from the text.** A leading icon is `1em`. A **trailing affordance** (a dropdown
  chevron, a disclosure arrow) is about `0.85em` and one ink step quieter, because it supports the label
  rather than competing with it. A loader beside a caption is roughly `1.15em`, never twice the cap
  height of the words next to it.
- **Give the pairing real air.** An icon and its label sit `0.5em` to `0.6em` apart, a loader and its
  status text `0.6em`, and a label and the control it names never share a line at all. Eyebrows are
  `display:block` for exactly that reason.
- **One size per family.** Every loader in the set is the same box (1.15em), so a row of them reads as
  one system instead of six different widgets.
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
- **Show loading, and pick the right shape.** The loader tells the user *what kind* of wait this is. All
  six live in the CSS file, sized in `em` so they inherit the text size, and coloured by `currentColor`.
  | Loader | Class | Use it for |
  |--------|-------|-----------|
  | Ring spinner | `.spinner`, `.btn.is-loading` | a button or small inline action |
  | Wheel | `.wheel` (one element) or `.wheel-spokes` (eight `<i>`, the native activity look) | a whole view or route settling |
  | Three jumping dots | `.dots` (three `<i>`, staggered 0.14s apart) | something composing a reply, or a queued job running |
  | Indeterminate bar | `.progress` (not `.bar`, which collides with chart classes) | progress across the top of a view or card |
  | Live pulse | `.pulse` | a connected or live state, which is a status, not a wait |
  | Skeleton | `.skeleton` | content whose shape is already known and is arriving |
  Never use two different loaders for the same wait, and never leave a button spinner running after the
  request resolves. Under `prefers-reduced-motion` every one of them drops movement and breathes on
  opacity instead, because a reduced-motion user still needs to see that something is happening.
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

## 10 · Dropdowns, popovers, and card hierarchy

### Menus and popovers

- **Two different things.** A **menu** (`.menu`) is a list of actions. A **popover** (`.popover`) is
  content: a hint, a small form, a summary. Don't dress a menu as a card or stuff paragraphs into one.
- **Overlays sit one surface step up.** Anything floating above a card uses `--surface-2` (or `-3` on a
  tray) plus `--shadow-pop`, which is deeper than the card's own shadow. Same-surface overlays merge
  into the card underneath and read as broken.
- **No hard border.** The deeper shadow is what separates the overlay. A hairline is optional and dim.
- **Menu items are rows, not buttons.** Full-width, `--r-sm` corners, transparent until hover
  (`--surface-3`), left-aligned label, icon at 1em, and any shortcut or count right-aligned in
  `--ink-3` via `.meta`. Labels never wrap.
- **Group with a separator, not a box.** `.menu-sep` is a 1px `--line`. Section headings use
  `.menu-label` in caption size. Destructive actions go last, in `--danger`, via `.is-danger`.
- **The trigger reports its state.** A dropdown trigger is an ordinary `.btn` carrying
  `aria-expanded`, and its chevron rotates 180 degrees when open (`.select`). Escape closes, click
  outside closes, focus returns to the trigger.
- **Position, then clamp.** Place the overlay against its trigger, then clamp it inside the viewport so
  it never hangs off an edge. On mobile a long list becomes a bottom sheet, not a floating menu.

### Card hierarchy

- **One focal card per view.** `.card-lifted` (deeper `--shadow-lg`) marks it. Everything else is a
  standard `.card`, and repeating rows in a list or result grid drop to `.card-flat` with no shadow at
  all. If every card is lifted, nothing is.
- **Hierarchy inside a card comes from type and ink, not from more boxes.** Eyebrow in `--ink-2`, title
  at h3, body at `--ink`, supporting detail at `--ink-3`. That ladder does the work a nested box would.
- **Never nest a padded card in a padded card.** Separate groups with `.card-sep`, a full-bleed 1px
  `--line` that spans the card's padding. An `.inset` panel on `--bg` is allowed **once** per card, and
  only for a genuinely different surface such as code or a preview.
- **Same tier, same rhythm.** Every card of a tier shares one padding value and one child spacing
  value. A row of cards that disagree on padding reads as an accident.
- **Elevation is a ladder, not a pile:** canvas, card, overlay. Three steps is the whole system. If
  something needs a fourth, the layout is wrong.

---

## How to apply this skill

1. **Drop in `references/anti-vibecode.css`** (or port its tokens into the project's system, e.g. Tailwind
   `@theme` or CSS vars). Every colour, radius, space, and type value derives from those tokens.
2. **Build only from the tiers:** `.btn`, `.card`, `.grid`, `.field`, `.banner`, `.badge`, `.toast`, and
   so on. Don't reinvent per element.
3. **Self-check against the non-negotiables** before calling UI work done. If something has a second
   accent, a decorative non-semantic colour, a side accent stripe, a spotlight gradient, a harsh shadow, a
   hard border, a shiny or raised button, a wrapping button label, a nested padded card, an overlay
   sitting on the same surface as the card beneath it, mixed leading in one column, cramped spacing, an off-grid column
   count, the wrong base type size, a mixed icon set, a missing button or input state, an interaction with
   no response, a dark-mode card darker than its background, an over-bright dark surface, an ALL-CAPS
   eyebrow, or em dashes in the copy, fix it first.
4. **Pixel-checking?** Open `references/demo.html` in a browser to compare against the reference look.
