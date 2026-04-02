---
name: variants
description: "Generate 2-3 distinct visual directions with side-by-side visual previews for A/B comparison."
---

# /variants -- Visual Direction Comparison

Generate 2-3 genuinely different aesthetic directions and show them as a side-by-side visual preview.

## Steps

1. Read the current project's design context (`.picasso.md`, `DESIGN.md`, or infer from code)
2. Study the project type, audience, and competitive landscape to inform direction choices
3. Generate 2-3 genuinely different aesthetic directions. NOT slight variations -- each must differ in at least 3 of: font, color palette, layout structure, border-radius philosophy, motion intensity
4. For each direction:
   - Name it (e.g., "Editorial Minimalist", "Dark Terminal", "Warm Organic")
   - List the 5 key design tokens (heading font, body font, accent color, radius, shadow style)
   - Describe what makes it distinctive in 1 sentence
5. **Generate a visual preview (MANDATORY):**
   - Load `references/visual-preview.md` and use the Side-by-Side Direction Comparison template
   - For each direction, render a preview card showing: color palette strip, nav bar, heading, body text, sample card, primary/secondary buttons, input field -- all in that direction's tokens
   - Load fonts using the Font Mapping table from `references/visual-preview.md`
   - Write the comparison HTML to `/tmp/picasso-variants.html`
   - Open via Playwright MCP: `mcp__playwright__browser_navigate` to `file:///tmp/picasso-variants.html`
   - Screenshot at 1440x900 viewport
   - View the screenshot with the Read tool
6. Present the visual comparison to the user: "Here are the directions. Which speaks to you? Pick one, combine elements, or reject all."
7. Also tell the user: "Open `/tmp/picasso-variants.html` in your browser for full resolution."

## Rules

- Each direction must pass the 3-second anti-slop test independently
- No two directions can share the same heading font
- At least one direction must be surprising or unconventional
- Always include one "safe" option and one "bold" option
- Visual preview is MANDATORY, not optional. If Playwright MCP is unavailable, write the HTML file and tell the user the path to open manually.
- Never describe what the directions look like without viewing the screenshot first
