# Typography and line rhythm

Read this before setting any type: choosing a face, a size, a leading, or spacing two text elements
against each other.

## Type basics

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

## Line rhythm, leading and tracking

Breathability is not only the gaps between blocks (`references/layout.md`), it is the space *inside* a block.
Leading and tracking both scale **inversely with size**: the bigger the type, the tighter the lines and
the tighter the letters. Display text set at body leading looks like a wall, and body text set at
display tracking looks squeezed.

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
  text alone. Alignment rules are in `references/components.md`.
