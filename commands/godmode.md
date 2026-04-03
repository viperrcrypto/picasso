Run the Picasso /godmode command -- the ultimate design transformation pipeline.

Use the Picasso agent (subagent_type: "picasso") to execute the full godmode pipeline:

ANTI-HALLUCINATION RULE: Every phase that makes visual claims MUST gather evidence first. Take screenshots via `npx playwright screenshot` AND view them with the Read tool. Never claim light/dark mode, color, or layout from code alone.

If a Figma URL is provided, run /figma first to extract design tokens, then proceed with those as ground truth.

Phase 1: UNDERSTAND
- Check for .picasso.md config. If not found, run the design interview (ask what we're building, who it's for, aesthetic direction, priorities 1-5 for animations/mobile/a11y/dark mode/performance, constraints).
- Gather context: read all frontend files, find design system, detect component library.

Phase 2: ASSESS
- Take BEFORE screenshots (desktop + mobile) and VIEW them with the Read tool.
- Run /score to establish the BEFORE score (0-100 with category breakdown).
- Run /roast for the brutally honest assessment (must be based on screenshots, not code guessing).
- Run the full Phase 2 design audit from the agent definition (typography, color, spacing, layout, a11y, contrast, motion, responsive, interaction).
- Run axe-core accessibility check if dev server is available: `npx axe-cli http://localhost:PORT --exit 2>/dev/null || true`
- Grep for hardcoded colors, spacing violations, font inconsistencies, transition:all, outline:none.

Phase 3: PLAN
- Compile all findings into a prioritized fix list (Critical -> High -> Medium -> Low).
- Present the plan: "Found X issues. Fixing all = score ~Y. Proceed?"
- WAIT for user confirmation before proceeding.

Phase 4: FIX
- Execute fixes in priority order: typography, color, spacing, layout, motion, accessibility, interaction, performance, copy.
- Re-verify after each category.

Phase 5: VERIFY
- Run /score again for the AFTER score.
- Take AFTER screenshots and VIEW them with the Read tool.
- Generate before/after comparison.

Phase 6: REPORT
- Show final score comparison with per-category breakdown.
- Show files modified and issues fixed.

If the before score is already 85+, say so and suggest the 3-4 things that would take it to 95+.
