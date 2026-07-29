# Feedback, states, and motion

Read this before wiring any interaction: a form, an async button, a toast, a loader, a tooltip, a
long-press menu, or a page transition.

The governing rule: **every action the user takes gets an immediate, visible response.** No dead clicks,
no spinner-less waits, no form that fails silently. Components live in `references/anti-vibecode.css`.

## Feedback and states

- **Inputs have a full state set:** default, focus (accent ring), filled, **warning** (amber ring + hint),
  **danger** (red ring + hint), **success** (green ring + hint), and disabled. Put a one-line helper or
  validation message under the field in the matching semantic colour with a small icon. Validate inline,
  and the message says what is wrong and how to fix it, not just "invalid".
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

## Interaction and motion

- **Hover tooltip** on buttons and icons (pointer devices): `[data-tip]` to `::after`, hover and focus
  only, hidden on coarse pointers. (See CSS file.) On mobile, discovery comes from the long-press menu.
- **Mobile long-press to context menu.** Holding an item for about 500ms zooms it up slightly, **blurs the
  backdrop**, and pops a right-click-style menu (the iOS haptic-touch feel). Wire `contextmenu` for desktop
  right-click parity. Full implementation in `references/patterns.md`.
- **Mobile swipe page transition.** As the current page swipes out to the right (`translateX: 0 to 100%`),
  the previous page underneath **parallaxes in from the left** (`translateX: -25% to 0`) with an edge dim,
  the iOS back-swipe. Both move right together. Code in `references/patterns.md`.
- **Respect `prefers-reduced-motion`:** drop the zoom and parallax to a plain fade.
