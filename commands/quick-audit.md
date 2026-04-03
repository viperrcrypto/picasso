---
name: quick-audit
description: "5-minute fast design audit: 6 binary checks (font, color, layout, spacing, a11y, anti-slop)"
---

# /quick-audit -- 5-Minute Fast Audit

Check exactly 6 things and report pass/fail. Takes 5 minutes, not 30.

## First Step

Take a desktop screenshot: `npx playwright screenshot http://localhost:PORT /tmp/picasso-quick-audit.png --viewport-size=1440,900`
View it with `Read` before assessing Layout, Spacing, or Anti-Slop.

If screenshots fail, check Font/Color/Accessibility from code. Mark Layout/Spacing/Anti-Slop as "SKIPPED (no screenshot)."

## The 6 Checks

### 1. Font
FAIL if primary font is any of: Inter, Roboto, Arial, Open Sans, system-ui, Helvetica.
FAIL if primary font is the framework default (Geist for Next.js, Noto Sans for Material).
PASS if a deliberately chosen, non-default font is used.

### 2. Color
FAIL if neutrals are pure gray (#808080, #ccc, #666, #333 without hue tint).
FAIL if primary color is Tailwind's default indigo/violet/purple family.
PASS if neutrals are tinted and primary is a deliberate brand choice.

### 3. Layout
FAIL if everything is centered on one vertical axis with no spatial variation.
PASS if layout has asymmetry, varied section widths, or intentional spatial hierarchy.
(Requires screenshot to verify.)

### 4. Spacing
FAIL if spacing is uniform everywhere with no gestalt grouping.
PASS if spacing follows a consistent scale AND varies between groups vs. within groups.
(Requires screenshot to verify.)

### 5. Accessibility
FAIL if `outline: none` exists without `:focus-visible` replacement.
FAIL if `prefers-reduced-motion` is not handled.
PASS if focus indicators and motion preferences are both addressed.

### 6. Anti-Slop
FAIL if 3+ of these appear simultaneously:
- Indigo/violet/purple as primary color
- Per-card staggered entrance animations (animation-delay per stat card)
- Rainbow-coded elements (different color per icon/badge/card)
- Gradient blobs on body background
- Uniform identical card grid (all same size/radius/style)
- Icons inside colored circle/rounded-square containers
- hover:-translate-y + shadow-lg on cards
- Colored left-border or top-border per card
- Everything centered on one axis
- Same spacing between every section

PASS if fewer than 3 are present.

## Output

```
## Quick Audit: [project name]

Font:          PASS/FAIL  (details)
Color:         PASS/FAIL  (details)
Layout:        PASS/FAIL  (details)
Spacing:       PASS/FAIL  (details)
Accessibility: PASS/FAIL  (details)
Anti-Slop:     PASS/FAIL  (X fingerprints: list them)

Result: X/6 -- [one-line recommendation]
```
