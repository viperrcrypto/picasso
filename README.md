# Picasso

The ultimate AI design skill for producing distinctive, production-grade frontend interfaces.

Picasso consolidates best practices from 18+ sources into a single comprehensive skill that covers every dimension of frontend design: typography, color systems, spatial composition, motion, interaction patterns, responsive design, sound, haptics, icons, generative art, theming, React architecture, component taxonomy, configurable design intensity, and an exhaustive anti-patterns library.

## Install

### Option 1: npx (Recommended)

Works with Claude Code, Cursor, Codex, OpenCode, Windsurf, Copilot, Gemini CLI, Antigravity, and 30+ other agents:

```bash
npx skills add viperrcrypto/picasso
```

### Option 2: Claude Code Plugin Marketplace

```bash
# From within Claude Code:
/plugin marketplace add viperrcrypto/picasso
```

### Option 3: Manual (Claude Code)

```bash
# Project-specific
git clone https://github.com/viperrcrypto/picasso.git
cp -r picasso/skills/picasso .claude/skills/picasso

# Global (all projects)
cp -r picasso/skills/picasso ~/.claude/skills/picasso
```

### Option 4: Manual (Other Agents)

```bash
# Cursor
cp -r picasso/skills/picasso .cursor/skills/picasso

# Codex
cp -r picasso/skills/picasso ~/.codex/skills/picasso

# Any agent following the Agent Skills spec
cp -r picasso/skills/picasso .agents/skills/picasso
```

### Option 5: Claude.ai (Consumer)

Upload the `skills/picasso/SKILL.md` as a Custom Skill in Claude.ai settings. Reference files can be uploaded alongside it for full coverage.

## What's Inside

```
picasso/
├── skills/
│   └── picasso/
│       ├── SKILL.md                          # Main skill file (200 lines)
│       └── references/
│           ├── typography.md                 # Type systems, font pairing, scales, OpenType
│           ├── color-and-contrast.md         # OKLCH, tinted neutrals, dark mode, a11y
│           ├── spatial-design.md             # Spacing scales, grids, visual hierarchy
│           ├── motion-and-animation.md       # Easing, staggering, text morphing, reduced motion
│           ├── interaction-design.md         # Forms, focus, loading, empty states, errors
│           ├── responsive-design.md          # Mobile-first, fluid, container queries
│           ├── sensory-design.md             # UI sounds (soundcn), haptic feedback
│           ├── react-patterns.md             # Server/client components, state, performance
│           ├── anti-patterns.md              # What NOT to do (the most important file)
│           ├── design-system.md              # DESIGN.md generation, theming, tokens
│           ├── generative-art.md             # Algorithmic art, p5.js, seeded randomness
│           └── component-patterns.md         # Standard naming, taxonomy, state matrix
├── .claude-plugin/
│   └── marketplace.json                      # Claude Code plugin marketplace manifest
├── SKILL.md                                  # Root copy (convenience)
├── references/                               # Root copy (convenience)
├── README.md
└── LICENSE
```

## Configurable Settings

Three dials (1-10) control the design output:

| Setting | Low (1-3) | Mid (4-6) | High (7-10) |
|---|---|---|---|
| **DESIGN_VARIANCE** | Clean, centered, conventional | Considered asymmetry | Avant-garde, overlapping, unconventional |
| **MOTION_INTENSITY** | Hover states and fades only | Staggered reveals, scroll-triggered | Magnetic cursors, parallax, complex choreography |
| **VISUAL_DENSITY** | Spacious, luxury | Balanced whitespace | Dense dashboards, data-heavy |

## 21 Commands

| Command | Effect |
|---|---|
| `/audit` | Technical quality check: a11y, performance, responsive |
| `/critique` | UX design review: hierarchy, clarity, resonance |
| `/polish` | Final pass: spacing, transitions, copy refinement |
| `/simplify` | Strip to essence |
| `/animate` | Add purposeful motion |
| `/bolder` | Amplify timid designs |
| `/quieter` | Tone down aggressive designs |
| `/normalize` | Align with design system standards |
| `/theme` | Generate or apply a theme |
| `/sound` | Add UI sound effects |
| `/haptics` | Add haptic feedback |
| `/redesign` | Audit existing project, fix systematically |
| `/soft` | Premium soft aesthetic preset |
| `/minimalist` | Editorial minimalism preset |
| `/brutalist` | Raw mechanical aesthetic preset |
| `/stitch` | Generate Google Stitch DESIGN.md |
| `/clarify` | Improve unclear UX copy |
| `/harden` | Error handling, i18n, edge cases |
| `/colorize` | Introduce strategic color |
| `/delight` | Add moments of joy |
| `/extract` | Pull into reusable components |

## Sources

| Source | What it contributed |
|---|---|
| [Anthropic frontend-design](https://github.com/anthropics/skills/tree/main/skills/frontend-design) | Core aesthetic guidelines, anti-slop philosophy |
| [Anthropic canvas-design](https://github.com/anthropics/skills/tree/main/skills/canvas-design) | Visual philosophy creation, canvas art process |
| [Anthropic algorithmic-art](https://github.com/anthropics/skills/tree/main/skills/algorithmic-art) | Generative art pipeline, p5.js patterns |
| [Anthropic theme-factory](https://github.com/anthropics/skills/tree/main/skills/theme-factory) | Theme structure, font/color pairing |
| [Anthropic web-artifacts-builder](https://github.com/anthropics/skills/tree/main/skills/web-artifacts-builder) | React + Tailwind + shadcn/ui artifact pipeline |
| [Impeccable (pbakaus)](https://github.com/pbakaus/impeccable) | 7-domain reference system, 17 commands, curated anti-patterns |
| [Taste Skill](https://github.com/Leonxlnx/taste-skill) | Configurable variance/motion/density settings, redesign workflow, soft/brutalist/minimalist presets |
| [VoltAgent/awesome-design-md](https://github.com/VoltAgent/awesome-design-md) | DESIGN.md format, 31 real-world design system docs |
| [Component Gallery](https://component.gallery/) | 60+ component types, 90+ design systems, 2,500+ examples, naming conventions |
| [InterfaceCraft](https://www.interfacecraft.dev/) | Interface design with uncommon care philosophy |
| [Torph](https://torph.lochie.me/) | Dependency-free text morphing animation |
| [Geist Pixel (Vercel)](https://vercel.com/blog/introducing-geist-pixel) | Pixel font system, bitmap display typography |
| [Soundcn](https://github.com/kapishdima/soundcn) | 700+ UI sound effects, useSound hook, Web Audio API |
| [WebHaptics](https://haptics.lochie.me/) | Haptic feedback for mobile web |
| [Facehash](https://www.facehash.dev/) | Deterministic avatar generation from strings |
| [Better Icons](https://github.com/better-auth/better-icons) | 200K+ searchable icons from 150+ collections |
| [Vercel agent-skills](https://github.com/vercel-labs/agent-skills) | React best practices and patterns |
| [0xinit/cryptoskills](https://github.com/0xinit/cryptoskills) | Frontend UX resource patterns |

## The Non-Negotiables

1. No design should look like AI made it.
2. Every design must have a clear aesthetic point of view.
3. Match implementation complexity to vision.
4. Text is always a design element.
5. Every detail matters.

## License

MIT
