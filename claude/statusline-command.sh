#!/usr/bin/env bash

input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
# "// empty" produces no output when rate_limits is absent
FIVE_H=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
WEEK=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
CTX=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

LIMITS=""
[ -n "$FIVE_H" ] && LIMITS="5h: $(printf '%.0f' "$FIVE_H")%"
[ -n "$WEEK" ] && LIMITS="${LIMITS:+$LIMITS }7d: $(printf '%.0f' "$WEEK")%"

CTX_STR=""
[ -n "$CTX" ] && CTX_STR="ctx: $(printf '%.0f' "$CTX")%"

OUT="[$MODEL]"
[ -n "$CTX_STR" ] && OUT="$OUT | $CTX_STR"
[ -n "$LIMITS" ] && OUT="$OUT | $LIMITS"
echo "$OUT"

