Run the Picasso /score command -- quantified design quality score.

Use the Picasso agent to score the current project's frontend design on a 0-100 scale.

MANDATORY FIRST STEP -- Gather visual evidence before scoring:

**Option A: Live site (localhost or URL)**
1. Take screenshots: `npx playwright screenshot http://localhost:PORT /tmp/picasso-score-desktop.png --viewport-size=1440,900` (and mobile at 375,812)
2. Use the Read tool to VIEW the screenshot files before scoring visual categories
3. If screenshots fail, tell the user and score only code-auditable categories (mark visual categories as "N/A - no screenshot")

**Option B: Figma file (URL provided or MCP available)**
1. Fetch the target frame via `mcp__figma__get_node` for structural data
2. Fetch styles via `mcp__figma__get_styles` for design system analysis
3. Export frame as image via `mcp__figma__get_image` for visual review
4. Score based on both structural data (exact values) and exported image
5. Add bonus category: Design System Health (0-10)

**Option C: Both (Figma + live site)**
1. Do both A and B
2. Add category: Design Fidelity (0-10) -- how closely implementation matches Figma intent

ANTI-HALLUCINATION RULES:
- Visual categories (Typography appearance, Color in practice, Spacing rhythm, Anti-Slop visual check) MUST be scored from screenshots or Figma exports, not code alone
- Code-auditable categories (a11y violations via axe, transition:all grep, prefers-reduced-motion grep) can be scored from code
- When using Figma MCP, structural data (exact spacing, color, typography values) IS factual and can be stated directly
- Never claim "this looks like X" without viewing a screenshot or Figma export

Categories:
- Typography (0-15): font choice, type scale, max-width, line-height, letter-spacing
- Color (0-15): no pure black/gray, OKLCH usage, tinted neutrals, 60-30-10, semantics
- Spacing (0-10): consistent 4px scale, Gestalt grouping
- Accessibility (0-20): axe-core violations, focus-visible, semantic HTML, alt text, reduced-motion
- Motion (0-10): no transition:all, stagger pattern, reduced-motion, no bounce
- Responsive (0-10): works at 375px, touch targets, no horizontal scroll
- Performance (0-10): Lighthouse perf score mapped 0-100 -> 0-10
- Anti-Slop (0-10): deductions for each AI-slop fingerprint detected (-2 each)

Bonus categories (when Figma MCP is available):
- Design System Health (0-10): style usage %, component coverage, naming consistency, auto-layout adoption
- Design Fidelity (0-10, only when both Figma + live): token match, spacing accuracy, structural parity

Output format with visual bars and top fixes for maximum point improvement.
