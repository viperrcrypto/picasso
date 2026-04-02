---
name: mood
description: "Generate a complete design system from a mood word, with a visual preview before committing."
---

# /mood -- Design System from a Word

Generate a complete design system from a mood word or phrase, and show a visual preview before writing any config files.

## Arguments

The mood word: `$ARGUMENTS`

Common moods: cyberpunk, cottage, brutalist, luxury, editorial, playful, corporate, dark-tech, warm-saas, minimal. Also accepts combinations like "brutalist-banking" or "warm-editorial".

If no mood word is provided, ask the user for one.

## Steps

1. Parse the mood word(s) and map to design tokens:
   - Color palette (5-7 values with hex)
   - Font pairing (display + body + mono)
   - Border radius scale
   - Shadow style
   - Motion intensity
   - Spacing density

2. **Generate a visual preview (MANDATORY -- before writing any config files):**
   - Load `references/visual-preview.md` and use the Full Page Mood Preview structure
   - Generate a self-contained HTML page showing a representative layout in the mood's tokens:
     - Nav bar with logo text, links, and CTA button
     - Hero section with large heading, subtitle, and primary button
     - 2-3 sample cards in a grid
     - A form input with button
     - Footer with muted text
   - Load fonts using the Font Mapping table from `references/visual-preview.md`
   - Write to `/tmp/picasso-mood-{word}.html`
   - Open via Playwright MCP, screenshot at 1440x900, view with Read tool
   - Present to user: "This is what '{word}' looks like as a design system. Does this feel right, or should I adjust?"

3. **Wait for confirmation.** Do not write `.picasso.md` or `DESIGN.md` until the user approves the visual direction.

4. After confirmation, generate:
   - `.picasso.md` with the mood's tokens and preferences
   - `DESIGN.md` with the full design system specification

## Rules

- Never write config files before showing the visual preview
- If the user says "adjust" or "not quite", iterate on the tokens and regenerate the preview
- If Playwright MCP is unavailable, write the HTML and tell user the path to open manually
