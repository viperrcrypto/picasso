Run the Picasso /backlog command -- create and manage a persistent design debt backlog.

Create or update `.picasso-backlog.md` in the project root.

Steps:
1. Run /quick-audit to get current pass/fail status
2. Run /score to get quantified baseline
3. For each failing category, create a backlog item with:
   - Severity: critical / high / medium / low
   - Impact: estimated /score improvement (+N points)
   - Files: which files need changes
   - Fix: one-line description of what to change
4. Sort items by impact descending (highest score improvement first)
5. Write to `.picasso-backlog.md`

Format:
```markdown
# Picasso Design Backlog
Generated: [date] | Baseline Score: [N]/100

## Critical
- [ ] **Replace pure grays with tinted neutrals** (+6 pts) — globals.css, tailwind.config — Change #808080 to oklch(0.55 0.02 var(--hue))

## High
- [ ] **Add prefers-reduced-motion guard** (+4 pts) — globals.css — Wrap animations in @media (prefers-reduced-motion: no-preference)

## Medium
- [ ] **Fix transition:all instances** (+2 pts) — 3 files — Specify exact properties

## Low
- [ ] **Add skip link** (+1 pt) — layout.tsx — Add visually hidden skip-to-content link
```

If `.picasso-backlog.md` already exists, update it: mark completed items as done, add new findings, recalculate impacts.
