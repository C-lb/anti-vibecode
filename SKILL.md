---
name: anti-vibecode
description: >-
  Strict house design standards for ANY frontend or UI work: building or restyling components,
  screens, layouts, buttons, cards, navs, forms, charts, and especially mobile-first apps. Activate
  whenever writing or editing UI in any stack (HTML/CSS, React/JSX, Tailwind, Vue, Svelte, Astro), or
  when the user asks for a clean, standardised, premium, "not-AI-generated" or "anti-vibecode" look.
  Use it even when the user doesn't say "anti-vibecode" verbatim, and even for small pieces like a
  single button, an empty state, or a toast.
---

# Anti-Vibecode, house UI standards

The look these rules produce: near-monochrome, low-noise, lots of breathing room, one quiet accent,
and surfaces that feel gently *raised* rather than outlined or glowing. Vibecode is the opposite: many
colours, neon gradients, harsh borders, cramped spacing, drop shadows like black bars. Every rule here
is a *default you must follow* unless the user explicitly overrides it for a specific element.

## How to use this file

The checklist below is the whole system in short form, and it is enough to catch the common failures.
The detail behind each rule lives in `references/`, split so you only load what the task needs. Read the
matching file **before** you write that kind of code, not after. The checklist tells you *what* the rule
is; the reference tells you the exact token, ratio, or recipe, and why the rule exists, which is what
keeps you from applying it mechanically in the wrong place.

| Working on | Read first |
|---|---|
| Colours, shadows, strokes, dark mode | `references/colour.md` |
| Page layout, grid, spacing, anything overlapping or clipping | `references/layout.md` |
| Type: faces, sizes, leading, tracking, two text elements near each other | `references/typography.md` |
| Buttons, icons, menus, popovers, cards, navigation, charts | `references/components.md` |
| Forms, validation, async buttons, toasts, loaders, tooltips, motion | `references/states.md` |
| Behaviours needing JS (copy confirm, long-press menu, swipe transition, tooltip, chart) | `references/patterns.md` |
| The token sheet and component classes to build from | `references/anti-vibecode.css` |
| Seeing the target look | `references/demo.html` (open in a browser) |

For premium glass surfaces that should refract the backdrop, defer to the **[[liquid-glass]]** skill.
For ordinary buttons the lighter "raise" described here is enough.

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

## Copy and voice

This one applies to every string you write, so it stays here rather than in a reference file.

- **No em dashes.** Use commas, periods, colons, or parentheses, or restructure the sentence. Em dashes
  read as machine-written. Their absence reads as human.
- **Give the facts straight.** Don't sell or persuade. Say what a thing is and what it does, plainly. Skip
  hype words like "seamlessly", "effortlessly", "supercharge".
- **Sentence case, plain verbs.** Buttons and labels say exactly what happens. Eyebrows are sentence
  case, never ALL-CAPS.
- **Active voice, one job per element.** A label labels, an example demonstrates. Keep the register
  conversational and human, matched to the audience.

## How to apply this skill

1. **Drop in `references/anti-vibecode.css`** (or port its tokens into the project's system, e.g. Tailwind
   `@theme` or CSS vars). Every colour, radius, space, and type value derives from those tokens.
2. **Read the reference file for what you're building** (table above) before writing the code.
3. **Build only from the tiers:** `.btn`, `.card`, `.grid`, `.field`, `.banner`, `.badge`, `.toast`, and
   so on. Don't reinvent per element.
4. **Self-check against the non-negotiables** before calling UI work done. If something has a second
   accent, a decorative non-semantic colour, a side accent stripe, a spotlight gradient, a harsh shadow, a
   hard border, a shiny or raised button, a wrapping button label, a nested padded card, an overlay
   sitting on the same surface as the card beneath it, mixed leading in one column, cramped spacing, an
   off-grid column count, the wrong base type size, a mixed icon set, a missing button or input state, an
   interaction with no response, a dark-mode card darker than its background, an over-bright dark surface,
   an ALL-CAPS eyebrow, or em dashes in the copy, fix it first.
5. **Pixel-checking?** Open `references/demo.html` in a browser to compare against the reference look.
