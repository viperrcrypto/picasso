<p align="center">
  <strong>PICASSO</strong><br/>
  The most comprehensive AI design skill ever built.
</p>

<p align="center">
  20 reference domains &bull; 25+ commands &bull; 4,700+ lines of actionable design intelligence<br/>
  Every interface looks like a senior design engineer spent days on it.
</p>

<p align="center">
  <a href="#install">Install</a> &bull;
  <a href="#what-makes-picasso-different">Why Picasso</a> &bull;
  <a href="#benchmark">Benchmarks</a> &bull;
  <a href="#commands">Commands</a> &bull;
  <a href="#references">References</a> &bull;
  <a href="#sources">Sources</a>
</p>

---

## The Problem

Every AI coding tool produces the same output: Inter font, purple gradients on white, centered layouts, uniform card grids, glassmorphism everywhere. It's instantly recognizable as "AI made this." Users can feel it. Clients can see it. It looks generic because it is generic.

Existing design skills are shallow. They tell you to "use good typography" without specifying what that means. They say "be accessible" without giving you the ARIA patterns. They cover 3-4 design domains and call it done.

**Picasso is different.** It is the largest, most detailed, and most opinionated design skill available for any AI coding agent. It doesn't just tell you what to do -- it tells you exactly how, with specific values, code examples, and anti-patterns for every decision.

---

## What Makes Picasso Different

### Depth That No Other Skill Matches

Picasso covers **20 specialized reference domains**, each with concrete rules, specific values, and ready-to-use code. This isn't a collection of vague principles -- it's an engineering specification for beautiful interfaces.

| Domain | What You Get |
|---|---|
| **Typography** | Modular type scales, 15+ font alternatives to Inter/Roboto, OpenType feature activation, vertical rhythm system, `max-width: 65ch`, font loading strategies |
| **Color & Contrast** | OKLCH-based palette construction, tinted neutrals (never pure gray), 60-30-10 rule, dark mode inversion rules, "alpha is a design smell" |
| **Spatial Design** | 4px base spacing scale, Gestalt proximity ratios (2:1 minimum), Squint Test, asymmetric grid patterns, "cards are not required" |
| **Motion & Animation** | Duration rule (100/200/300/500ms), only animate transform+opacity, exit = 75% of entrance, grid-template-rows for height, stagger caps |
| **Interaction Design** | All 8 interactive states (default/hover/focus/active/disabled/loading/error/success), dropdown positioning (#1 bug fix), Popover API, undo > confirmation |
| **Responsive Design** | Input method detection (`@media pointer/hover`), safe areas, container queries, content-driven breakpoints, real device testing |
| **Sensory Design** | soundcn (700+ CC0 sounds), web-haptics (4 presets + custom), multi-sensory integration patterns |
| **React/Next.js** | Server Components by default, barrel import avoidance, RSC serialization minimization, React.cache() deduplication |
| **Anti-Patterns** | 50+ explicit "never do this" rules across typography, color, layout, motion, interaction, code, and content |
| **Design Systems** | VoltAgent/Google Stitch 9-section DESIGN.md format, 4 pre-built themes, two-layer token architecture |
| **Generative Art** | Philosophy-first creative process, seeded randomness, p5.js patterns, parameter-driven exploration |
| **Component Patterns** | 40+ standard component names from 90+ real design systems, state matrix, compound component patterns, sizing conventions |
| **UX Psychology** | Gestalt principles with CSS examples, Fitts's/Hick's/Miller's/Jakob's Law with specific numbers, F/Z-pattern scanning, Peak-End Rule |
| **Data Visualization** | Chart selection decision matrix (13 types), dashboard layout patterns, Okabe-Ito colorblind-safe palettes, Tufte data-ink ratio, React library comparison |
| **Modern CSS** | CSS nesting, :has(), @layer, anchor positioning, @scope, @property, color-mix(), subgrid, Popover API, scroll-driven animations, View Transitions |
| **Web Performance** | Core Web Vitals targets (LCP < 2.5s, CLS < 0.1, INP < 200ms), image format matrix (AVIF/WebP), font-display strategies, critical CSS, Tailwind v4 |
| **Conversion Design** | Hero section variations, CTA design with conversion data, pricing page structure, friction reduction metrics, onboarding frameworks, notification hierarchy |
| **Accessibility** | 12 WAI-ARIA widget patterns with exact roles/states/keyboard, WCAG 2.2 new criteria, focus management for SPAs, accessible data tables, drag-and-drop alternatives |
| **UX Writing** | Error message formula (what + why + fix), button label rules (verb + object), translation expansion percentages, terminology consistency |
| **Style Presets** | 22 curated visual presets with hex values, font pairings, border-radius, and signature UI elements, mapped to moods |
| **Performance Optimization** | Vercel's 45 React/Next.js rules across 7 priority tiers with BAD/GOOD code examples |

### The AI-Slop Firewall

Picasso's anti-pattern system is the most aggressive in any design skill. It doesn't just suggest good practices -- it explicitly bans the fingerprints of AI-generated interfaces:

**Banned typography:** Inter, Roboto, Arial, Open Sans, Space Grotesk, monospace-as-lazy-technical-vibe, large icons with rounded corners above every heading.

**Banned color:** Pure black (#000), pure white (#fff), pure gray, gray text on colored backgrounds, cyan-on-dark, purple-to-blue gradients, neon accents on dark, gradient text for "impact."

**Banned layout:** Cards nested in cards, identical card grids (icon + heading + text repeated), hero metric layout template, centered everything, same spacing everywhere, glassmorphism everywhere.

**Banned motion:** bounce/elastic easing, `transition: all`, animating width/height/padding/margin, no reduced-motion support.

**Banned interaction:** Placeholder-only labels, `outline: none` without replacement, hover-only interactions, every button styled as primary.

### Integrated Tool Ecosystem

Picasso doesn't just describe tools -- it specifies exactly how to use them with installation commands, import paths, and API examples:

| Tool | What It Does | Integration |
|---|---|---|
| **torph** | Text morphing animation | `import { TextMorph } from 'torph/react'` with spring easing |
| **soundcn** | 700+ UI sounds | `npx shadcn add @soundcn/click-soft`, base64 inline, zero deps |
| **web-haptics** | Mobile haptic feedback | 4 presets (success/nudge/error/buzz), desktop debug mode |
| **facehash** | Deterministic avatar faces | ~3KB, SVG, 3D depth, Avatar/AvatarFallback pattern |
| **better-icons** | 200K+ icons from 150+ sets | MCP server for AI agents, CLI search, project sync |
| **Geist Pixel** | 5 pixel font variants | Square/Grid/Circle/Triangle/Line, Next.js native |
| **Lucide React** | Default icon library | Direct imports (avoid barrel files) |

---

## Benchmark

### Picasso vs. Every Other Design Skill

We compared Picasso against every publicly available AI design skill as of April 2026.

| Metric | Picasso | Anthropic frontend-design | Impeccable | Taste Skill | Generic skills |
|---|---|---|---|---|---|
| **Reference domains** | **20** | 1 | 7 | 1 | 1-3 |
| **Total lines of guidance** | **4,700+** | ~120 | ~2,500 | ~200 | 50-300 |
| **Anti-pattern rules** | **50+** | ~10 | ~30 | ~5 | 0-5 |
| **Steering commands** | **25+** | 0 | 20 | 0 | 0-3 |
| **ARIA patterns documented** | **12 widgets** | 0 | 0 | 0 | 0 |
| **React performance rules** | **45 (Vercel)** | 0 | 0 | 0 | 0 |
| **Chart/data viz guidance** | **Full matrix** | None | None | None | None |
| **WCAG 2.2 coverage** | **Full** | None | Partial | None | None |
| **Conversion/landing page** | **CTA data + pricing** | None | None | None | None |
| **Modern CSS (2024-2025)** | **12 features** | None | Partial | None | None |
| **Core Web Vitals** | **LCP/CLS/INP** | None | None | None | None |
| **Pre-built presets** | **22 + 4 OKLCH** | 0 | 0 | 0 | 0-3 |
| **UX psychology** | **6 laws + patterns** | None | None | None | None |
| **Design system generation** | **9-section (Stitch)** | None | None | None | None |
| **Sound/haptics** | **soundcn + web-haptics** | None | None | None | None |
| **Scoring system** | **/20 tech + /40 UX** | None | /20 + /40 | None | None |
| **Tool integrations** | **7 libraries** | 0 | 0 | 0 | 0 |
| **Sources consolidated** | **15+ repos** | 1 | 1 | 1 | 0-1 |

### What This Means in Practice

**Without Picasso**, your AI will:
- Default to Inter or Roboto every time
- Use purple gradients because that's what the training data looks like
- Center everything because it's the safe choice
- Ignore accessibility until someone files a complaint
- Use `transition: all 0.3s ease` and call it animated
- Produce interfaces that look like every other AI-generated UI

**With Picasso**, your AI will:
- Choose distinctive typography (Instrument Sans, Fraunces, Outfit) with proper OpenType features
- Build OKLCH palettes with tinted neutrals and the 60-30-10 rule
- Create asymmetric layouts with intentional spatial hierarchy
- Include all 8 interactive states on every element
- Hit WCAG 2.2 AA compliance by default
- Optimize for Core Web Vitals (LCP < 2.5s, CLS < 0.1, INP < 200ms)
- Add text morphing, UI sounds, and haptic feedback where appropriate
- Generate DESIGN.md files that any AI agent can read
- Never produce the same design twice

---

## Install

### Option 1: npx (Recommended)

```bash
# Install skill + agent to current project
npx picasso-skill

# Install globally (all Claude Code projects)
npx picasso-skill --global

# Skill only (no agent)
npx picasso-skill --skill-only

# Install for Cursor
npx picasso-skill --cursor

# Install for Codex
npx picasso-skill --codex

# Custom path
npx picasso-skill --path ./my-skills
```

### Option 2: One-Liner

```bash
# Project-specific (skill + agent)
git clone https://github.com/viperrcrypto/picasso.git /tmp/picasso && \
  mkdir -p .claude/skills .claude/agents && \
  cp -r /tmp/picasso/skills/picasso .claude/skills/picasso && \
  cp /tmp/picasso/agents/picasso.md .claude/agents/picasso.md && \
  rm -rf /tmp/picasso

# Global (all projects)
git clone https://github.com/viperrcrypto/picasso.git /tmp/picasso && \
  mkdir -p ~/.claude/skills ~/.claude/agents && \
  cp -r /tmp/picasso/skills/picasso ~/.claude/skills/picasso && \
  cp /tmp/picasso/agents/picasso.md ~/.claude/agents/picasso.md && \
  rm -rf /tmp/picasso
```

### Option 3: Manual

```bash
git clone https://github.com/viperrcrypto/picasso.git
cp -r picasso/skills/picasso ~/.claude/skills/picasso
cp picasso/agents/picasso.md ~/.claude/agents/picasso.md
```

### Option 4: Claude.ai (Consumer)

Upload `SKILL.md` as a Custom Skill in Claude.ai settings. Upload reference files alongside it for full coverage.

---

## Skill + Agent

Picasso ships as both a **skill** (knowledge base) and an **agent** (autonomous design engineer).

| | Skill | Agent |
|---|---|---|
| **What it is** | 20 reference files of design intelligence | Autonomous design auditor |
| **How it works** | Loaded into context when designing | Runs as a sub-process with its own tools |
| **When it runs** | When you ask for design help | Proactively after frontend code changes |
| **Can audit code** | Only when asked | Automatically |
| **Can run axe-core** | No | Yes |
| **Can screenshot pages** | No | Yes (via Playwright) |
| **Can auto-fix issues** | No | Yes |
| **Can enforce design system** | No | Yes (greps for token violations) |

---

## Commands

### Quality Assessment

| Command | What It Does |
|---|---|
| `/audit` | Technical quality check across 5 dimensions (accessibility, performance, theming, responsive, anti-patterns). Each scored 0-4, total /20. Issues tagged P0-P3. |
| `/critique` | UX design review evaluating visual hierarchy, cognitive load, emotional journey, discoverability, composition. Scores Nielsen's 10 heuristics 0-4, total /40. |

### Refinement

| Command | What It Does |
|---|---|
| `/polish` | Final pass before shipping: visual alignment, typography refinement, color/contrast, all 8 interaction states, micro-interactions, content/copy, edge cases |
| `/simplify` | Strip to essence: reduce scope, flatten structure, remove decorations, progressive disclosure, shorter copy, fewer variants |
| `/normalize` | Realign to design system standards: fix hardcoded colors, inconsistent tokens, broken dark mode, spacing violations |
| `/typeset` | Fix typography: font choices, hierarchy clarity, sizing scale, readability (line length, line-height, contrast), OpenType features |
| `/arrange` | Fix layout: establish spacing system, create visual rhythm, choose right layout tool (Flexbox vs Grid), break card grid monotony |

### Amplification

| Command | What It Does |
|---|---|
| `/animate` | Add purposeful motion: page load choreography, micro-interactions, state transitions, scroll effects, loading delight |
| `/bolder` | Amplify timid designs: extreme type scale (3x-5x), vibrant color, spatial drama, dramatic shadows, custom elements |
| `/quieter` | Tone down aggressive designs: reduce saturation to 70-85%, soften weights, increase whitespace, shorter animation distances |
| `/colorize` | Introduce strategic color: semantic states, accent application, tinted backgrounds, data visualization, decorative elements |
| `/delight` | Add moments of joy: button feedback, loading delight, success celebrations, personality in copy, sound cues, easter eggs |

### Aesthetic Presets

| Command | What It Does |
|---|---|
| `/soft` | Premium soft aesthetic: generous whitespace, layered depth, smooth spring animations, muted palette |
| `/minimalist` | Editorial minimalism: monochrome, crisp borders, surgical precision, inspired by Linear/Notion |
| `/brutalist` | Raw mechanical aesthetic: Swiss typography, CRT terminal feel, sharp edges, monospace accents |

### System

| Command | What It Does |
|---|---|
| `/theme` | Generate or apply a complete color/font theme with CSS variables |
| `/stitch` | Generate a Google Stitch-compatible DESIGN.md (9-section format from VoltAgent) |
| `/sound` | Add UI sound effects using soundcn (700+ CC0-licensed sounds) |
| `/haptics` | Add mobile haptic feedback using web-haptics (4 presets + custom patterns) |
| `/redesign` | Full audit + identify problems + fix systematically + re-audit cycle |

### Production

| Command | What It Does |
|---|---|
| `/adapt` | Adapt for devices: mobile (thumb-zone), tablet (two-column), desktop (multi-column), print, email (600px, table-based) |
| `/clarify` | Improve UX copy: error messages, form labels, button text, help text, empty states, confirmation dialogs |
| `/optimize` | Performance: image optimization, JS bundle reduction, CSS critical path, font loading, animation 60fps, network efficiency |
| `/harden` | Error handling and edge cases: text overflow, i18n (RTL, expansion), network errors, empty/loading/error states, browser compat |
| `/onboard` | Design onboarding: signup friction reduction, first-run experience, progressive feature discovery, setup checklists |

### Advanced

| Command | What It Does |
|---|---|
| `/overdrive` | Technically extraordinary effects. Proposes 2-3 directions before building. Toolkit: View Transitions API, scroll-driven animations, WebGL/Three.js, @property gradient animation, Web Audio, spring physics. Targets 60fps. Progressive enhancement required. |

---

## References

```
references/
  typography.md                   # Type systems, font pairing, scales, OpenType, vertical rhythm
  color-and-contrast.md           # OKLCH, tinted neutrals, dark mode, 60-30-10, dangerous combos
  spatial-design.md               # 4px spacing scale, grids, hierarchy, Squint Test, optical adjustments
  motion-and-animation.md         # Duration rule, easing curves, staggering, text morphing, reduced motion
  interaction-design.md           # 8 states, forms, focus, loading, Popover API, dropdown positioning
  responsive-design.md            # Input method detection, safe areas, container queries, real device testing
  sensory-design.md               # soundcn, web-haptics, multi-sensory integration patterns
  react-patterns.md               # Server Components, composition, state management, data fetching, styling
  anti-patterns.md                # 50+ banned patterns across all domains (the most important file)
  design-system.md                # 9-section DESIGN.md format, theme generation, token structure, 4 themes
  generative-art.md               # Philosophy-first process, p5.js, seeded randomness, parameter controls
  component-patterns.md           # 40+ components, state matrix, compound patterns, sizing conventions
  ux-psychology.md                # Gestalt, Fitts's/Hick's/Miller's/Jakob's Law, F/Z-pattern, Peak-End
  data-visualization.md           # Chart selection matrix, dashboard layouts, data palettes, Tufte, sparklines
  modern-css-performance.md       # Nesting, :has(), @layer, anchor positioning, View Transitions, Tailwind v4
  conversion-design.md            # Landing pages, CTAs, pricing, onboarding, navigation/IA, notifications
  accessibility-wcag.md           # 12 ARIA patterns, WCAG 2.2, SPA focus, accessible tables, drag-and-drop
  ux-writing.md                   # Error formula, button labels, empty states, i18n, terminology
  style-presets.md                # 22 visual presets with colors, fonts, signature elements, mood mapping
  performance-optimization.md     # 45 Vercel rules across 7 priority tiers with code examples
```

---

## Configurable Settings

Three dials (1-10) control the design character:

| Setting | Low (1-3) | Mid (4-6) | High (7-10) |
|---|---|---|---|
| **DESIGN_VARIANCE** | Clean, centered, conventional | Considered asymmetry, intentional breaks | Avant-garde, overlapping, unconventional grids |
| **MOTION_INTENSITY** | Hover states and fades only | Staggered reveals, scroll-triggered, text morphing | Magnetic cursors, parallax, complex choreography |
| **VISUAL_DENSITY** | Spacious, luxury, breathing room | Balanced, structured whitespace | Dense dashboards, data-heavy, compact |

**Shortcuts:**
- "Make it premium" / "luxury" -> VISUAL_DENSITY 2-3, MOTION_INTENSITY 4-5
- "Dashboard" / "admin panel" -> VISUAL_DENSITY 7-8
- "Make it pop" / "wow factor" -> DESIGN_VARIANCE 7-8, MOTION_INTENSITY 7-8

---

## Sources

Picasso consolidates and builds upon 15+ open-source projects and research sources:

| Source | What Was Extracted |
|---|---|
| [Anthropic Skills](https://github.com/anthropics/skills) (5 skills) | frontend-design rules, canvas-design philosophy process, algorithmic-art p5.js pipeline, theme-factory 10 themes, web-artifacts-builder bundling |
| [Impeccable](https://github.com/pbakaus/impeccable) | 7-domain reference system, 20 steering commands, anti-AI-slop rules, 8 interactive states, scoring systems, UX writing |
| [VoltAgent/awesome-design-md](https://github.com/VoltAgent/awesome-design-md) | 9-section DESIGN.md format, 55 real-world site examples, Agent Prompt Guide concept |
| [Vercel agent-skills](https://github.com/vercel-labs/agent-skills) | 45 React/Next.js performance rules across 7 priority tiers |
| [Frontend-slides](https://github.com/zarazhangrui/frontend-slides) | 12 style presets, feeling-to-animation mapping, viewport-fitting CSS |
| [Torph](https://torph.lochie.me/) | Dependency-free text morphing with spring easing |
| [soundcn](https://github.com/kapishdima/soundcn) | 700+ CC0 UI sounds, shadcn-style installation, Web Audio API |
| [web-haptics](https://haptics.lochie.me/) | Mobile haptic feedback with 4 presets and desktop debug mode |
| [facehash](https://www.facehash.dev/) | Deterministic SVG avatar generation with 3D depth |
| [better-icons](https://github.com/better-auth/better-icons) | 200K+ icons from 150+ collections, MCP server for AI agents |
| [Geist Pixel](https://vercel.com/blog/introducing-geist-pixel) | 5 pixel font variants for retro/gaming aesthetics |
| [CryptoSkills](https://github.com/0xinit/cryptoskills) | Async state machine patterns, error classification taxonomy |
| [InterfaceCraft](https://www.interfacecraft.dev/) | Design philosophy ("reduce until clear, refine until right") |
| NNGroup, Laws of UX, W3C WAI | UX psychology research, WCAG 2.2 patterns, accessibility best practices |
| Tufte, Data-to-Viz, ColorBrewer | Data visualization principles, chart selection, colorblind-safe palettes |

---

## The Non-Negotiables

1. **No design should ever look like AI made it.** No purple gradients on white. No Inter font. No centered everything. No cards nested in cards. No gray text on colored backgrounds.
2. **Every design must have a clear aesthetic point of view.** If it could belong to any product, it belongs to none.
3. **Match implementation complexity to vision.** Maximalist designs need elaborate code. Minimalist designs need surgical precision.
4. **Text is always a design element**, never an afterthought.
5. **Every detail matters.** The shadow radius, the letter spacing, the hover transition duration, the border color in dark mode.
6. **Every interactive element needs all 8 states:** default, hover, focus, active, disabled, loading, error, success.
7. **Accessibility is not optional.** WCAG 2.2 AA compliance is the baseline, not the goal.
8. **Performance is a feature.** LCP < 2.5s, CLS < 0.1, INP < 200ms.
9. **UX writing is design.** Buttons say what they do. Errors explain how to fix. Empty states guide the next action.
10. **Vary between generations.** Never converge on the same fonts, colors, or layouts across projects.

---

## License

MIT

---

<p align="center">
  <sub>Built by <a href="https://github.com/viperrcrypto">viperrcrypto</a>. Every interface deserves intention.</sub>
</p>
