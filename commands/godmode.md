Run the Picasso /godmode command -- the ultimate design transformation pipeline.

Use the Picasso agent (subagent_type: "picasso") to execute the full godmode pipeline:

ANTI-HALLUCINATION RULE: Every phase that makes visual claims MUST gather evidence first. For live sites, take screenshots via `npx playwright screenshot` AND view them with the Read tool. For Figma files, use MCP tools to fetch structural data AND export images. Never claim light/dark mode, color, or layout from code alone.

VISUAL EVIDENCE SOURCES:
- **Live site:** Playwright screenshots (take AND view with Read tool)
- **Figma file:** MCP data (structural facts) + `mcp__figma__get_image` (visual verification)
- **Both available:** Use Figma as design intent, Playwright as implementation reality. Flag gaps.

Phase 1: UNDERSTAND
- Check for .picasso.md config. If not found, run the design interview (ask what we're building, who it's for, aesthetic direction, priorities 1-5 for animations/mobile/a11y/dark mode/performance, constraints).
- Gather context: read all frontend files, find design system, detect component library.
- If a Figma URL is available or Figma MCP is configured, fetch the design file structure and styles as ground truth.

Phase 2: ASSESS
- Take BEFORE screenshots (desktop + mobile) and VIEW them with the Read tool.
- If Figma source exists, fetch design tokens via MCP and compare against implementation.
- Run /score to establish the BEFORE score (0-100 with category breakdown).
- Run /roast for the brutally honest assessment (must be based on screenshots/Figma data, not code guessing).
- Run /audit for full technical audit with severity-ranked findings.
- Run /a11y (axe-core + pa11y + Lighthouse accessibility).
- Run /perf (Lighthouse Core Web Vitals).
- Run /lint-design (find hardcoded colors, spacing violations, font inconsistencies).
- If Figma MCP available: Run /figma --audit for Figma-specific design system health check.

Phase 3: PLAN
- Compile all findings into a prioritized fix list (Critical -> High -> Medium -> Low).
- If Figma source exists, prioritize design-implementation gaps as High severity.
- Present the plan: "Found X issues. Fixing all = score ~Y. Proceed?"
- WAIT for user confirmation before proceeding.

Phase 4: FIX
- Execute fixes in priority order: typography, color, spacing, layout, motion, accessibility, interaction, performance, copy.
- When Figma tokens are available, use them as the source of truth for fixes.
- Re-verify after each category.

Phase 5: VERIFY
- Run /score again for the AFTER score.
- Take AFTER screenshots and VIEW them with the Read tool.
- If Figma source exists, re-compare to check implementation now matches design intent.
- Generate before/after comparison.

Phase 6: REPORT
- Show final score comparison with per-category breakdown.
- Show files modified and issues fixed.
- If Figma comparison was done, show design fidelity score (% match).

If the before score is already 85+, say so and suggest the 3-4 things that would take it to 95+.
