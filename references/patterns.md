# Anti-Vibecode — interaction patterns

Drop-in implementations for the behaviours referenced in `SKILL.md`. All pair with the tokens in
`anti-vibecode.css`. Everything here respects `prefers-reduced-motion` (the CSS file already neutralises
transitions under it; the JS checks it where motion is the whole point).

---

## 1 · Copy / confirm microinteraction ("Copied!")

Important actions confirm *inline* — the label flips to "Copied!" with a check for ~1.2s, then reverts.
Markup: `<button class="btn btn-sm" data-copy="hello@nexus.app"><svg class="ico">…</svg><span class="label">Copy email</span></button>`

```js
document.querySelectorAll('[data-copy]').forEach(btn => {
  const label = btn.querySelector('.label');
  const original = label.textContent;
  btn.addEventListener('click', async () => {
    try { await navigator.clipboard.writeText(btn.dataset.copy); } catch {}
    btn.classList.add('is-copied');           // .is-copied turns label/icon --ok (see css)
    label.textContent = 'Copied!';
    if (navigator.vibrate) navigator.vibrate(6);
    clearTimeout(btn._t);
    btn._t = setTimeout(() => { btn.classList.remove('is-copied'); label.textContent = original; }, 1200);
  });
});
```

Same shape works for Save → "Saved!", Add → "Added!". Keep the success word in the *same tense* as the
action verb (Publish → Published).

---

## 2 · Mobile long-press → context menu (zoom + blurred backdrop)

Hold ~500ms: the item lifts slightly, the backdrop blurs, an iOS-style menu pops. Tap outside to dismiss.
Wires `contextmenu` too so desktop right-click gets the same menu.

```css
.av-peek-backdrop{ position:fixed; inset:0; z-index:90; background:rgba(0,0,0,.35);
  -webkit-backdrop-filter:blur(16px); backdrop-filter:blur(16px);
  opacity:0; transition:opacity .22s ease; }
.av-peek-backdrop.show{ opacity:1; }
.av-peeking{ position:relative; z-index:95;
  transform:scale(1.04); transition:transform .22s cubic-bezier(.2,.7,.2,1); }
.av-menu{ position:fixed; z-index:96; min-width:208px; padding:6px;
  border-radius:16px; background:var(--surface-2); box-shadow:var(--shadow-lg);
  transform-origin:top left; opacity:0; transform:scale(.92);
  transition:opacity .18s ease, transform .18s ease; }
.av-menu.show{ opacity:1; transform:scale(1); }
.av-menu button{ display:flex; align-items:center; gap:.6em; width:100%;
  padding:11px 14px; border:0; border-radius:11px; background:transparent;
  color:var(--ink); font:500 var(--t-body)/1 var(--font); text-align:left; cursor:pointer; }
.av-menu button:hover{ background:var(--surface-3); }
.av-menu button.danger{ color:var(--danger); }
```

```js
function enableLongPress(el, actions){            // actions: [{label, icon?, danger?, onSelect}]
  const reduce = matchMedia('(prefers-reduced-motion:reduce)').matches;
  let timer, startY = 0;

  function open(x, y){
    if (navigator.vibrate) navigator.vibrate(8);
    const backdrop = Object.assign(document.createElement('div'), { className:'av-peek-backdrop' });
    const menu = Object.assign(document.createElement('div'), { className:'av-menu' });
    actions.forEach(a => {
      const b = document.createElement('button');
      if (a.danger) b.classList.add('danger');
      b.innerHTML = (a.icon || '') + `<span>${a.label}</span>`;
      b.onclick = () => { a.onSelect?.(); close(); };
      menu.append(b);
    });
    document.body.append(backdrop, menu);
    if (!reduce) el.classList.add('av-peeking');

    const mw = 220, mh = actions.length * 46 + 12;          // clamp inside viewport
    menu.style.left = Math.min(x, innerWidth  - mw - 12) + 'px';
    menu.style.top  = Math.min(y, innerHeight - mh - 12) + 'px';
    requestAnimationFrame(() => { backdrop.classList.add('show'); menu.classList.add('show'); });

    function close(){
      backdrop.classList.remove('show'); menu.classList.remove('show');
      el.classList.remove('av-peeking');
      setTimeout(() => { backdrop.remove(); menu.remove(); }, 200);
    }
    backdrop.onclick = close;
  }

  el.addEventListener('touchstart', e => {
    startY = e.touches[0].clientY;
    timer = setTimeout(() => open(e.touches[0].clientX, e.touches[0].clientY), 500);
  }, { passive:true });
  el.addEventListener('touchmove', e => {
    if (Math.abs(e.touches[0].clientY - startY) > 10) clearTimeout(timer);   // scrolling, not pressing
  }, { passive:true });
  el.addEventListener('touchend', () => clearTimeout(timer));
  el.addEventListener('contextmenu', e => { e.preventDefault(); open(e.clientX, e.clientY); });
}

// enableLongPress(card, [
//   { label:'Share',  icon:'<svg class="ico">…</svg>', onSelect:()=>… },
//   { label:'Delete', danger:true, onSelect:()=>… },
// ]);
```

---

## 3 · Mobile swipe page transition (iOS back-swipe parallax)

Swipe from the left edge: the top page follows the finger out to the right (`0 → 100%`) while the page
beneath parallaxes in from `−25% → 0` with an edge dim. Both travel right together. Past 40% it commits,
else it snaps back.

```css
.av-pages{ position:relative; overflow:hidden; height:100%; }
.av-page{ position:absolute; inset:0; background:var(--bg); will-change:transform;
  transition:transform .34s cubic-bezier(.32,.72,0,1), filter .34s ease; }
.av-page.under{ transform:translateX(-25%); filter:brightness(.72); }   /* parked beneath */
.av-page.leaving{ box-shadow:-14px 0 34px -12px rgba(0,0,0,.5); }        /* edge shadow on top page */
```

```js
function enableBackSwipe(container){
  let top, under, startX = 0, dx = 0, dragging = false;

  container.addEventListener('touchstart', e => {
    if (e.touches[0].clientX > 24) return;                       // edge gesture only
    const pages = [...container.querySelectorAll('.av-page')];
    top = pages.at(-1); under = pages.at(-2);
    if (!under) return;
    dragging = true; startX = e.touches[0].clientX;
    [top, under].forEach(p => p.style.transition = 'none');
    top.classList.add('leaving'); under.classList.add('under');
  }, { passive:true });

  container.addEventListener('touchmove', e => {
    if (!dragging) return;
    dx = Math.max(0, e.touches[0].clientX - startX);
    const w = container.clientWidth;
    top.style.transform   = `translateX(${dx}px)`;
    under.style.transform = `translateX(${-25 + 25 * (dx / w)}%)`;   // -25% → 0 in lockstep
  }, { passive:true });

  container.addEventListener('touchend', () => {
    if (!dragging) return; dragging = false;
    const w = container.clientWidth;
    [top, under].forEach(p => p.style.transition = '');
    if (dx > w * 0.4){                                            // committed → pop
      top.style.transform = 'translateX(100%)'; under.style.transform = 'translateX(0)';
      top.addEventListener('transitionend', () => top.remove(), { once:true });
    } else {                                                     // snap back
      top.style.transform = 'translateX(0)'; under.style.transform = 'translateX(-25%)';
      setTimeout(() => { top.classList.remove('leaving'); under.classList.remove('under'); under.style.transform=''; }, 340);
    }
  });
}
```

---

## 4 · Tooltip

Pure CSS, already in `anti-vibecode.css` (`[data-tip]` → `::after`, `@media (hover:hover)` so it never
fires on touch). Usage: `<button class="btn btn-icon" data-tip="Add item">…</button>`. On mobile, the
long-press menu (above) is the discovery affordance instead.

---

## 5 · Charts — clean, single-axis, few bars

Rules: **always render the vertical (value) axis** with a few labelled ticks; **about 7 to 8 bars or
fewer** with a generous gap; one accent bar for the highlighted datum, the rest grey; keep units on the
axis; strip everything else (no 3D, no gradients-per-bar, no legend if labels suffice). Minimal example:

```html
<svg viewBox="0 0 320 180" class="av-chart" role="img" aria-label="Weekly active users">
  <!-- y-axis ticks + gridlines -->
  <g font-size="9" fill="var(--ink-3)" font-family="var(--font)">
    <line x1="34" y1="10"  x2="34" y2="150" stroke="var(--line)"/>           <!-- axis -->
    <g text-anchor="end">
      <text x="28" y="14">600</text><line x1="34" y1="10"  x2="312" y2="10"  stroke="var(--line)"/>
      <text x="28" y="84">300</text><line x1="34" y1="80"  x2="312" y2="80"  stroke="var(--line)"/>
      <text x="28" y="154">0</text>  <line x1="34" y1="150" x2="312" y2="150" stroke="var(--line)"/>
    </g>
  </g>
  <!-- bars: 6, last one highlighted in accent -->
  <g>
    <rect x="50"  y="96"  width="28" height="54"  rx="6" fill="var(--surface-3)"/>
    <rect x="92"  y="70"  width="28" height="80"  rx="6" fill="var(--surface-3)"/>
    <rect x="134" y="84"  width="28" height="66"  rx="6" fill="var(--surface-3)"/>
    <rect x="176" y="52"  width="28" height="98"  rx="6" fill="var(--surface-3)"/>
    <rect x="218" y="40"  width="28" height="110" rx="6" fill="var(--surface-3)"/>
    <rect x="260" y="22"  width="28" height="128" rx="6" fill="var(--accent)"/>    <!-- the one accent -->
  </g>
  <g font-size="9" fill="var(--ink-3)" text-anchor="middle" font-family="var(--font)">
    <text x="64" y="166">Mon</text><text x="106" y="166">Tue</text><text x="148" y="166">Wed</text>
    <text x="190" y="166">Thu</text><text x="232" y="166">Fri</text><text x="274" y="166">Sat</text>
  </g>
</svg>
```

For real data reach for a lib (Recharts, Chart.js, visx) but hold it to these same rules: visible value
axis, few bars, generous gap, single accent, no chartjunk.
