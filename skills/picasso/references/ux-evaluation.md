# UX Evaluation Reference

Structured frameworks for evaluating interface quality. Use these during /score, /roast, /audit, and the visual discovery crawl phase.

---

## 1. Nielsen's 10 Usability Heuristics (Evaluation Checklist)

For each heuristic, check the listed indicators. Score pass/fail for each.

### H1: Visibility of System Status
The system should always keep users informed about what is going on.
- [ ] Loading states exist for async actions (skeletons, spinners, progress bars)
- [ ] Form submission shows pending/success/error feedback
- [ ] Current page/section is highlighted in navigation
- [ ] Active filters/sorts are visually indicated
- [ ] Upload progress is shown
- **Check in code:** grep for loading states, skeleton components, progress indicators
- **Check in screenshot:** is the current nav item highlighted? Are there loading indicators?

### H2: Match Between System and Real World
Use language and concepts familiar to the user, not system-oriented terms.
- [ ] Button labels use verbs the user understands ("Save changes" not "Submit")
- [ ] Error messages explain the problem in plain language
- [ ] Navigation labels match user mental models
- [ ] Icons are conventional (trash = delete, pencil = edit, plus = add)
- **Check in code:** grep for generic labels ("Submit", "Click here", "Data")

### H3: User Control and Freedom
Users need a clear emergency exit when they make mistakes.
- [ ] Modals have close buttons AND escape key support
- [ ] Destructive actions have confirmation OR undo
- [ ] Multi-step flows have back navigation
- [ ] Users can cancel in-progress operations
- **Check in code:** grep for confirm() dialogs, undo patterns, modal close handlers

### H4: Consistency and Standards
Follow platform conventions. Same action = same result everywhere.
- [ ] Primary buttons look the same across all pages
- [ ] Same icon means the same thing everywhere
- [ ] Spacing and typography follow a consistent scale
- [ ] Color meanings are consistent (red = error, green = success)
- **Check in code:** grep for hardcoded colors, inconsistent button styles

### H5: Error Prevention
Prevent problems from occurring in the first place.
- [ ] Required fields are marked before submission
- [ ] Date inputs use pickers (not free text)
- [ ] Destructive buttons are visually distinct (red/outlined, not primary)
- [ ] Inline validation catches errors before form submission
- **Check in code:** grep for required fields, inline validation, input types

### H6: Recognition Rather Than Recall
Minimize memory load. Make options visible.
- [ ] Navigation is always visible (not hidden behind hamburger on desktop)
- [ ] Search results show context around matches
- [ ] Forms show labels (not placeholder-only)
- [ ] Recent items, favorites, or shortcuts are available
- **Check in screenshot:** are labels visible? Is navigation persistent?

### H7: Flexibility and Efficiency of Use
Allow experts to speed up their workflow.
- [ ] Keyboard shortcuts exist for frequent actions
- [ ] Bulk operations are available for lists
- [ ] Command palette or search exists (Cmd+K)
- [ ] Default values are intelligent
- **Check in code:** grep for keyboard event listeners, bulk action patterns

### H8: Aesthetic and Minimalist Design
Every extra element competes with relevant information.
- [ ] No decorative elements that don't serve a purpose
- [ ] Information hierarchy is clear (most important = most prominent)
- [ ] White space is used to group related elements
- [ ] No more than 3-4 colors for data categories
- **Check in screenshot:** squint test -- does hierarchy still read?

### H9: Help Users Recognize, Diagnose, and Recover from Errors
Error messages should be in plain language, indicate the problem, and suggest a fix.
- [ ] Error messages follow: what happened + why + how to fix
- [ ] Form errors appear next to the relevant field
- [ ] API errors don't show raw technical messages to users
- [ ] Empty states guide the user on what to do next
- **Check in code:** grep for error handling, error messages, empty states

### H10: Help and Documentation
Even though a system should be usable without docs, help should be available.
- [ ] Tooltips explain non-obvious UI elements
- [ ] Onboarding exists for first-time users
- [ ] Complex features have inline help or documentation links
- [ ] Keyboard shortcuts are discoverable
- **Check in code:** grep for tooltip components, help text, onboarding flows

---

## 2. Jobs to Be Done (JTBD) Framework

Use JTBD to understand WHY users interact with the app, not just WHAT they do. This informs design decisions during the crawl phase.

### Extracting JTBD from Code

Analyze the codebase to identify user jobs:

1. **Route structure** reveals user tasks:
   - `/dashboard` = "When I start my day, I want to see what needs attention"
   - `/clients/[id]` = "When I work on a client, I want all their info in one place"
   - `/billing` = "When I need to invoice, I want to track time and generate bills"
   - `/analyze` = "When I receive a contract, I want to understand the risks"

2. **API endpoints** reveal user actions:
   - POST /api/clients = "I want to onboard a new client"
   - POST /api/analyze = "I want AI to review this document"
   - GET /api/dashboard = "I want a summary of my practice"

3. **Component names** reveal UI functions:
   - `<ClientForm>` = data entry job
   - `<TimerWidget>` = time tracking job
   - `<RedlineView>` = document review job

### Using JTBD to Inform Design

For each identified job, ask:
- **What's the trigger?** When does the user need to do this?
- **What's the desired outcome?** What does success look like?
- **What's the anxiety?** What could go wrong?
- **What's the context?** Where/when do they do this? (mobile? desktop? in a meeting?)

Design decisions should optimize for the job:
- High-frequency jobs need the fastest path (fewest clicks, most prominent placement)
- High-stakes jobs need the most clarity (larger text, explicit confirmation, clear feedback)
- Time-pressured jobs need efficiency (keyboard shortcuts, bulk actions, smart defaults)

---

## 3. Prompt Enhancement

When a user gives a vague design request, enhance it before proceeding.

### Vague-to-Specific Mapping

| User Says | What They Mean | What to Do |
|-----------|---------------|------------|
| "Make it look good" | It looks amateur, fix the obvious issues | Run /audit, fix critical+high |
| "Make it modern" | It looks dated, update the aesthetic | Check font (is it Arial?), colors (pure gray?), radius (sharp corners?) |
| "Make it clean" | Too much visual noise, simplify | Remove decorative elements, increase whitespace, reduce color count |
| "Make it pop" | Not enough visual hierarchy, too flat | Increase contrast, add depth, strengthen heading sizes |
| "Make it professional" | It looks like a student project | Fix typography scale, add consistent spacing, tighten color palette |
| "I don't know what I want" | They need visual discovery | Generate the 10-20 sample gallery and let them react |

### Enhancement Process

1. Identify the complaint (what's wrong) vs. the goal (what they want)
2. Map to specific design properties (typography, color, spacing, layout, motion)
3. Propose concrete changes with before/after preview
4. Never ask "what do you mean by modern?" -- instead, show 3 interpretations and ask which fits

---

## 4. State Machine for Interactive Components

Map all states for each interactive element. Missing states are the #1 source of unpolished UI.

### The 8 States

Every interactive element should define:

| State | Visual Treatment | Trigger |
|-------|-----------------|---------|
| **Default** | Base appearance | Page load |
| **Hover** | Subtle background/border change | Mouse enters |
| **Focus** | Visible ring/outline (2px+ solid) | Tab navigation |
| **Active/Pressed** | Scale down slightly (0.97-0.98) | Mouse down |
| **Disabled** | Reduced opacity (0.5), no pointer | Programmatic |
| **Loading** | Spinner or pulse, disabled interaction | Async action |
| **Error** | Red border/text, error message | Validation fail |
| **Success** | Green indicator, confirmation | Action complete |

### Audit Checklist

For each component type, verify states exist:

| Component | States to Check |
|-----------|----------------|
| Button | default, hover, focus, active, disabled, loading |
| Input | default, hover, focus, filled, error, disabled |
| Card (clickable) | default, hover, focus, active |
| Link | default, hover, focus, visited |
| Toggle | off, on, hover, focus, disabled |
| Select | default, hover, focus, open, selected, error |
| Modal | enter, exit, backdrop |

---

## 5. Scoring with Heuristics

When running /score, add heuristic evaluation points:

```
Heuristic Evaluation (0-20 pts):
  H1 System status:    /2  (loading states, feedback)
  H2 Real world match: /2  (language, icons)
  H3 User control:     /2  (undo, escape, back)
  H4 Consistency:      /2  (styles, patterns)
  H5 Error prevention: /2  (validation, confirmation)
  H6 Recognition:      /2  (labels, navigation)
  H7 Efficiency:       /2  (shortcuts, bulk ops)
  H8 Minimal design:   /2  (hierarchy, whitespace)
  H9 Error recovery:   /2  (messages, guidance)
  H10 Help:            /2  (tooltips, onboarding)
```

This replaces the ad-hoc accessibility scoring with a structured UX evaluation.
