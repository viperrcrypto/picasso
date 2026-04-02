---
name: preview
description: "Generate visual previews of design directions, presets, or current tokens. Shows what options actually look like before committing."
---

# /preview -- Visual Design Preview

Generate and display visual previews of design options.

## Usage

- `/preview` -- Preview current `.picasso.md` tokens as a rendered page
- `/preview <preset-name>` -- Preview a specific style preset (e.g., `/preview bold-signal`)
- `/preview compare <a> <b> [c]` -- Side-by-side comparison of 2-3 presets or directions

## Steps

### `/preview` (current tokens)

1. Read `.picasso.md` from the project root. If not found, tell the user to run `/picasso` first.
2. Extract design tokens: fonts, colors, radius, spacing density.
3. Load `references/visual-preview.md` and use the Full Page Mood Preview template structure.
4. Generate a self-contained HTML file showing a complete page in the current design tokens:
   - Nav bar, hero section, card grid, form, footer
   - All styled with the project's committed tokens
5. Write to `/tmp/picasso-preview.html`
6. Open via Playwright MCP (`mcp__playwright__browser_navigate` to `file:///tmp/picasso-preview.html`)
7. Screenshot at 1440x900, view with Read tool
8. Present to user: "Here's what your current design tokens look like rendered. Open `/tmp/picasso-preview.html` in your browser for full resolution."

### `/preview <preset-name>`

1. Load `references/style-presets.md` and find the named preset.
2. Extract its tokens (colors, fonts, radius, signature element).
3. Generate a Full Page Mood Preview HTML using those tokens.
4. Write, screenshot, view, present (same as above).

### `/preview compare <a> <b> [c]`

1. Load `references/style-presets.md` and find each named preset.
2. Load `references/visual-preview.md` and use the Side-by-Side Direction Comparison template.
3. Generate a comparison HTML with 2-3 direction cards side by side.
4. Write to `/tmp/picasso-preview-compare.html`
5. Screenshot at 1440x900 (wide enough for side-by-side), view with Read.
6. Present: "Here are the directions compared. Which speaks to you?"

## Rules

- Always load font URLs from the Font Mapping table in `references/visual-preview.md`
- If Playwright MCP is unavailable, write the file and tell the user the path to open manually
- Never describe what the preview looks like without viewing the screenshot first
- The HTML must be fully self-contained (inline styles, external font imports only)
