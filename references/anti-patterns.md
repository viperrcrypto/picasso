# Anti-Patterns Reference

This is the most important reference file. These are the patterns that make AI-generated interfaces immediately recognizable. Avoid all of them.

---

## HARD-BANNED PATTERNS (NEVER USE -- NO EXCEPTIONS)

These patterns are so strongly associated with AI-generated design that they must NEVER appear in any Picasso output. Not as a "starting point," not as "we'll iterate later," not in any context. If you catch yourself reaching for any of these, STOP and choose something else.

### Banned Color Patterns
- **Indigo/violet/purple gradient on stat cards or hero sections.** This is the #1 most recognizable AI design pattern in 2025-2026. `from-indigo-600 to-violet-500`, `from-purple-500 to-blue-500`, or any variation. NEVER.
- **Colored left-border or top-border accents on cards.** The `border-l-4 border-purple-500` pattern on stat cards, feature cards, or list items is an AI fingerprint. Real dashboards use uniform subtle borders or no borders at all.
- **Dark sidebar with gradient CTA button.** A `bg-slate-950` sidebar paired with a `from-indigo-500 to-violet-500` gradient "New [Thing]" button is the second most common AI dashboard pattern after gradient stat cards.
- **Rainbow-coded card borders.** Giving each card in a row a different colored border (purple, amber, green, blue) is not "visual hierarchy" -- it's the AI rainbow pattern. Use one accent color sparingly.
- **Indigo/violet as primary color for any project.** Unless the user's existing brand is specifically indigo/violet, never default to the indigo-500/violet-500 family. It's the Tailwind default trap.

### Banned Layout Patterns  
- **Gradient hero stat card that "pops" from a row of plain cards.** Making one stat card a full gradient (colored background, white text) while the others are plain white with borders. This is the most common AI "fix" for uniform card grids and it's just as recognizable.
- **Colored dot/badge indicators on every list item by category.** Green dot for "create," blue dot for "update," red dot for "delete" in activity feeds. Real apps use subtle text differentiation, not a color-coded dot system.
- **Gradient section headers.** Adding `from-muted/40 to-transparent` backgrounds to card headers is decorative noise that signals AI generation.
- **Colored icon badges in rounded containers.** Putting icons inside colored circles/rounded squares (`bg-purple-100 p-2 rounded-lg`) next to section titles is a v0/bolt/lovable fingerprint.

### Banned "Improvement" Patterns
- **Converting hex to OKLCH as a "redesign."** Swapping `#2563eb` to `oklch(0.48 0.18 265)` changes nothing visually. It's a code quality improvement, not a design improvement. Never present token format changes as visual improvements.
- **Adding hover translateY + shadow-lg to every card.** `hover:-translate-y-0.5 hover:shadow-lg transition-all` on cards is the universal AI "make it feel interactive" pattern.
- **Staggered entrance animations on stat cards.** `animation-delay: 75ms, 150ms, 225ms, 300ms` on a row of cards. Real dashboards load content instantly; they don't choreograph card entrances.

### Why These Are Banned

These patterns emerged because AI models (including this one) were trained on thousands of examples of modern SaaS dashboards, and these are the statistical median of those examples. They represent the AVERAGE of all dashboards, which means they look like NO specific dashboard. A human designer makes opinionated choices. AI makes average choices. The patterns above are the most average choices possible.

---

## The AI Slop Fingerprint

Any 3 or more of these together = AI slop. Stop and redesign.

- Inter/Roboto + purple-to-blue gradient + centered hero + 3 equal feature cards + "Build the future of work" headline
- `bg-indigo-500` as default accent (the Tailwind feedback loop)
- Uniform 8px or 16px border-radius on everything
- Generic `box-shadow: 0 4px 6px rgba(0,0,0,0.1)` on every card
- Same page structure: hero > 3 cards > testimonials > pricing > CTA
- Gradient text (`background-clip: text`) that fails accessibility
- Abstract 3D blobs or stock photos of people smiling at laptops
- Everything perfectly centered on a vertical axis
- Uniform spacing with no density variation between sections
- Fade-in-on-scroll applied identically to every element
- Feature icons from Lucide/Heroicons in tinted circles
- "Trusted by 10,000+ teams" with grayed-out logos nobody recognizes
- **Gradient stat/hero cards** (colored background with white text in a row of plain cards)
- **Colored left/top border accents** on cards (border-l-4 with different colors per card)
- **Dark sidebar + gradient CTA button** combination
- **Rainbow-coded elements** (each item in a set gets a different color)
- **Colored icon badges** (icons inside tinted rounded containers)
- **hover:-translate-y + shadow-lg** on every interactive card

**The test:** Show someone a screenshot without context. If they say "AI-generated" in 3 seconds, it fails. The fingerprint is not any single choice -- it is the combination of defaults that signals zero human judgment.

---

## Typography Anti-Patterns

- **Inter everywhere.** Signals "I did not think about fonts."
- **Roboto, Arial, Helvetica, system-ui as primary.** System defaults, not design decisions.
- **Space Grotesk on repeat.** Overused in AI/crypto contexts.
- **Light (300) weight for body text.** Hard to read. 400 minimum for body, 500+ for small text.
- **Centered paragraphs.** Center alignment works for 1-2 lines only. Never for body text.
- **No max-width on text.** Cap at 600-750px for body (45-75 characters per line).
- **All caps without letter-spacing.** Needs 0.08-0.15em spacing to be legible.
- **More than 3 font families.** Two is ideal. Three is the maximum.
- **Font size under 14px for body text.** 16px is a safe default.
- **Same font weight for everything.** Use at least 3 distinct weights for hierarchy.
- **Line-height of 1.5 for all text.** Headings: 1.1-1.2. Body: 1.5-1.7. Small text: 1.6-1.8.
- **No optical size adjustment.** Display text: lighter weight, tighter tracking. Small UI text: heavier, looser tracking.

---

## Color Anti-Patterns

- **Purple/indigo/violet gradient on ANY surface.** The signature AI slop aesthetic. If your first instinct is purple-to-blue, STOP. This includes stat cards, hero sections, CTAs, sidebars, and buttons. The entire indigo-to-violet spectrum is burned.
- **`bg-indigo-500`, `bg-violet-500`, `bg-purple-500` as primary.** The Tailwind default palette trap. Also banned: `from-indigo-* to-violet-*` gradients.
- **Gradient backgrounds on data cards/stat cards.** Stat cards should display data clearly. A gradient background with white text is decoration that hurts readability. Use flat backgrounds with colored text accents if needed.
- **Different colored borders per card in a set.** If you have 4 stat cards, they should NOT each have a different colored left/top border. That's the AI rainbow pattern. Use consistent, subtle borders.
- **Pure black text (#000000).** Use tinted near-black (e.g., `oklch(0.15 0.02 260)`).
- **Pure gray (#808080, #cccccc).** Tint neutrals toward the palette hue.
- **Gray text on colored backgrounds.** Low contrast, washed out. Use white or a very light tint.
- **Full-saturation brand colors for large surfaces.** Reserve max chroma for small accents. Large areas need reduced saturation.
- **Too many accent colors.** One primary, one secondary maximum. A dashboard should have ONE accent color, not four.
- **Using opacity instead of actual color values.** `opacity:0.5` creates inconsistent results. Define explicit tokens.
- **No dark mode consideration.** Use CSS custom properties from the start.
- **Gradient text without a solid fallback.** Breaks in selection, high contrast mode, some browsers.
- **Rainbow or multi-stop gradients.** Two stops maximum. Four or more is a circus.
- **"Professional" = dark sidebar.** A dark sidebar is not inherently more professional. It's become a cliche. Study what the user's ACTUAL competitors do. Most legal/accounting/business SaaS uses light sidebars (Clio, QuickBooks, Xero, PracticePanther).

---

## Layout Anti-Patterns

- **Everything centered vertically and horizontally.** Creates a lifeless vertical highway. Use left-aligned content with intentional centering.
- **Three-column equal-width feature grid as default.** The most common AI layout. Make one card dominant (2:1 split) or use a different structure.
- **Same page structure every time.** Hero > cards > testimonials > pricing > CTA. Break the pattern: split-screen, bento grid, horizontal scroll, text-as-hero.
- **No spatial surprises.** Every section on the same grid. Professional sites break the grid -- full-bleed images, asymmetric splits, oversized pull quotes.
- **No density variation.** Some sections should feel spacious (hero, CTA), others dense (feature lists, data tables, pricing).
- **No overlapping elements or grid breaks.** Elements that bleed outside containers add depth and interest.
- **Uniform card sizing in grids.** Primary item should be visually dominant. Featured card taller/wider.
- **Cards nested inside cards.** One level is usually enough.
- **Wrapping everything in cards.** Sometimes flat sections, dividers, or whitespace work better.
- **Equal spacing everywhere.** Groups need tighter internal spacing and wider external spacing.
- **Content that could belong to any product.** If the layout has no personality, the design is not done.
- **Sticky header over 80px.** Keep slim (48-56px) or hide on scroll-down.

---

## Shadow Anti-Patterns

- **Same shadow on every elevated element.** `shadow-md` on cards, modals, dropdowns, and buttons is not a system.
- **No shadow hierarchy.** Define 3-4 levels: subtle (tooltips), moderate (cards, dropdowns), dramatic (modals, drawers).
- **Shadows invisible in dark mode.** `rgba(0,0,0,0.1)` disappears on dark backgrounds. Use inner glows, border effects, or background lightness differentiation.
- **Shadows instead of background-color for elevation.** Elevation is often better communicated through surface tint, not shadows.
- **Hard-edged shadows.** Small blur + high opacity = 2005. Modern shadows: large blur (20-40px), low opacity (0.03-0.08).
- **Colored shadows that do not match the element.** A blue button with gray shadow looks disconnected. Use the element's hue at low opacity.

---

## Border Radius Anti-Patterns

- **Uniform 8px or 16px on everything.** Border radius is a system, not one value.
- **No hierarchy.** Pills for tags (999px), generous for modals (16-24px), subtle for cards (8-12px), sharp for data (2-4px), sharp for marketing (0-2px).
- **Nested radius not accounting for padding.** Inner radius = outer radius minus padding. Card with `16px` radius and `8px` padding = inner element at `8px` radius.
- **Rounded corners on elements flush with container edges.** Touching corners should be 0 radius.
- **Mixing rounded and sharp in the same component.** Button at `8px` next to input at `0px` = two design systems colliding.

---

## Motion Anti-Patterns

- **Bounce/elastic easing.** Dated. Use ease-out for entrances, ease-in for exits.
- **Animating everything.** Animate important moments only: state changes, entrances, user-initiated actions.
- **transition: all 0.3s.** Be specific: `transition: opacity 0.2s ease-out, transform 0.3s ease-out`.
- **Uniform fade-in-on-scroll.** Stagger timing. Vary animation type. Let some elements just be there.
- **No loading feedback.** Always show progress on async actions.
- **Spinner for content areas.** Use skeleton screens. Spinners for small inline actions only.
- **No prefers-reduced-motion handling.** Wrap motion in `@media (prefers-reduced-motion: no-preference)`.
- **Duration over 500ms for UI transitions.** 150-300ms for most interactions. 300-500ms for large layout changes.
- **Animating layout properties (width, height, top, left).** Triggers reflows. Animate `transform` and `opacity` only.

---

## Interaction Anti-Patterns

- **Placeholder text as the only label.** Disappears on focus. Inaccessible.
- **outline: none without replacement.** Replace with a custom focus ring, never remove it.
- **Hover-only interactions.** Must have keyboard and touch equivalents.
- **Custom scrollbars that break native behavior.** Custom thin scrollbars fine. Custom scroll physics not.
- **Toast notifications for errors.** They disappear. Use inline errors. Toasts for confirmations only.
- **Alert/confirm dialogs for minor actions.** Do not block the page for non-destructive actions.
- **No focus trapping in modals.** Tab key must stay within the modal.
- **Links that look like buttons, buttons that look like links.** `<a>` navigates. `<button>` acts.
- **Disabled buttons with no explanation.** Show inline validation or tooltip for why the action is unavailable.
- **Click targets smaller than 44x44px on mobile.** 44px minimum per Apple and Google guidelines.

---

## Content / Copy Anti-Patterns

- **"Lorem ipsum" in final deliverables.** Design without content is decoration.
- **Stock photo people smiling at laptops.** Use contextual illustrations, product screenshots, or abstract art.
- **"Click here" link text.** Describe the destination: "View documentation."
- **"Submit" button text.** Use the specific action: "Create account", "Send message", "Save changes."
- **Walls of text without hierarchy.** Break with headings, spacing, and visual rhythm.
- **Generic headlines.** "Build the future of work." "Your all-in-one platform." "Scale without limits." These say nothing. Use a specific value proposition.
- **AI-telltale words.** "Delve", "pivotal", "seamless", "leverage", "cutting-edge", "elevate", "harness", "robust", "streamline", "utilize." If you would not say it in conversation, do not write it.
- **Hedge language.** "May help you", "might improve." Commit to the claim or do not make it.
- **Unrealistic demo data.** Not $1M revenue and 99.99% uptime. Use $47,230 and 99.93%. Not "John Doe" -- use "Sarah Chen" or "Marcus Rivera."
- **Broken Unsplash placeholder links.** `unsplash.com/random` links rot. Use solid color blocks or local assets.
- **Exclamation marks in UI copy.** "Welcome!" "Success!" Save enthusiasm for genuinely exciting moments.

---

## Code Anti-Patterns

- **div soup.** Use semantic HTML: `nav`, `main`, `section`, `article`, `aside`, `header`, `footer`.
- **Inline styles for everything.** Use CSS variables, modules, or Tailwind.
- **!important everywhere.** If needed, the CSS architecture is broken.
- **z-index: 9999.** Use a scale with named variables: `--z-dropdown: 10`, `--z-modal: 20`, `--z-toast: 30`.
- **Fixed pixel values for everything.** `rem` for typography/spacing, `em` for component internals, `px` for borders/shadows.
- **console.log left in production.**
- **Tailwind class strings over 200 characters.** Extract to a component or use `@apply`.
- **Hardcoded color values instead of CSS custom properties.** `bg-[#6366f1]` in 40 files means 40 edits for a brand change.
- **No responsive behavior.** Test at 320px, 768px, and 1440px minimum.

---

## The Overall Pattern to Avoid

The AI slop aesthetic: Inter/Roboto + purple/blue gradient + centered layouts + uniform card grids + identical rounded corners + generic shadows + stock imagery. Any single element is fine in isolation. Together they signal zero human judgment.

The antidote is intentionality. Every choice -- font, color, spacing, layout, animation, shadow, radius, copy -- should be a conscious decision tied to the specific context. If you cannot explain why you chose it, you defaulted.

---

## Professional Alternatives (Quick Reference)

| AI Default | Professional Alternative |
|---|---|
| Inter / Roboto | Satoshi, Cabinet Grotesk, Plus Jakarta Sans, Outfit, General Sans, Switzer |
| Purple-to-blue gradient | Single brand hue + tinted neutrals (monochromatic palette). NO gradients on data surfaces. |
| Gradient stat/hero card | Flat card with subtle text color accent. Data cards should be quiet -- let the numbers speak. Study Stripe Dashboard, Linear, or Notion for how to do stat cards without gradients. |
| Colored border per card | Uniform subtle borders on all cards. ONE accent color for the most important metric only, applied to the VALUE text, not the card border/background. |
| Dark sidebar + gradient CTA | Match the sidebar to the existing app theme. Light sidebar for business/legal/finance apps. CTA buttons use solid primary color, never gradients. |
| 3-column equal cards | Asymmetric grid with primary card dominant (2:1 or 3:2 split) -- but NOT via gradient background. Dominance through size, position, or typography weight. |
| Centered everything | Left-aligned content with intentional centering for heroes/CTAs only |
| Uniform 8px radius | Context-appropriate: 0-2px marketing, 8-12px cards, 16-24px modals, 999px tags |
| `0 4px 6px rgba(0,0,0,0.1)` | Elevation-based shadow scale with 3-4 distinct levels |
| Hero > Cards > Testimonials > CTA | Split-screen, bento grid, horizontal scroll, text-as-hero, editorial layout |
| Fade-in everything identically | No entrance animations on data. Static content loads statically. Animate only user-initiated transitions. |
| "Scale without limits" | Specific claim with real metric: "Process 10k invoices in 3 minutes" |
| `bg-indigo-500` accent | A hue reflecting the brand, not Tailwind's default palette. For business/legal: deep blue, forest green, warm brown, or slate -- NOT indigo/violet. |
| Icons in colored circles | Icons inline with text at muted color. No tinted backgrounds on icon containers. |
| hover:-translate-y + shadow-lg | Subtle background color change on hover (`hover:bg-muted`). No lifting, no shadow changes. |
| "Trusted by 10,000+ teams" | Real customer logos with permission, or skip entirely |
| Uniform section spacing | Varied density: spacious heroes, dense feature grids, breathing room at CTAs |
| Same shadow on everything | Shadow hierarchy: none flat, subtle cards, medium dropdowns, heavy modals |
| Stock laptop photos | Product screenshots, hand-drawn illustrations, or abstract geometric art |

## The Restraint Principle

The best professional SaaS designs (Linear, Notion, Stripe, Vercel) share one trait: **restraint**. They use:
- ONE accent color, applied sparingly (a button, a selected state, a link)
- Flat, borderless or very subtle bordered cards
- No gradients on data surfaces
- No colored icon badges
- No entrance animations on static content
- Mostly neutral palette with tiny pops of color
- The SAME card style for all cards (not one "hero" and three "normal")

The AI instinct is to ADD visual elements (gradients, colors, animations, borders, shadows). The professional instinct is to REMOVE them. When in doubt, make it quieter, not louder.
