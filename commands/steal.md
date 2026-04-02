Run the Picasso /steal command -- extract design DNA from a URL or Figma file.

Use the Picasso agent to extract the design language from the provided source: $ARGUMENTS

## Input Detection

- **Figma URL** (contains `figma.com/design/` or `figma.com/file/`): Use Figma MCP for precise extraction
- **Live URL** (any other http/https): Use Playwright screenshots + source scraping
- **Both provided**: Use both sources, Figma as ground truth and live site for verification

## Steps: Figma URL (Preferred)

1. Extract `file_key` and optional `node_id` from the Figma URL
2. Fetch styles via `mcp__figma__get_styles` — extract all color styles, text styles, effect styles
3. Fetch target frame via `mcp__figma__get_node` — extract auto-layout spacing, fills, strokes, radii
4. Fetch components via `mcp__figma__get_components` — understand component structure
5. Export frame as image via `mcp__figma__get_image` for visual reference
6. Analyze the extracted data:
   - **Colors:** All fill/stroke colors → convert to OKLCH. Identify primary, secondary, accent, neutral.
   - **Typography:** Font families, size scale, weight distribution, line-height ratios.
   - **Spacing:** Auto-layout itemSpacing and padding → detect base unit (4px? 8px?) and scale.
   - **Shadows:** Effect styles → map to elevation scale.
   - **Radii:** Border radius values → detect pattern (uniform? progressive?).
   - **Layout:** Auto-layout direction, alignment, wrapping → grid/flex patterns.
7. Generate a `.picasso.md` config matching the extracted aesthetic
8. Optionally generate a `DESIGN.md` with the full token set

## Steps: Live URL

1. Screenshot the URL at desktop (1440x900) and mobile (375x812)
2. Fetch the page source and extract: font-family declarations, color values (#hex, rgb, oklch), border-radius values, box-shadow values
3. Analyze the screenshots visually for: layout structure, spacing rhythm, typography hierarchy, color palette, animation style
4. Generate a `.picasso.md` config that matches the extracted aesthetic
5. Optionally generate a `DESIGN.md` with the full token set

## Steps: Both (Figma + Live URL)

1. Run Figma extraction (ground truth for intended design)
2. Run live URL extraction (what actually shipped)
3. Generate tokens from Figma source
4. Note any divergences between design and implementation in the output

If no URL is provided, ask the user for one. Accept both Figma URLs and live URLs.
