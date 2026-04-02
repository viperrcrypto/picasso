Run the Picasso /figma command -- analyze a Figma file and extract its design DNA.

Use the Picasso agent to connect to a Figma file via MCP and perform deep design analysis.

PREREQUISITE: Figma MCP server must be configured. See `references/figma-mcp.md` for setup.

## Usage

```
/figma <figma-url>              -- Full analysis of the file/frame
/figma <figma-url> --tokens     -- Extract design tokens only (for DESIGN.md)
/figma <figma-url> --audit      -- Run design quality audit on the Figma file
/figma <figma-url> --compare <live-url>  -- Compare Figma design vs live implementation
```

## Steps

### Default: Full Analysis

1. Parse the Figma URL to extract `file_key` and optional `node_id`
2. Fetch file structure via `mcp__figma__get_file`
3. Fetch styles via `mcp__figma__get_styles`
4. Fetch components via `mcp__figma__get_components`
5. If a specific `node_id` was provided, deep-dive that node via `mcp__figma__get_node`
6. Analyze and report:
   - **Design System Health:** Are styles/components being used consistently?
   - **Token Inventory:** Colors, typography, spacing, shadows, radii
   - **Component Coverage:** What's componentized vs one-off?
   - **Anti-Patterns:** Detached instances, unnamed layers, hardcoded values, missing auto-layout
   - **Picasso Score:** Rate the design system maturity (0-100)

### --tokens: Extract Design Tokens

1. Fetch styles and components from the file
2. Extract and organize:
   - Color palette (converted to OKLCH)
   - Typography scale (font, sizes, weights, line-heights)
   - Spacing rhythm (auto-layout values → base unit)
   - Shadow scale
   - Border radius tokens
   - Breakpoints (from frame widths if available)
3. Output a `.picasso.md` config AND/OR a `DESIGN.md` token file
4. Flag any Picasso anti-patterns: pure gray neutrals, Inter/Roboto defaults, no clear type ratio

### --audit: Design Quality Audit

1. Full file analysis (structure, styles, components)
2. Check against Picasso's anti-pattern list (see `references/anti-patterns.md`)
3. Check against Figma-specific anti-patterns (see `references/figma-mcp.md`)
4. Export key frames as images via `mcp__figma__get_image` for visual review
5. Score and report with severity-ranked findings

### --compare: Figma vs Live Implementation

1. Extract design tokens from Figma via MCP
2. Screenshot the live URL via Playwright (desktop + mobile)
3. Compare tokens vs computed styles:
   - Font family match
   - Color accuracy (ΔE tolerance)
   - Spacing fidelity
   - Component structural parity
4. Report discrepancies ranked by severity (Critical → Low)
5. Generate fix list with exact CSS/code changes needed

## Output Format

```
🎨 FIGMA ANALYSIS: [File Name]

📊 Design System Health: X/100
- Styles used: Y% of elements reference shared styles
- Components: Z components, N instances, M detached
- Auto-layout: X% of frames use auto-layout

🎨 Token Inventory:
- Colors: [palette with OKLCH values]
- Typography: [scale with ratio]
- Spacing: [base unit and scale]
- Shadows: [elevation scale]

⚠️ Issues Found:
1. [severity] [description] — node: [name/id]
2. ...

✅ What's Working:
- [genuine positives about the design system]

📋 Recommended Actions:
1. [prioritized fix/improvement]
2. ...
```

## Fallback

If Figma MCP is not available:
- Tell the user: "Figma MCP server not detected. To enable direct Figma analysis, configure the Figma MCP server in your agent's MCP settings."
- Offer alternative: "You can export the Figma frame as PNG and I'll analyze the screenshot, or share the Figma URL and I'll extract what I can from the embed."
