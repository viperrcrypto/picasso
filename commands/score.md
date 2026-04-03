---
name: score
description: "Quantified 0-100 design quality score with category breakdown."
---

# /score -- Design Quality Score

Score the current project's frontend design on a 0-100 scale.

## First Steps (Mandatory)

1. Take screenshots: `npx playwright screenshot http://localhost:PORT /tmp/picasso-score-desktop.png --viewport-size=1440,900` (and mobile at 375,812)
2. View the screenshots with `Read` before scoring visual categories
3. If screenshots fail, tell the user and score only code-auditable categories

If a Figma URL is provided, run /figma first for ground truth.

## Scoring Categories

### Typography (0-15)
- Font choice: not a banned default AND not a framework default (Geist for Next.js, Roboto for Material). +3
- Type scale: follows a modular ratio, not ad-hoc sizes. +3
- Body text max-width set (65ch or equivalent). +3
- Line-height: 1.5-1.6 body, 1.1-1.2 headings. +3
- Letter-spacing on uppercase text (0.05em+). +3

### Color (0-15)
- No pure black (#000) or pure gray. +3
- OKLCH or HSL usage (not all raw hex). +3
- Neutrals tinted toward palette hue. +3
- 60-30-10 ratio (dominant surface, secondary, accent). +3
- Semantic colors defined (success, warning, error). +3

### Spacing (0-10)
- Consistent scale (4px multiples). +5
- Gestalt grouping: tighter within groups, wider between. +5

### UX Heuristics (0-20)
Score against Nielsen's 10 heuristics (see `references/ux-evaluation.md`), 2 pts each:
- H1: System status (loading states, feedback). +2
- H2: Real world match (clear labels, familiar icons). +2
- H3: User control (undo, escape, back). +2
- H4: Consistency (same styles everywhere). +2
- H5: Error prevention (validation, confirmation). +2
- H6: Recognition (visible labels, persistent nav). +2
- H7: Efficiency (keyboard shortcuts, bulk ops). +2
- H8: Minimal design (clear hierarchy, no clutter). +2
- H9: Error recovery (helpful error messages). +2
- H10: Help (tooltips, onboarding). +2

### Motion (0-10)
- No `transition: all` (grep for it). +3
- Page has choreographed entrance (page-level, NOT per-card stagger). +3
- `prefers-reduced-motion` support exists. +2
- No bounce/elastic easing. +2

### Responsive (0-10)
- Content readable at 375px. +5
- Touch targets >= 44px. +3
- No horizontal scroll on mobile. +2

### Performance (0-10)
- If Lighthouse available: map score 0-100 to 0-10
- If Lighthouse unavailable: check for lazy loading (+3), image dimensions set (+3), font-display: swap (+2), no layout-shifting elements (+2)

### Anti-Slop (0-10)
Start at 10, deduct -2 for each fingerprint found (minimum 0):
- Indigo/violet/purple as primary (unless user's declared brand color)
- Per-card/per-row staggered entrance animations
- Rainbow-coded elements (different color per card/badge/icon)
- Gradient blobs on body background
- Uniform identical card grid (all same size/style)
- Icons inside colored circle containers
- hover:-translate-y + shadow-lg on cards
- Colored left-border or top-border accents on cards

## Output

```
## Picasso Design Score: XX/100

Typography:    [bars]  XX/15
Color:         [bars]  XX/15
Spacing:       [bars]  XX/10
UX Heuristics: [bars]  XX/20
Motion:        [bars]  XX/10
Responsive:    [bars]  XX/10
Performance:   [bars]  XX/10
Anti-Slop:     [bars]  XX/10

Top fixes for +XX points:
1. [specific fix] (+X)
2. [specific fix] (+X)
```
