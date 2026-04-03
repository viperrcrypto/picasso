---
name: preset
description: "Browse and apply curated design presets with visual previews."
---

# /preset -- Apply a Design Preset

Browse or apply a curated design preset with a visual preview before committing.

## Arguments

The preset name: `$ARGUMENTS`

## Steps

### No preset name given (`/preset`)

1. Load all 22 presets from `references/style-presets.md`
2. Generate a **visual preset browser** using the Preset Browser Grid template from `references/visual-preview.md`:
   - 4-column grid of cards, one per preset
   - Each card: preset name (in its heading font), 5-swatch color palette strip, one-line mood description, a sample button in the preset's primary color and radius
   - Card backgrounds use the preset's surface color, text uses its text color
3. Write to `/tmp/picasso-preset-browser.html`
4. Screenshot via Bash: `npx playwright screenshot /tmp/picasso-preset-browser.html /tmp/picasso-preset-browser.png --viewport-size=1200,1600 --full-page`, then view with `Read`
5. Present: "Here are all 22 presets. Which one catches your eye?"
6. Wait for the user to pick

### Preset name given (`/preset bold-signal`)

1. Load the named preset from `references/style-presets.md`
2. Generate a **visual preview** using the Full Page Mood Preview structure from `references/visual-preview.md`:
   - Nav bar, hero, cards, form, footer -- all in the preset's tokens
3. Write to `/tmp/picasso-preset-{name}.html`, screenshot, view with Read
4. Present: "Here's what {name} looks like applied. Want to use it?"
5. After confirmation:
   - Generate `.picasso.md` + `DESIGN.md` from the preset
   - Update CSS variables / Tailwind config to match
   - Update font imports
   - Show a summary of what was applied

## Rules

- Never apply a preset without showing a visual preview first
- If npx playwright is unavailable, write the HTML and give the user the file path
