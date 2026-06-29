#!/usr/bin/env bash

input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
# "// empty" produces no output when rate_limits is absent
FIVE_H=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
WEEK=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
CTX=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
DUR_MS=$(echo "$input" | jq -r '.cost.total_duration_ms // empty')

LIMITS=""
[ -n "$FIVE_H" ] && LIMITS="5h $(printf '%.0f' "$FIVE_H")%"
[ -n "$WEEK" ] && LIMITS="${LIMITS:+$LIMITS }7d $(printf '%.0f' "$WEEK")%"
[ -n "$LIMITS" ] && LIMITS="📊 $LIMITS"

CTX_STR=""
[ -n "$CTX" ] && CTX_STR="🧠 $(printf '%.0f' "$CTX")%"

DUR_STR=""
if [ -n "$DUR_MS" ]; then
  SECS=$((DUR_MS / 1000))
  if [ "$SECS" -ge 3600 ]; then
    DUR_STR=$(printf '⏱️ %dh%dm' $((SECS / 3600)) $(((SECS % 3600) / 60)))
  elif [ "$SECS" -ge 60 ]; then
    DUR_STR=$(printf '⏱️ %dm%ds' $((SECS / 60)) $((SECS % 60)))
  else
    DUR_STR="⏱️ ${SECS}s"
  fi
fi

OUT="[$MODEL]"
[ -n "$CTX_STR" ] && OUT="$OUT | $CTX_STR"
[ -n "$DUR_STR" ] && OUT="$OUT | $DUR_STR"
[ -n "$LIMITS" ] && OUT="$OUT | $LIMITS"
echo "$OUT"

