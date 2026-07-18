# anti-vibecode

Strict house design standards for frontend / UI work — a Claude Code skill that makes generated interfaces stop looking AI-generated.

It enforces one accent colour over a neutral grey/black/white system, no background spotlight gradients, no side accent stripes, mostly-grey buttons with dimmed strokes and an Apple-style raised edge, soft diffuse shadows, generous spacing, a 12-col desktop / 2–4-col mobile grid, 13px desktop / 17px mobile type, 2:1 button padding, full interaction feedback states, and a semantic colour system used only to carry meaning.

## Contents

- `SKILL.md` — the rules and how to apply them
- `references/anti-vibecode.css` — the full token sheet plus component classes (drop-in)
- `references/patterns.md` — drop-in implementations for the behaviours referenced in the skill
- `references/demo.html` — a rendered demo of the system

## Use as a Claude Code skill

Clone into your skills directory:

```bash
git clone https://github.com/C-lb/anti-vibecode.git ~/.claude/skills/anti-vibecode
```

It then activates automatically on frontend/UI work, or on request ("make this anti-vibecode").
