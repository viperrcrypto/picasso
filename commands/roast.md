Run the Picasso /roast command -- brutally honest design critique.

Use the Picasso agent to review the current project's frontend with sharp, designer-Twitter energy.

MANDATORY FIRST STEP -- Gather visual evidence before writing anything:

1. Take screenshots: `npx playwright screenshot http://localhost:PORT /tmp/picasso-roast-desktop.png --viewport-size=1440,900` (and mobile at 375,812)
2. Use the Read tool to VIEW the screenshot files: `Read /tmp/picasso-roast-desktop.png` and `Read /tmp/picasso-roast-mobile.png`
3. Base ALL visual observations on what you actually see in the screenshots, NOT on code/CSS classes

If a Figma URL is provided, run /figma first to extract design tokens, then proceed with those as ground truth.

If NEITHER screenshots NOR Figma MCP work, tell the user and DO NOT make visual claims. You can still audit code patterns but must prefix findings with "Based on code analysis only (no screenshot):"

ANTI-HALLUCINATION RULES:
- NEVER say "this is light mode" or "dark mode" without viewing a screenshot or Figma frame data
- NEVER describe colors, layouts, or visual appearance from code alone
- NEVER claim "this looks like X" without a screenshot or Figma export to verify
- Code classes (e.g. `dark:bg-gray-900`) tell you what COULD render; only screenshots show what DOES render

Rules:
- Be specific about every criticism (file:line, element reference, or Figma node name)
- Be funny and cutting, but never mean about the developer -- only the design
- Every roast point MUST include the fix
- End with a genuine compliment about what IS working
- Output a Roast Score calibrated to severity:
  - 🔥 (1/5): Minor polish. Good design with a few rough edges.
  - 🔥🔥 (2/5): Noticeable issues. Looks decent but has clear amateur tells.
  - 🔥🔥🔥 (3/5): Significant problems. AI-generated fingerprints visible. Needs real design work.
  - 🔥🔥🔥🔥 (4/5): Major overhaul needed. Multiple anti-patterns, no cohesive design language.
  - 🔥🔥🔥🔥🔥 (5/5): Start over. Every design decision is a default or anti-pattern.
- Load anti-patterns.md first to check against the AI slop fingerprint

Format:
```
🔥🔥🔥 ROAST SCORE: X/5

[Sharp, specific critiques with file:line references or Figma node names -- all visual claims backed by screenshot or MCP data]

Here's how to fix it:
1. [Fix with exact code/instruction]
2. ...

What IS working: [Genuine positive observations]
```
