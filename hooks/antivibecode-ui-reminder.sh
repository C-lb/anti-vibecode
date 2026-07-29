#!/usr/bin/env bash
# PreToolUse (Write|Edit): when the edit targets UI, inject the anti-vibecode house standards
# into context so they're always in front of Claude. Never blocks — pure additionalContext.
# Detection: UI file extensions, or UI markup inside a plain .js/.ts/.mjs/.cjs file.

input=$(cat)
fp=$(printf '%s' "$input" | jq -r '.tool_input.file_path // empty' 2>/dev/null)
[ -z "$fp" ] && exit 0

is_ui=0
case "$fp" in
  *.html|*.htm|*.css|*.scss|*.sass|*.less|*.jsx|*.tsx|*.vue|*.svelte|*.astro) is_ui=1 ;;
  *.js|*.ts|*.mjs|*.cjs)
    content=$(printf '%s' "$input" | jq -r '(.tool_input.content // "") + (.tool_input.new_string // "")' 2>/dev/null)
    if printf '%s' "$content" | grep -Eiq 'className=|class="|<div|<button|<span|<section|<header|<nav|<svg|style=|styled\.|@media|createElement|innerHTML|tailwind'; then
      is_ui=1
    fi
    ;;
esac

[ "$is_ui" -eq 0 ] && exit 0

ctx='UI EDIT DETECTED — house rule: the anti-vibecode standards are always in force. If the anti-vibecode skill is not already active this turn, invoke it now (Skill: anti-vibecode) before continuing. Apply its rules even for small bits (empty/error states, a single button, a list row, a toast): one accent colour over a neutral grey/black/white system; flat canvas, no spotlight/radial gradients; soft diffuse shadows, dim or remove strokes; generous breathing room; sans type (DM Sans / Geist / Plus Jakarta), 13px desktop / 17px mobile; line rhythm scales inversely with size (leading 1.05 and tracking -0.032em at display, 1.55 and 0 at body, 1.30 and +0.006em at caption), one leading per column, running text capped near 68 characters; NOTHING COLLIDES: no line touches the line above or below it (descenders clear the next caps, 8px minimum between stacked text, and text-box trim removes the built-in leading so you MUST add the gap back), no element overlaps or clips another unless deliberate, no fixed heights on text, long strings truncate or wrap, flex/grid children carry min-width:0, z-index from the --z-* ladder never 9999; buttons mostly grey and FLAT (no shine, no inset specular edge) with labels on one line (white-space:nowrap, never wraps), horizontal padding 2x vertical, small radius, four states + focus ring; never nest cards (no double padding); one icon library, stroke-matched (Phosphor or Feather, then Ionicons, then Remix Icon; logos from Ionicons logo-*, then Simple Icons or Remix Icon; never a webfont); everything on a row shares one optical centre (vertical-align:middle on inline ornaments), leading icons 1em, trailing chevrons ~0.85em and one ink step quieter, icon-to-label gap 0.5-0.6em, loaders ~1.15em and all the same size, a label never shares a line with the control it names (eyebrows are display:block); semantic colour for meaning only (blue=info, green=success/new, amber=warning, red=danger); sentence-case eyebrows, never ALL-CAPS; no em dashes, plain factual copy; dark-mode surfaces LIGHTER than the canvas; every interaction gets visible feedback (focus / hover / disabled / loading / success toast / error). Reuse in-system tokens/classes, but that is not a substitute for activating the skill.'

jq -n --arg ctx "$ctx" '{hookSpecificOutput: {hookEventName: "PreToolUse", additionalContext: $ctx}}'
exit 0
