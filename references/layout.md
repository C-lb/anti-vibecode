# Spacing, layout, and collisions

Read this before laying out a page, a grid, or a card, and whenever something looks cramped or
overlapping. The space *inside* a text block (leading, tracking) is in `references/typography.md`.

## Spacing and layout

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

## No accidental collisions

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
