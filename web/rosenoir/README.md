# Rose Noir — premium boudoir landing page

A single self-contained file: `index.html`. No build step, no dependencies,
no external fonts/scripts/images/trackers. Just open it or drop it on any
static host.

## Publish it today (pick one — all free, ~2 minutes)

**Fastest, zero account — Netlify Drop**
1. Go to [app.netlify.com/drop](https://app.netlify.com/drop)
2. Drag the `web/rosenoir/` folder onto the page.
3. You get a live `*.netlify.app` URL instantly. The newsletter form
   (**Inner Circle**) is already wired for Netlify Forms — submissions show
   up under Forms in your Netlify dashboard automatically, no code needed.

**Your own domain (e.g. rosenoir.pl)**
- Deploy as above, then in Netlify: Domain settings → add your custom domain
  and point your DNS there. Or use any host (Vercel, Cloudflare Pages,
  GitHub Pages) — it's just one static HTML file.

## What's inside

- **18+ age gate** — remembered per session so it doesn't nag on every visit.
- **Product catalogue** — 8 items in a dense grid with working category filters
  and a live result count.
- **How we ship / Materials** — the discretion and body-safe-materials specs,
  which are the real purchase drivers in this category.
- Newsletter + footer. Dark-only by design.

## Design tokens (client-approved, clean/technical direction)

```
ground    #0B0B0E      surface  #16161A / #1C1C21
border    #26262C      strong   #33333B
text      #EDEDEF      dim      #9A9AA3    faint  #6B6B75
accent    #6E56CF      — interactive affordances only, never decorative
semantic  #3DA95E ok   #C99A2E warn        — kept separate from the accent
type      one sans, tight heading tracking, 16px base, 1.25 scale
radius    6px          shadows  none/minimal
```

An earlier editorial version (Didot display type, wine/rose palette, animated
canvas hero) is in git history if you want to compare:
`git log --oneline -- web/rosenoir/index.html`

## Before you go live — quick checklist

- [ ] Replace the placeholder footer legal links (`Terms of Sale`, `Privacy`,
      `Shipping & Returns`, `18+ Policy`) with real pages. For selling adult
      products in Poland you'll want real Regulamin / Polityka prywatności /
      Zwroty — **DO WERYFIKACJI** with a lawyer.
- [ ] Swap the contact email `hello@rosenoir.pl` for your real inbox.
- [ ] Decide language: current brand copy is English + French (premium,
      timeless). A full **Polish** version can be swapped in quickly if you're
      selling primarily to the PL market — this is an ASSUMPTION worth confirming.
- [ ] This is a brand/landing page, not a checkout yet. When you're ready to
      actually sell, wire it to a store backend (Shopify, Stripe + a catalog,
      or a headless commerce host).
