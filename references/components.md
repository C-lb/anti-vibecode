# Components: buttons, icons, menus, cards, navigation, charts

Read this before building or restyling any of these. Jump to the section you need.

- [Buttons](#buttons)
- [Icons](#icons)
- [Menus and popovers](#menus-and-popovers)
- [Card hierarchy](#card-hierarchy)
- [Navigation](#navigation)
- [Charts](#charts)

## Buttons

- **Consistent per tier:** same corner radius, padding, style, size. Define tiers once (`.btn`,
  `.btn-sm`, `.btn-accent`, `.btn-icon`) and reuse. Don't hand-tune individual buttons.
- **Padding ratio is 2:1.** Horizontal padding equals exactly twice the vertical: `padding: var(--btn-py)
  calc(var(--btn-py)*2)` (e.g. 12px becomes 24px).
- **Small buttons: 10px corner radius.** (Medium 14px, cards 20px, pills 999px.)
- **Labels stay on one line.** A button never wraps. Keep the word short enough that it fits, and set
  `white-space: nowrap` so it can't break. If a label is too long for its container, shorten the copy or
  widen the button, never let it run onto a second line.
- **Strokes dimmed or removed.** Contrast comes from the surface fill, not an outline. And no accent
  side-stripe.
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

## Icons

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
  label's line height exactly (this pairs with the vertical trim in `references/typography.md`):
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

## Menus and popovers

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

## Card hierarchy

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

## Navigation

One set of items, two shapes. Desktop is a horizontal bar at the top (`.nav`), phone is a tab bar in the
thumb zone at the bottom (`.tabbar`). Same items, same order, same states in both, so changing breakpoint
never changes what a control means.

- **The icon fills when the item is pressed or current.** Every nav item carries two icons in the same
  markup, `.ico-line` (outline, at rest) and `.ico-fill` (solid), and the CSS swaps them on `:active` and
  on `[aria-current="page"]`. Fill is the state signal, which is why the nav needs no second colour and no
  underline to say where you are.
- **Current state is `aria-current="page"`, not a class.** The styling hangs off the attribute, so the
  accessible name and the visual state can never disagree.
- **Desktop items are ghost rows.** Transparent at rest with `--ink-2` text, `--surface-2` on hover,
  `--surface-3` when pressed or current. No accent stripe, no bottom underline bar.
- **On a tab bar the icon is the target and the word is a caption for it.** The icon runs large (about
  1.6em) and the label small (about 0.68 of the base), one ink step quieter, because the icon is what gets
  recognised and tapped. Size both off `--fs-base` rather than off each other so the ratio holds.
- **One accent per bar, at most.** It belongs to the single primary action sitting in `.nav-actions`,
  never to a nav item.
- **The bar reserves its own space.** A bottom tab bar adds `env(safe-area-inset-bottom)` and the scroll
  container underneath carries matching bottom padding, or the bar covers the last row of content.
- **Labels truncate, never wrap.** A longer word must not open a column or push a tab out of the grid.
- **A count or status dot** (`.nav-dot`) is the one deliberate overlap here, and it is semantic: red for
  something needing attention, not decoration.

## Charts

- **Always show the value axis.** A bar or line chart needs a visible vertical (y) axis with ticks so
  users can read magnitude. Never leave bars floating without a scale.
- **Few bars, well spaced.** Don't overfill (aim for about 7 to 8 bars or fewer). Generous bar gap.
  Simple and neat beats dense.
- **Keep measurement legible:** axis labels and units stay even while you strip chartjunk. One accent for
  the highlighted bar, the rest grey. Guidance plus a minimal clean example in `references/patterns.md`.
