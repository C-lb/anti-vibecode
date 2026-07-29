# Colour, contrast, and dark mode

Read this before choosing any colour, writing a shadow, or theming for dark mode.

## Colour and contrast

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
  semantic emphasis as a full tint, a full ring, or a coloured icon. Never as a left-border stripe.
- **No background spotlight or radial "glow" gradients.** The canvas is a flat near-black (or flat
  off-white). Depth comes from *surface elevation* and soft shadow, not light beams.
- **Buttons stay grey.** Use `--surface-1` and `--surface-2`. The accent fill appears at most once per
  screen (the primary CTA). Secondary and tertiary actions are grey or ghost.
- **No side accents.** No accent stripe, edge bar, or coloured left-border on cards, bars (nav, toolbar,
  progress), or buttons. A single chart bar may carry the accent as a data highlight. Everything else
  stays neutral.
- **Dim or drop strokes.** Prefer a soft shadow over a 1px border. If a hairline is truly needed, keep it
  at 6% white or 8% black or less. Surfaces may carry a faint lit top edge for depth, but **buttons never
  do** (see `references/components.md`).
- **Soft shadow recipe**, diffuse and gentle: `box-shadow: 0 14px 34px -18px rgba(0,0,0,.55);` (dark). On
  a *tinted* bg, tint the shadow toward that hue instead of pure black. Big blur plus negative spread
  keeps it soft. Use the deeper `--shadow-pop` for menus, popovers, and floating buttons over a card.

## Dark mode

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
