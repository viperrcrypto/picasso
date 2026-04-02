#!/bin/bash
# Binary evaluation script for DesignWIZ autoresearch loop
# Usage: ./evaluate.sh <file.tsx> [experiment_name]
# Returns: JSON with pass/fail for each criterion + total score

FILE="$1"
EXPERIMENT="${2:-baseline}"
TIMESTAMP=$(date +%Y-%m-%dT%H:%M:%S)

if [ ! -f "$FILE" ]; then
  echo "Error: File not found: $FILE" >&2
  exit 1
fi

CONTENT=$(cat "$FILE")
PASS=0
FAIL=0
RESULTS=""

# --- Criterion 1: Non-banned font (not Inter/Roboto/Arial/Helvetica) ---
# Check if banned fonts appear as the FIRST/PRIMARY font in declarations
# Fallback stacks like "'Satoshi', system-ui, sans-serif" are OK
BANNED_FONT=0
# Tailwind: font-inter, font-roboto etc
echo "$CONTENT" | grep -qiE "font-(inter|roboto|arial|helvetica)\b" && BANNED_FONT=1
# Inline CSS: banned font as FIRST in font-family (before any comma)
echo "$CONTENT" | grep -qiE "(fontFamily|font-family)[^;:]*:[^;]*['\"]?(Inter|Roboto|Arial|Helvetica|system-ui)['\"]?\s*[,;'\"]" 2>/dev/null && BANNED_FONT=1
# Check if banned font appears FIRST in a quoted font stack
echo "$CONTENT" | grep -qiE "['\"]\\s*(Inter|Roboto|Arial|Helvetica)\\s*['\"]\\s*," && BANNED_FONT=1
# But DON'T flag if a non-banned font appears BEFORE the banned one
# Extract primary fonts (first font in each font-family/fontFamily declaration)
PRIMARY_FONTS=$(echo "$CONTENT" | grep -oiE "(fontFamily|font-family)[^;:]*:[^;]*" | head -5)
if echo "$PRIMARY_FONTS" | grep -qiE "['\"](Inter|Roboto|Arial|Helvetica)['\"]" 2>/dev/null; then
  # Check if there's a non-banned font BEFORE the banned one
  if echo "$PRIMARY_FONTS" | grep -qiE "['\"](Satoshi|Cabinet|Plus Jakarta|Outfit|Instrument|General Sans|Clash|DM Sans|Geist|Manrope|Sora|Poppins|Nunito|Lato|Source|Fira|JetBrains|IBM Plex)" 2>/dev/null; then
    BANNED_FONT=0  # Non-banned font is primary, banned is just fallback
  fi
fi
if [ $BANNED_FONT -eq 0 ]; then
  C1="PASS"; ((PASS++))
else
  C1="FAIL"; ((FAIL++))
fi

# --- Criterion 2: Colors in OKLCH (not hex/HSL as primary) ---
# Count oklch vs hex/hsl color declarations
OKLCH_COUNT=$(echo "$CONTENT" | grep -oiE 'oklch\(' | wc -l | tr -d ' ')
HEX_COUNT=$(echo "$CONTENT" | grep -oE '#[0-9a-fA-F]{3,8}\b' | wc -l | tr -d ' ')
HSL_COUNT=$(echo "$CONTENT" | grep -oiE 'hsl[a]?\(' | wc -l | tr -d ' ')
RGB_COUNT=$(echo "$CONTENT" | grep -oiE 'rgb[a]?\(' | wc -l | tr -d ' ')
# Exclude common non-color hex (like tailwind opacity, z-index references)
NON_OKLCH=$((HEX_COUNT + HSL_COUNT + RGB_COUNT))
if [ "$OKLCH_COUNT" -gt 0 ] && [ "$OKLCH_COUNT" -ge "$NON_OKLCH" ]; then
  C2="PASS"; ((PASS++))
else
  C2="FAIL"; ((FAIL++))
  C2_NOTE="oklch:$OKLCH_COUNT hex:$HEX_COUNT hsl:$HSL_COUNT rgb:$RGB_COUNT"
fi

# --- Criterion 3: AI-detection 3-second test (proxy: slop pattern count) ---
# Count AI-slop fingerprints. 3+ = FAIL
SLOP=0
# Purple/blue gradient
echo "$CONTENT" | grep -qiE '(from-purple|to-blue|from-indigo|purple.*blue.*gradient|bg-gradient.*purple)' && ((SLOP++))
# bg-indigo-500 or bg-purple-600 defaults
echo "$CONTENT" | grep -qiE 'bg-(indigo|purple)-(500|600)' && ((SLOP++))
# 3 equal grid columns (grid-cols-3 with identical children pattern)
echo "$CONTENT" | grep -qiE 'grid-cols-3' && ((SLOP++))
# Centered everything pattern
CENTERED=$(echo "$CONTENT" | grep -ciE '(text-center|items-center|justify-center|mx-auto)' | tr -d ' ')
[ "$CENTERED" -gt 8 ] && ((SLOP++))
# Generic shadows on everything
SHADOW_COUNT=$(echo "$CONTENT" | grep -ciE 'shadow-(sm|md|lg|xl)' | tr -d ' ')
[ "$SHADOW_COUNT" -gt 5 ] && ((SLOP++))
# Lucide icons in tinted circles
echo "$CONTENT" | grep -qiE '(rounded-full.*bg-.*Icon|Icon.*rounded-full.*bg-)' && ((SLOP++))
# AI-telltale copy
echo "$CONTENT" | grep -qiE '\b(seamless|leverage|cutting-edge|elevate|delve|pivotal|streamline|empower|revolutionize|supercharge)\b' && ((SLOP++))
# Generic hero patterns
echo "$CONTENT" | grep -qiE '(Build the future|all-in-one platform|Trusted by.*teams|Your .* platform)' && ((SLOP++))
# Inline CSS: equal 3-column grid pattern
echo "$CONTENT" | grep -qiE 'gridTemplateColumns.*"repeat\(3.*1fr\)"' && ((SLOP++))
# Inline CSS: centered-everything (textAlign: center appears many times)
CENTER_INLINE=$(echo "$CONTENT" | grep -ciE "textAlign.*center" | tr -d ' ')
[ "$CENTER_INLINE" -gt 8 ] && ((SLOP++))
# Uniform border radius on everything
UNIFORM_RADIUS=$(echo "$CONTENT" | grep -oiE 'borderRadius:.*"[0-9]+px"' | sort -u | wc -l | tr -d ' ')
[ "$UNIFORM_RADIUS" -eq 1 ] && [ "$(echo "$CONTENT" | grep -ciE 'borderRadius' | tr -d ' ')" -gt 5 ] && ((SLOP++))
if [ "$SLOP" -lt 3 ]; then
  C3="PASS"; ((PASS++))
else
  C3="FAIL"; ((FAIL++))
  C3_NOTE="slop_count:$SLOP"
fi

# --- Criterion 4: Asymmetric grids or varied density ---
ASYM=0
# Tailwind: asymmetric grid patterns
echo "$CONTENT" | grep -qiE '(col-span-2|col-span-3|grid-cols-\[|grid-cols-[45678]|auto-fill|auto-fit|minmax)' && ((ASYM++))
# Tailwind: bento/varied layouts
echo "$CONTENT" | grep -qiE '(row-span-|grid-rows-|aspect-|bento)' && ((ASYM++))
# Tailwind: varied widths
echo "$CONTENT" | grep -qiE '(w-1/3|w-2/3|w-1/4|w-3/4|max-w-\[|basis-)' && ((ASYM++))
# Inline CSS: asymmetric grid patterns (JSX style objects)
echo "$CONTENT" | grep -qiE '(gridTemplateColumns.*[23]fr|gridColumn.*span|gridRow.*span)' && ((ASYM++))
# Inline CSS: varied widths or asymmetric flex
echo "$CONTENT" | grep -qiE '(flex:.*[23]|width:.*[0-9]+%.*width:.*[0-9]+%|minmax)' && ((ASYM++))
# Inline CSS: explicit grid with unequal fractions or mixed units (px + fr)
echo "$CONTENT" | grep -qiE 'gridTemplateColumns.*"[^"]*fr[^"]*fr' && ((ASYM++))
echo "$CONTENT" | grep -qiE 'gridTemplateColumns.*"[^"]*px[^"]*fr|gridTemplateColumns.*"[^"]*fr[^"]*px' && ((ASYM++))
# Inline CSS: sidebar + main or 2-column asymmetric
echo "$CONTENT" | grep -qiE '(width:.*260|width:.*280|width:.*300|maxWidth:.*320)' && ((ASYM++))
# Negative: penalize pure grid-cols-3 without span variation (Tailwind only)
if echo "$CONTENT" | grep -qiE 'grid-cols-3' && ! echo "$CONTENT" | grep -qiE 'col-span-'; then
  ASYM=$((ASYM > 0 ? ASYM - 1 : 0))
fi
if [ "$ASYM" -gt 0 ]; then
  C4="PASS"; ((PASS++))
else
  C4="FAIL"; ((FAIL++))
fi

# --- Criterion 5: Interactive elements >= 44px touch target ---
# Check buttons and interactive elements for adequate sizing
TOUCH_OK=0
# Tailwind: Explicit size classes >= 44px (h-11 = 44px, h-12 = 48px, etc.)
echo "$CONTENT" | grep -qiE '(h-1[1-9]|h-[2-9][0-9]|min-h-\[4[4-9]|min-h-\[[5-9][0-9]|h-\[4[4-9]|h-\[[5-9])' && ((TOUCH_OK++))
# Tailwind: py-3 or py-4 on buttons (24px+ padding = likely 44px+)
echo "$CONTENT" | grep -qiE '(py-[3-9]|px-[4-9]).*button|button.*(py-[3-9]|px-[4-9])' && ((TOUCH_OK++))
# Inline CSS: minHeight >= 44px
echo "$CONTENT" | grep -qiE 'minHeight:.*"(4[4-9]|[5-9][0-9]|[1-9][0-9]{2,})px"' && ((TOUCH_OK++))
# Inline CSS: height >= 44px on interactive elements
echo "$CONTENT" | grep -qiE 'height:.*"(4[4-9]|[5-9][0-9])px"' && ((TOUCH_OK++))
# Inline CSS: padding >= 12px vertical (12px top + 12px bottom + ~16px text = 40px+)
echo "$CONTENT" | grep -qiE 'padding:.*"(1[2-9]|[2-9][0-9])px' && ((TOUCH_OK++))
# Tailwind: size utility classes
echo "$CONTENT" | grep -qiE '(h-11|h-12|h-14|h-16|w-11|w-12|w-14|w-16)' && ((TOUCH_OK++))
if [ "$TOUCH_OK" -gt 0 ]; then
  C5="PASS"; ((PASS++))
else
  C5="FAIL"; ((FAIL++))
fi

# --- Criterion 6: prefers-reduced-motion handling ---
if echo "$CONTENT" | grep -qiE '(prefers-reduced-motion|motion-safe|motion-reduce|reducedMotion)'; then
  C6="PASS"; ((PASS++))
else
  C6="FAIL"; ((FAIL++))
fi

# --- Output ---
TOTAL=$((PASS + FAIL))
RATE=$(echo "scale=1; $PASS * 100 / $TOTAL" | bc)

echo "{\"experiment\":\"$EXPERIMENT\",\"file\":\"$(basename $FILE)\",\"timestamp\":\"$TIMESTAMP\",\"c1_font\":\"$C1\",\"c2_oklch\":\"$C2${C2_NOTE:+ ($C2_NOTE)}\",\"c3_ai_detect\":\"$C3${C3_NOTE:+ ($C3_NOTE)}\",\"c4_asymmetric\":\"$C4\",\"c5_touch_44px\":\"$C5\",\"c6_reduced_motion\":\"$C6\",\"pass\":$PASS,\"fail\":$FAIL,\"rate\":\"${RATE}%\"}"
