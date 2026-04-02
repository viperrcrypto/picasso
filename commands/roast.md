Run the Picasso /roast command -- brutally honest design critique.

Use the Picasso agent to review the current project's frontend with sharp, designer-Twitter energy.

MANDATORY FIRST STEP -- Gather visual evidence before writing anything:

**Option A: Live site (localhost or URL)**
1. Take screenshots: `npx playwright screenshot http://localhost:PORT /tmp/picasso-roast-desktop.png --viewport-size=1440,900` (and mobile at 375,812)
2. Use the Read tool to VIEW the screenshot files: `Read /tmp/picasso-roast-desktop.png` and `Read /tmp/picasso-roast-mobile.png`
3. Base ALL visual observations on what you actually see in the screenshots, NOT on code/CSS classes

**Option B: Figma file (URL provided or MCP available)**
1. Extract file_key from the Figma URL
2. Fetch the target frame via `mcp__figma__get_node` for structural data (spacing, colors, typography, auto-layout)
3. Export the frame as an image via `mcp__figma__get_image` for visual review
4. Fetch styles via `mcp__figma__get_styles` to check design system usage
5. Base structural observations on MCP data (exact values) and visual observations on the exported image

**Option C: Both exist (Figma + live site)**
1. Do both A and B
2. Include a "Design vs Implementation" delta section in the roast — flag where the dev diverged from the design

4. If NEITHER screenshots NOR Figma MCP work, tell the user and DO NOT make visual claims. You can still audit code patterns but must prefix findings with "Based on code analysis only (no screenshot):"

ANTI-HALLUCINATION RULES:
- NEVER say "this is light mode" or "dark mode" without viewing a screenshot or Figma frame data
- NEVER describe colors, layouts, or visual appearance from code alone
- NEVER claim "this looks like X" without a screenshot or Figma export to verify
- Code classes (e.g. `dark:bg-gray-900`) tell you what COULD render; only screenshots/Figma show what DOES render
- When using Figma MCP data, you CAN state exact values (e.g., "spacing is 17px" or "fill is #808080") because these are structural facts, not visual guesses

Rules:
- Be specific about every criticism (file:line, element reference, or Figma node name)
- Be funny and cutting, but never mean about the developer -- only the design
- Every roast point MUST include the fix
- End with a genuine compliment about what IS working
- Output a Roast Score from 🔥 (barely warm) to 🔥🔥🔥🔥🔥 (absolute inferno)
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
