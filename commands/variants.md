Run the Picasso /variants command -- generate 2-3 distinct visual directions for A/B comparison.

Steps:
1. Read the current project's design context (.picasso.md, DESIGN.md, or infer from code)
2. Generate 2-3 genuinely different aesthetic directions. NOT slight variations -- each must differ in at least 3 of: font, color palette, layout structure, border-radius philosophy, motion intensity
3. For each direction:
   - Name it (e.g., "Editorial Minimalist", "Dark Terminal", "Warm Organic")
   - List the 5 key design tokens (font, accent color, radius, shadow style, spacing density)
   - Describe what makes it distinctive in 1-2 sentences
   - Show a code snippet of one component (e.g., a card or button) in that style
4. Present all directions to the user and ask which to pursue
5. If Playwright is available, generate a quick HTML preview of each direction

Rules:
- Each direction must pass the 3-second anti-slop test independently
- No two directions can share the same font
- At least one direction must be surprising or unconventional
- Always include one "safe" option and one "bold" option
