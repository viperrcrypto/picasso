# Visual Preview Reference

Generate self-contained HTML previews to show users what design options look like before they commit. This replaces text-only descriptions with actual visual examples.

---

## 1. The Preview Protocol

Every time Picasso presents 2+ aesthetic options for the user to choose from, generate a visual preview. Text-only option lists are banned for aesthetic decisions.

### Standard Flow

1. **Generate** a self-contained HTML file with inline styles (NO external font imports -- use `system-ui` with font name labels)
2. **Write** to `/tmp/picasso-preview-{name}.html`
3. **Screenshot** via Bash: `npx playwright screenshot /tmp/picasso-preview-{name}.html /tmp/picasso-preview-{name}.png --viewport-size=1200,800`
   - `npx playwright screenshot` accepts file paths directly (no `file://` prefix needed)
   - Do NOT use `mcp__playwright__browser_navigate` + `mcp__playwright__browser_take_screenshot` -- these timeout on external font loading and block `file://` protocol
4. **View** the screenshot with `Read /tmp/picasso-preview-{name}.png` (mandatory -- never skip this)
5. **Present** to the user with both paths (HTML for full-res browser viewing, PNG for quick preview)

### If npx playwright Is Unavailable

1. Write the HTML file to `/tmp/`
2. Tell the user: "I've generated a visual preview at `/tmp/picasso-preview-{name}.html` -- open it in your browser to see the options."
3. Do NOT make visual claims about what the preview looks like without viewing it

### Font Rule for Previews

Do NOT import Google Fonts or Fontshare fonts via `<link>` or `@import` in preview HTML. External font loading causes screenshot timeouts. Instead:
- Use `system-ui, -apple-system, sans-serif` for body text
- Use `Georgia, serif` for serif directions
- Use `ui-monospace, monospace` for mono directions
- **Label the intended font** in each preview card: "Font: Satoshi + DM Sans" so the user knows what will be used in the real implementation

### File Naming

- Interview aesthetics: `/tmp/picasso-interview-vibes.html`
- Design brief preview: `/tmp/picasso-brief-preview.html`
- Variants comparison: `/tmp/picasso-variants.html`
- Mood preview: `/tmp/picasso-mood-{word}.html`
- Preset browser: `/tmp/picasso-preset-browser.html`
- Standalone preview: `/tmp/picasso-preview.html`

---

## 2. HTML Template: Side-by-Side Direction Comparison

Use this when showing 2-4 aesthetic directions for the user to choose from (interview, /variants, /preview compare).

Generate the full HTML dynamically. For each direction, substitute the actual font, colors, radius, and spacing values. The template below is a structural guide -- adapt the content to match each specific direction.

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Picasso: Choose a Direction</title>
<!-- Import fonts for all directions shown -->
<!-- No external font imports -- use system fonts to avoid screenshot timeouts -->
<!-- Label intended fonts in the .font-info footer of each card -->
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body {
    font-family: system-ui, sans-serif;
    background: #f5f5f5;
    padding: 32px;
    color: #1a1a1a;
  }
  h1 {
    text-align: center;
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 8px;
    letter-spacing: -0.02em;
  }
  .subtitle {
    text-align: center;
    font-size: 13px;
    color: #666;
    margin-bottom: 32px;
  }
  .grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(340px, 1fr));
    gap: 24px;
    max-width: 1200px;
    margin: 0 auto;
  }
  .direction {
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 12px rgba(0,0,0,0.08);
  }
  .direction-label {
    padding: 12px 16px;
    font-size: 13px;
    font-weight: 600;
    letter-spacing: 0.05em;
    text-transform: uppercase;
    background: #fff;
    border-bottom: 1px solid #eee;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .direction-label span {
    font-size: 11px;
    font-weight: 400;
    text-transform: none;
    letter-spacing: 0;
    color: #999;
  }
  /* Each .preview is a mini page rendered in the direction's style */
  .preview {
    padding: 24px;
    min-height: 400px;
    display: flex;
    flex-direction: column;
    gap: 16px;
  }
  /* Palette strip */
  .palette {
    display: flex;
    gap: 4px;
    height: 24px;
    border-radius: 4px;
    overflow: hidden;
  }
  .palette .swatch {
    flex: 1;
    position: relative;
  }
  /* Sample nav */
  .sample-nav {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 8px 0;
  }
  .sample-nav .logo {
    font-weight: 700;
    font-size: 15px;
  }
  .sample-nav .links {
    display: flex;
    gap: 16px;
    font-size: 12px;
    opacity: 0.6;
  }
  /* Sample card */
  .sample-card {
    padding: 16px;
    display: flex;
    flex-direction: column;
    gap: 8px;
  }
  .sample-card h3 {
    font-size: 16px;
    font-weight: 600;
  }
  .sample-card p {
    font-size: 12px;
    line-height: 1.6;
    opacity: 0.7;
  }
  /* Sample button */
  .sample-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 8px 20px;
    font-size: 12px;
    font-weight: 600;
    border: none;
    cursor: pointer;
    width: fit-content;
  }
  /* Sample input */
  .sample-input {
    padding: 8px 12px;
    font-size: 12px;
    border: 1px solid;
    background: transparent;
    width: 100%;
  }
  /* Font info footer */
  .font-info {
    font-size: 10px;
    opacity: 0.4;
    padding-top: 8px;
    border-top: 1px solid;
    border-color: inherit;
  }
</style>
</head>
<body>

<h1>Choose a Direction</h1>
<p class="subtitle">Pick one, combine elements, or describe something different.</p>

<div class="grid">

  <!-- Direction A -->
  <div class="direction">
    <div class="direction-label">
      A: {DIRECTION_A_NAME}
      <span>{DIRECTION_A_VIBE}</span>
    </div>
    <div class="preview" style="background: {A_BG}; color: {A_TEXT}; font-family: '{A_BODY_FONT}', sans-serif;">
      <div class="palette">
        <div class="swatch" style="background: {A_COLOR_1};"></div>
        <div class="swatch" style="background: {A_COLOR_2};"></div>
        <div class="swatch" style="background: {A_COLOR_3};"></div>
        <div class="swatch" style="background: {A_COLOR_4};"></div>
        <div class="swatch" style="background: {A_COLOR_5};"></div>
      </div>
      <div class="sample-nav">
        <div class="logo" style="font-family: '{A_HEADING_FONT}', sans-serif;">AppName</div>
        <div class="links">Features &nbsp; Pricing &nbsp; Docs</div>
      </div>
      <div style="font-family: '{A_HEADING_FONT}', sans-serif; font-size: 22px; font-weight: 700; line-height: 1.2; letter-spacing: -0.02em;">
        Build something people actually want
      </div>
      <div style="font-size: 13px; line-height: 1.6; opacity: 0.7;">
        A short description that shows what body text looks like in this direction. Notice the font, weight, and spacing.
      </div>
      <div class="sample-card" style="background: {A_SURFACE}; border-radius: {A_RADIUS};">
        <h3 style="font-family: '{A_HEADING_FONT}', sans-serif;">Sample Card</h3>
        <p>This is how cards look in this direction. Pay attention to padding, radius, and depth.</p>
      </div>
      <div style="display: flex; gap: 8px;">
        <div class="sample-btn" style="background: {A_PRIMARY}; color: {A_PRIMARY_TEXT}; border-radius: {A_RADIUS};">
          Primary Action
        </div>
        <div class="sample-btn" style="background: transparent; color: {A_TEXT}; border: 1px solid {A_BORDER}; border-radius: {A_RADIUS};">
          Secondary
        </div>
      </div>
      <div class="sample-input" style="border-color: {A_BORDER}; border-radius: {A_RADIUS}; color: {A_TEXT};" placeholder="Input field...">
        Input field...
      </div>
      <div class="font-info">
        {A_HEADING_FONT} + {A_BODY_FONT} &middot; {A_RADIUS} radius
      </div>
    </div>
  </div>

  <!-- Repeat for Direction B, C, D... -->

</div>

</body>
</html>
```

### How to Use This Template

1. Do NOT copy-paste this template literally. Generate the HTML dynamically with actual values substituted for each direction.
2. Each `{PLACEHOLDER}` must be replaced with real values from the direction you're previewing.
3. The font `<link>` tag must include ALL fonts used across ALL directions being compared.
4. The number of directions (2, 3, or 4) determines the grid columns.
5. Keep the preview compact -- users should see all options without scrolling.

---

## 3. HTML Template: Full Page Mood Preview

Use this for /mood and Design Brief previews. Shows a complete page layout in the specified style.

Generate a full-page HTML that includes:
- A navigation bar with logo text, 3-4 links, and a CTA button
- A hero section with a large heading, subtitle, and primary button
- A 3-column feature/card section
- A form section with an input and button
- A footer with muted text

All styled with the mood's tokens (colors, fonts, radius, spacing). The content should be generic but realistic (not lorem ipsum). Size the page to 1440px viewport width.

---

## 4. HTML Template: Preset Browser Grid

Use this for /preset without arguments. Shows all presets as a browsable grid.

Generate an HTML page with:
- A title: "Picasso Style Presets"
- A grid of cards (4 columns, wrapping), one per preset
- Each card shows:
  - Preset name (in the preset's heading font)
  - A 5-swatch color palette strip
  - A one-line mood description
  - A tiny sample button in the preset's primary color and radius
- Cards should be ~280px wide, ~180px tall
- The card background should use the preset's surface color
- Card text should use the preset's text color

This gives users a visual catalog to browse before choosing.

---

## 5. Font Loading

### Google Fonts

Most fonts can be loaded via Google Fonts. Construct the URL:
```
https://fonts.googleapis.com/css2?family={FontName}:wght@400;600;700&display=swap
```

Replace spaces with `+` in font names.

### Fontshare (for fonts not on Google)

Some popular Picasso fonts are on Fontshare:
```
https://api.fontshare.com/v2/css?f[]=satoshi@400,500,700&display=swap
https://api.fontshare.com/v2/css?f[]=cabinet-grotesk@400,700,800&display=swap
https://api.fontshare.com/v2/css?f[]=general-sans@400,500,600&display=swap
https://api.fontshare.com/v2/css?f[]=clash-display@400,600,700&display=swap
```

### Common Font Mappings

| Font Name | Source | Import URL |
|-----------|--------|-----------|
| Satoshi | Fontshare | `https://api.fontshare.com/v2/css?f[]=satoshi@400,500,700&display=swap` |
| Cabinet Grotesk | Fontshare | `https://api.fontshare.com/v2/css?f[]=cabinet-grotesk@400,700,800&display=swap` |
| General Sans | Fontshare | `https://api.fontshare.com/v2/css?f[]=general-sans@400,500,600&display=swap` |
| Clash Display | Fontshare | `https://api.fontshare.com/v2/css?f[]=clash-display@400,600,700&display=swap` |
| Archivo Black | Google | `family=Archivo+Black&display=swap` |
| Manrope | Google | `family=Manrope:wght@300;400;500;600;700;800&display=swap` |
| Syne | Google | `family=Syne:wght@400;600;700;800&display=swap` |
| Space Mono | Google | `family=Space+Mono:wght@400;700&display=swap` |
| Cormorant | Google | `family=Cormorant:ital,wght@0,400;0,600;1,400&display=swap` |
| IBM Plex Sans | Google | `family=IBM+Plex+Sans:wght@300;400;500;600&display=swap` |
| DM Sans | Google | `family=DM+Sans:wght@400;500;600;700&display=swap` |
| Plus Jakarta Sans | Google | `family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap` |
| Outfit | Google | `family=Outfit:wght@300;400;500;600;700&display=swap` |
| Fraunces | Google | `family=Fraunces:ital,wght@0,400;0,600;1,400&display=swap` |
| Work Sans | Google | `family=Work+Sans:wght@400;500;600;700&display=swap` |
| JetBrains Mono | Google | `family=JetBrains+Mono:wght@400;500;700&display=swap` |
| Bodoni Moda | Google | `family=Bodoni+Moda:ital,wght@0,400;0,700;1,400&display=swap` |
| Inter | Google | `family=Inter:wght@400;500;600;700&display=swap` |
| Geist | Local/Vercel | Use `system-ui` as fallback in previews |

### Fallback Rule

If a font fails to load (offline, CORS, not available), the preview should still render correctly using `system-ui, -apple-system, sans-serif` as fallback. The font name should be displayed in the `.font-info` footer so the user knows what was intended.

---

## 6. The Show-Don't-Tell Rule

| Decision Type | Show Visual? | Why |
|---------------|-------------|-----|
| Aesthetic direction / vibe | YES | Users can't imagine "Bold Signal" from text |
| Color palette | YES | Hex values mean nothing without seeing them |
| Font pairing | YES | Font names mean nothing without rendering them |
| Layout structure | YES | "Asymmetric grid" means different things to everyone |
| Animation intensity | NO | Must be experienced in running code, not a static preview |
| Mobile priority level | NO | A number (1-5) is sufficient |
| Accessibility level | NO | A standard (AA/AAA) is sufficient |
| Performance budget | NO | A number is sufficient |
| Sound/haptics | NO | Must be experienced in running code |

The rule: if the decision involves how something LOOKS, show it. If it involves behavior, policy, or priority, text is fine.
