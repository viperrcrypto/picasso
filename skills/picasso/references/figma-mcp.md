# Figma MCP Integration

Reference for using Figma's Model Context Protocol (MCP) server to access design data directly from Figma files. This replaces or supplements Playwright screenshots with structured design information.

## Why Figma MCP > Screenshots

Screenshots show pixels. Figma MCP gives you the **design graph**: layers, tokens, spacing values, component instances, styles, and constraints. This means:

- **Accurate color extraction:** Get exact hex/OKLCH values, not color-picked approximations
- **Real spacing values:** Read auto-layout gaps, padding, and margins as the designer set them
- **Typography facts:** Font family, weight, size, line-height, letter-spacing — all exact
- **Component structure:** See which components are instances, variants, and overrides
- **Design intent:** Understand constraints, auto-layout direction, and responsive behavior

## When to Use Figma MCP vs Playwright

| Scenario | Use Figma MCP | Use Playwright |
|---|---|---|
| Auditing a Figma design before implementation | ✅ | ❌ |
| Extracting design tokens from a Figma file | ✅ | ❌ |
| Reviewing a live deployed site | ❌ | ✅ |
| Comparing Figma design vs live implementation | ✅ + ✅ | ✅ only |
| Generating a DESIGN.md from existing design | ✅ preferred | ✅ fallback |
| Roasting a design that only exists in Figma | ✅ | ❌ |

**Rule:** If the user provides a Figma URL or mentions a Figma file, always prefer Figma MCP. If they provide a live URL or localhost, use Playwright. If both exist, use both for comparison.

## MCP Server Options

Two main Figma MCP implementations:

### Option A: Figma's Official MCP (REST API)
Package: `@anthropic/figma-mcp` or Figma's official MCP server
- Uses Figma REST API with a personal access token
- Read-only: fetch files, nodes, styles, components, export images
- Best for: CI/CD, automated audits, headless analysis
- Tools: `get_file`, `get_node`, `get_styles`, `get_components`, `get_image`

### Option B: Talk to Figma MCP (Live Connection)
Package: `cursor-talk-to-figma-mcp` (localhost:3055)
- Connects to a running Figma instance via plugin
- **Read AND write**: read frames, update text/properties, create shapes, adjust spacing
- Best for: interactive design work, syncing copy, wireframing
- Can snapshot frames and verify changes visually

**Which to use:**
- For Picasso audits/roasts/scoring → Either works. REST API is simpler.
- For `/steal` token extraction → REST API preferred (structured data).
- For `/figma --compare` → REST API for Figma data + Playwright for live site.
- For interactive design updates (changing copy, adjusting spacing) → Talk to Figma MCP.

## Available MCP Tools (REST API)

### `mcp__figma__get_file`
Fetch the full structure of a Figma file.
- Input: `file_key` (extracted from Figma URL)
- Returns: Document tree with pages, frames, components, styles
- Use for: Understanding overall file structure, finding specific frames

### `mcp__figma__get_node`
Fetch a specific node (frame, component, group) by ID.
- Input: `file_key`, `node_id`
- Returns: Full node properties including fills, strokes, effects, layout, children
- Use for: Deep-diving into specific components or sections

### `mcp__figma__get_styles`
Fetch all published styles from the file.
- Input: `file_key`
- Returns: Color styles, text styles, effect styles, grid styles
- Use for: Extracting the design system / token set

### `mcp__figma__get_components`
Fetch all components and component sets.
- Input: `file_key`
- Returns: Component names, descriptions, variant properties
- Use for: Understanding the component library structure

### `mcp__figma__get_image`
Export a node as a rendered image (PNG/SVG/PDF).
- Input: `file_key`, `node_id`, `format`, `scale`
- Returns: Image URL
- Use for: Visual verification when you need to see rendered output alongside data

## Available MCP Tools (Talk to Figma — Live Connection)

When using the Talk to Figma plugin (localhost:3055), additional capabilities:

- **Read frames**: List pages, get frame contents, read text layers
- **Update text**: Change text content in any text layer
- **Update properties**: Modify fills, strokes, effects, spacing
- **Create shapes**: Add rectangles, frames, text nodes
- **Adjust spacing**: Modify auto-layout padding and gaps
- **Snapshot**: Export current frame state for visual verification

**Critical rule:** After any Figma write operation, snapshot the frame and verify it looks correct before proceeding. Figma changes are live — there's no undo via MCP.

## Extracting a Figma File Key

From a Figma URL:
```
https://www.figma.com/design/ABC123xyz/My-Design-File?node-id=0-1
                              ^^^^^^^^^
                              file_key = ABC123xyz
```

From a Figma node URL:
```
https://www.figma.com/design/ABC123xyz/My-Design-File?node-id=123-456
                              ^^^^^^^^^                        ^^^^^^^
                              file_key                         node_id (use 123:456 in API)
```

**Note:** URL uses `-` separator in node-id, but the API expects `:` separator. Convert `123-456` → `123:456`.

## Design Token Extraction Workflow

When extracting design tokens from Figma for DESIGN.md generation:

1. **Get styles** via `get_styles` — these are the designer's intended token set
2. **Get the root frame** via `get_node` — check auto-layout settings for spacing rhythm
3. **Map to Picasso tokens:**
   - Color styles → `--color-*` tokens (convert to OKLCH)
   - Text styles → typography scale (check for consistent ratio)
   - Effect styles → shadow scale, blur values
   - Grid styles → layout columns, gutter, margin

### Spacing Extraction
Read auto-layout `itemSpacing` and `paddingTop/Right/Bottom/Left` from frames. Look for patterns:
- If spacing values are multiples of 4 or 8 → 4px or 8px base unit
- If spacing values follow a ratio → extract the scale

### Color Extraction
Figma stores colors as RGBA (0-1 float). Convert to OKLCH for Picasso:
- Extract fills from color styles
- Group into: primary, secondary, accent, neutral, semantic (success/warning/error)
- Check that neutrals are tinted (not pure gray) — flag if they aren't

### Typography Extraction
From text styles, extract:
- Font family (flag if it's Inter/Roboto/system default — suggest alternatives)
- Size scale (check for consistent modular ratio)
- Weight usage (should have clear hierarchy: regular body, medium labels, semibold headings)
- Line-height (check it's proportional, not fixed px for all sizes)

## Anti-Patterns to Flag

When analyzing Figma files, watch for these common design issues:

1. **Detached instances** — Components used but detached from the library. Design debt.
2. **Inconsistent spacing** — Auto-layout frames with ad-hoc spacing values (17px, 23px, 31px instead of a rhythm).
3. **Unnamed layers** — "Frame 247", "Group 13". Signals hasty work.
4. **Color styles not used** — Hardcoded colors instead of style references.
5. **Text styles not used** — Hardcoded typography instead of style references.
6. **Missing auto-layout** — Frames positioned absolutely instead of using auto-layout. Breaks responsive behavior.
7. **Single-variant components** — Components that should have variants but don't (e.g., a button with only one state).
8. **Enormous frame nesting** — 10+ levels deep. Simplify.

## Copy Sync Workflow

When working with both Figma designs and code, copy (text content) is a common source of drift. Use Figma MCP to keep them synchronized:

1. **Read current copy from Figma** — extract all text layers from target frames
2. **Compare against code** — diff the Figma text against what's rendered in the implementation
3. **Determine source of truth** — typically Figma is upstream (design → code), but if copy was updated in code first, flag it
4. **Sync direction:**
   - Figma newer → update code to match
   - Code newer → flag for designer review (don't auto-write to Figma without confirmation)
5. **Verify** — after syncing, screenshot the live site and compare against Figma export

This is especially useful for:
- Marketing pages where copy changes frequently
- Multi-language sites where translations update in Figma
- Design handoff where developers may use placeholder text

## Comparison Workflow: Figma vs Implementation

When both a Figma file and live implementation exist:

1. Extract tokens from Figma via MCP
2. Screenshot the live site via Playwright
3. Compare:
   - Are the Figma fonts actually loaded on the site?
   - Do spacing values match? (Common drift: Figma says 24px, CSS says 1.5rem which computes to 24px — match. Or CSS says `gap-6` which is 24px — match.)
   - Are colors within ΔE < 3 tolerance? (Figma RGBA → site computed OKLCH)
   - Are components structurally similar or did the dev reinterpret the design?
4. Report discrepancies with severity:
   - **Critical:** Wrong font, wrong primary color, missing sections
   - **High:** Spacing off by >8px, wrong font weights, missing states
   - **Medium:** Minor color drift, slightly different border radius, extra whitespace
   - **Low:** Subpixel differences, minor animation timing differences
