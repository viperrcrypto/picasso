<p align="center">
  <img src="logo.png" alt="Picasso" width="200" /><br/><br/>
  <strong>PICASSO</strong><br/>
  The most comprehensive AI design skill ever built.
</p>

<p align="center">
  33 reference domains &bull; 15 slash commands &bull; 19,000 lines of design intelligence<br/>
  Every interface looks like a senior design engineer spent days on it.
</p>

<p align="center">
  <a href="#install">Install</a> &bull;
  <a href="#what-makes-picasso-different">Why Picasso</a> &bull;
  <a href="#the-design-interview">Interview</a> &bull;
  <a href="#creative-commands">Creative Commands</a> &bull;
  <a href="#benchmark">Benchmarks</a> &bull;
  <a href="#commands">All Commands</a> &bull;
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

Picasso covers **33 specialized reference domains**, each with concrete rules, specific values, and ready-to-use code. This isn't a collection of vague principles -- it's an engineering specification for beautiful interfaces.

| Domain | What You Get |
|---|---|
| **Typography** | Modular type scales, 15+ font alternatives to Inter/Roboto, OpenType feature activation, vertical rhythm system, `max-width: 65ch`, font loading strategies |
| **Color & Contrast** | OKLCH-based palette construction, tinted neutrals (never pure gray), 60-30-10 rule, dark mode inversion rules, "alpha is a design smell" |
| **Spatial Design** | 4px base spacing scale, Gestalt proximity ratios (2:1 minimum), Squint Test, asymmetric grid patterns, "cards are not required" |
| **Motion & Animation** | Duration rule (100/200/300/500ms), only animate transform+opacity, exit = 75% of entrance, grid-template-rows for height, stagger caps |
| **UX Evaluation** | Nielsen's 10 heuristics as actionable checklist, Jobs to Be Done extraction from code, component state machines (8 states), prompt enhancement for vague requests |
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
| **Navigation Patterns** | Breadcrumbs with ARIA, sidebar collapse, tabs vs button groups, mobile bottom bar vs hamburger, sticky headers, mega menus, skip links |
| **Tables & Forms** | Sortable tables with `aria-sort`, responsive strategies, inline editing, multi-select, form validation (blur/submit/real-time), multi-step forms |
| **Loading & States** | Duration rules (<1s/1-3s/3s+/10s+), skeleton shimmer CSS, 5 empty state types, error boundaries, retry with backoff, offline detection |
| **Dark Mode** | Preference hierarchy, surface elevation (lighter = higher), mode transitions, accent adjustment, image dimming, forced-colors, autofill fix |
| **Images & Media** | AVIF/WebP/SVG decision tree, srcset/sizes, CLS prevention, favicon multi-format, OG images (1200x630), video backgrounds |
| **Micro-Interactions** | IntersectionObserver scroll animations, View Transitions API, magnetic cursors, gesture detection (swipe/pinch), animation budget (max 3 concurrent) |
| **i18n Visual Patterns** | Logical properties for RTL, text expansion by language (+35% German), CJK rendering, Noto font stacks, icon mirroring rules |
| **Brand & Identity** | Logo sizing (min 24px), clear space rules, lockup variants, 60-30-10 brand color usage, when to bend brand rules |
| **Visual Preview** | Self-contained HTML preview generation, side-by-side direction comparison, preset browser grid, font URL mapping, screenshot protocol |
| **Code Typography** | JetBrains Mono/Fira Code selection, syntax highlighting contrast (3:1 min), code block design, copy button UX, diff views, terminal styling |

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

## Visual Discovery (Not a Questionnaire)

Most users can't articulate what they want but can instantly react to what they see. So Picasso shows, not asks.

```
1. CRAWL    Picasso silently reads your codebase, identifies the product
            type, studies 2-3 real competitors in your space.

2. ASK      2-3 quick questions max: "What's the primary user action?"
            "Any brand colors to keep?" "Site you love the look of?"

3. SHOW     Generates 6-10 fast visual sample pages, each a different
            design direction applied to YOUR app's actual structure.
            Opens a gallery for you to browse.

4. REACT    You: "Like 3 and 7. Hate the dark ones. 7 is close but
            the font is too playful."

5. NARROW   Generates 3-5 refined samples based on your reactions.
            Each one more polished than round 1.

6. CONFIRM  You pick a direction. Picasso generates .picasso.md and
            begins implementation with your real content.
```

You never have to go look at design sites for inspiration. Picasso brings it to you. Your reactions reveal more preferences than any questionnaire.

---

## Creative Commands

These are the features that make Picasso unlike any other design tool.

### `/roast` -- The Brutally Honest Critique

Forget polite feedback. `/roast` tears your design apart with designer-Twitter energy.

```
🔥🔥🔥🔥 ROAST SCORE: 4/5

This hero section looks like every v0 output from 2024. The purple gradient
physically hurts my eyes. The three identical cards are a cry for help. And
the "Build the future of work" headline? It's 2026 -- we've moved on.

The Inter font is doing NOTHING for you. It's the design equivalent of
wearing khakis to a nightclub. And transition: all 0.3s? That's animating
your box-shadow, your border-color, and your will to live.

Here's how to fix it:
1. Kill the gradient. Use oklch(0.15 0.02 250) as your background.
2. Replace Inter with Satoshi for display, DM Sans for body.
3. Break the three-card grid. Make the first card 2x width.
...

What IS working: Your spacing scale is consistent (4px base) and the
semantic HTML structure is solid. Build on that.
```

### `/score` -- Quantified Design Quality

A single 0-100 score, broken down by category. Track it over time.

```
## Picasso Design Score: 73/100

Typography:    ████████████░░░  12/15
Color:         ████████████░░░  11/15
Spacing:       ████████░░        8/10
UX Heuristics: ████████████████ 16/20
Motion:        ██████░░░░        6/10
Responsive:    ████████░░        8/10
Performance:   ██████░░░░        6/10
Anti-Slop:     ██████░░░░        6/10

Top fixes for +15 points:
1. Replace default primary color with industry-appropriate choice (+4)
2. Set max-width on body text and increase to 16px (+3)
3. Add prefers-reduced-motion support (+3)
4. Replace outline:none with focus-visible (+3)
5. Replace #000 with tinted near-black (+2)
```

### `/steal <url>` -- Extract Any Site's Design DNA

Point at a live website and Picasso extracts its entire design language into a `.picasso.md` config.

```bash
/steal https://linear.app
```

Extracts: fonts, color palette, spacing rhythm, border-radius system, shadow style, animation patterns, layout structure. Generates a config that makes your project match that aesthetic.

### `/mood <word>` -- Instant Design System from a Word

```bash
/mood cyberpunk
```

Generates a complete design system -- palette, fonts, spacing, motion, component styling -- from a single evocative word. Works with: `cyberpunk`, `cottage`, `brutalist`, `luxury`, `editorial`, `playful`, `corporate`, `dark-tech`, `warm-saas`, `minimal`, and any combination.

### `/evolve` -- Iterative Multi-Round Refinement

Proposes 3 directions as visual HTML previews, lets you pick, then implements and refines through multiple rounds with screenshots between each:

```
Round 1: [generates 3 visual preview cards, screenshots them]
         A) Counsel -- sage/teal, serif headers, 8px radius
         B) Chambers -- dark, amber accent, monospace, 3px sharp
         C) Parchment -- warm cream, terracotta, italic serif

You: B, but less extreme

Round 2: [implements B with adjustments, screenshots running app]
         What do you love? What's not right?

You: Love the typography. Cards need more breathing room.

Round 3: [adjusts spacing, screenshots again]
         Are we there?

You: Ship it.
```

### `/compete <url>` -- Head-to-Head Design Battle

```bash
/compete https://competitor.com
```

Screenshots both sites, scores both, produces a head-to-head comparison:

```
                    You        Competitor
Typography:         72         88          ← They win (modular scale)
Color:              85         71          ← You win (better contrast)
Responsive:         90         65          ← You win (mobile-first)
Performance:        45         92          ← They win (image optimization)
Accessibility:      88         42          ← You win (focus states)
Overall:            76         72          ← You win, barely

Key gap: Their typography is stronger because they use a consistent
1.25 ratio scale. Yours has 7 different sizes with no clear ratio.
Fix this and you pull ahead significantly.
```

### `/before-after` -- Visual Transformation Report

After any `/polish` or `/redesign`, auto-generates side-by-side screenshots showing exactly what changed and why. Shareable HTML report.

### `/preset <name>` -- One-Command Aesthetic

```bash
/preset            # Visual browser grid of all 22 presets -- pick one
/preset bold-signal  # Preview Bold Signal, then apply it
```

Without args: generates a visual grid showing all 22 presets with swatches, fonts, and sample buttons. Pick visually. With a name: shows a full-page preview before applying. Generates `.picasso.md` + `DESIGN.md` + updates CSS variables.

---

## Benchmark

### Picasso vs. Every Other Design Skill

We compared Picasso against every publicly available AI design skill as of April 2026.

| Metric | Picasso | Anthropic frontend-design | Impeccable | Taste Skill | Generic skills |
|---|---|---|---|---|---|
| **Reference domains** | **33** | 1 | 7 | 1 | 1-3 |
| **Total lines of guidance** | **19,000** | ~120 | ~2,500 | ~200 | 50-300 |
| **Anti-pattern rules** | **50+** | ~10 | ~30 | ~5 | 0-5 |
| **Slash commands** | **15** | 0 | 20 | 0 | 0-3 |
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
| **Scoring system** | **0-100 quantified** | None | /20 + /40 | None | None |
| **Design interview** | **4-section onboarding** | None | None | None | None |
| **Creative commands** | **8 (/roast, /steal, /evolve, /mood, /compete, /variants, /preset, /before-after)** | None | None | None | None |
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

# Install for OpenClaw
npx picasso-skill --openclaw

# Or via ClawHub marketplace
clawhub install picasso

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
| **What it is** | 32 reference files of design intelligence | Autonomous design auditor with anti-slop gate |
| **How it works** | Loaded into context when designing | Runs as a sub-process with its own tools |
| **When it runs** | When you ask for design help | On explicit commands (/audit, /roast, /godmode, etc.) |
| **Can audit code** | Only when asked | Yes, with structured scoring |
| **Can run axe-core** | No | Yes (via CLI) |
| **Can screenshot pages** | No | Yes (via `npx playwright screenshot`) |
| **Can auto-fix issues** | No | Yes (with pre-flight git/test checks) |
| **Can enforce design system** | No | Yes (greps for token violations) |
| **Enforces anti-slop gate** | Via SKILL.md instructions | Yes, mandatory before any code generation |

---

## Commands

Picasso has two types of commands: **slash commands** you invoke directly, and **agent behaviors** the Picasso agent handles internally when running pipelines like `/godmode`.

### Slash Commands (User-Invocable)

These have dedicated command files and can be invoked directly.

| Command | What It Does |
|---|---|
| `/roast` | Brutally honest design critique with sharp, specific, funny feedback and screenshot verification |
| `/score` | Quantified 0-100 design quality score with category breakdown |
| `/godmode` | The ultimate command: interview + audit + score + roast + fix everything + before/after report |
| `/quick-audit` | 5-minute fast audit: 6 binary pass/fail checks (font, color, layout, spacing, a11y, anti-slop) |
| `/autorefine` | Binary evaluation loop: 6 criteria, mutate one thing at a time, iterate to 95%+ pass rate |
| `/evolve` | Multi-round iterative design refinement with screenshots between rounds |
| `/steal <url>` | Extract design DNA from any live website into `.picasso.md` |
| `/mood <word>` | Generate complete design system from a single evocative word |
| `/compete <url>` | Head-to-head design comparison against a competitor site |
| `/before-after` | Visual side-by-side comparison after changes with HTML report |
| `/preset <name>` | Apply a curated community design preset (linear, stripe, vercel, notion, etc.) |
| `/variants` | Generate 2-3 distinct visual directions with side-by-side visual HTML previews |
| `/preview` | Visual preview of design tokens, presets, or side-by-side direction comparison |
| `/figma` | Figma MCP integration: extract design tokens, audit, compare Figma vs live |
| `/backlog` | Create persistent design debt backlog with impact-priority scoring in `.picasso-backlog.md` |

### `/godmode` -- The Nuclear Option

One command. Full transformation. Interview, audit, score, roast, fix everything, verify, before/after report.

```
/godmode

Phase 1: Understanding your project...
Phase 2: Scoring... 42/100. Roasting... 🔥🔥🔥🔥
Phase 3: Found 23 issues. Fixing all = score ~85. Proceed? [y]
Phase 4: Fixing... typography ✓ color ✓ spacing ✓ a11y ✓ motion ✓ responsive ✓ perf ✓
Phase 5: Re-scoring... 87/100 (+45 points)
Phase 6: Before/after report generated.

GODMODE Complete: 42 → 87 (+45 points), 47 files modified, 23 issues fixed
```

---

### Agent Behaviors (Internal)

These are defined in the Picasso agent and run as part of pipelines (e.g., `/godmode` calls several of these internally). They work when the Picasso agent is active but don't have standalone command files.

| Behavior | What It Does |
|---|---|
| `/picasso` | Run the visual discovery process, generates `.picasso.md` |
| `/audit` | Full technical audit across typography, color, spacing, UX heuristics, motion, responsive |
| `/polish` | Auto-fix all audit findings with smallest safe changes |
| `/redesign` | Full audit + aggressive fixes + re-audit to verify improvement |
| `/harden` | Add error handling, loading states, empty states, edge case handling |
| `/stitch` | Generate a complete DESIGN.md from the current codebase |
| `/a11y` | Full accessibility audit: axe-core + pa11y + Lighthouse with JSON parsing |
| `/perf` | Lighthouse performance audit with Core Web Vitals pass/fail thresholds |
| `/visual-diff` | Screenshot desktop + mobile in light/dark mode, analyze visually |
| `/consistency` | Multi-page consistency check across all routes |
| `/lint-design` | Find hardcoded colors, spacing violations, font inconsistencies |
| `/design-system-sync` | Detect and fix drift between DESIGN.md and code |
| `/install-hooks` | Generate git pre-commit hook for automated design checks |
| `/ci-setup` | Generate GitHub Actions workflow for PR design review with scores |

---

## References

```
references/                          # 33 files, 7,000 lines
  anti-patterns.md                   # 50+ banned patterns (THE MOST IMPORTANT FILE)
  typography.md                      # Type systems, font pairing, scales, vertical rhythm
  color-and-contrast.md              # OKLCH, tinted neutrals, dark mode, 60-30-10
  spatial-design.md                  # 4px spacing scale, grids, hierarchy, Squint Test
  depth-and-elevation.md             # Shadows, layering, z-index, hover patterns
  motion-and-animation.md            # Duration, easing, staggering, performance (merged)
  micro-interactions.md              # Scroll animations, View Transitions, gestures, cursors
  navigation-patterns.md             # Breadcrumbs, sidebar, tabs, bottom bar, mega menus
  tables-and-forms.md                # Sortable tables, inline editing, validation
  loading-and-states.md              # Skeletons, error boundaries, empty states, offline
  responsive-design.md               # Input method detection, container queries
  dark-mode.md                       # Preference hierarchy, elevation, transitions
  images-and-media.md                # Format selection, srcset, favicons, OG images
  brand-and-identity.md              # Logo sizing, brand color, lockup variants
  i18n-visual-patterns.md            # RTL, logical properties, text expansion, CJK
  code-typography.md                 # Monospace fonts, syntax highlighting, code blocks
  sensory-design.md                  # useSound hook, haptic patterns, multi-sensory
  react-patterns.md                  # Server Components, composition, Tailwind v4
  design-system.md                   # DESIGN.md format, theme generation, tokens
  generative-art.md                  # Philosophy-first process, p5.js, seeded randomness
  component-patterns.md              # 40+ components, state matrix, compound patterns
  ux-psychology.md                   # Gestalt, Fitts's/Hick's/Miller's/Jakob's Law
  ux-writing.md                      # Error formula, button labels, terminology
  ux-evaluation.md                   # Nielsen's 10 heuristics, JTBD, state machines
  data-visualization.md              # Chart selection matrix, dashboard layouts, Tufte
  conversion-design.md               # Landing pages, CTAs, pricing, onboarding
  accessibility-wcag.md              # ARIA patterns, WCAG 2.2, focus management
  modern-css-performance.md          # Nesting, :has(), @layer, View Transitions, Tailwind v4
  performance-optimization.md        # Core Web Vitals, priority tiers
  style-presets.md                   # 22 visual presets with values and font pairings
  visual-preview.md                  # HTML preview generation, templates, font mapping
  figma-mcp.md                       # Figma MCP workflows, token extraction
  tools-catalog.md                   # torph, soundcn, Lucide, Facehash, better-icons
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
