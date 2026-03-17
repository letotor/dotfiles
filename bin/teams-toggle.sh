#!/bin/bash
# Gèle uniquement les renderers (CPU), pas le process principal (notifs/réseau)
RENDERER_PIDS=$(pgrep -f "teams-for-linux.*--type=renderer" 2>/dev/null)

if [ -z "$RENDERER_PIDS" ]; then
    notify-send -u low "Teams" "Renderer non trouvé" -t 2000
    exit 0
fi

FIRST_PID=$(echo "$RENDERER_PIDS" | head -1)
STATE=$(awk '/^State:/ {print $2}' /proc/$FIRST_PID/status 2>/dev/null)

if [ "$STATE" = "T" ]; then
    echo "$RENDERER_PIDS" | xargs kill -CONT
    notify-send -i preferences-system "Teams" "▶ Renderer repris" -t 2000
else
    echo "$RENDERER_PIDS" | xargs kill -STOP
    notify-send -u low -i preferences-system "Teams" "⏸ Renderer gelé — notifs actives" -t 2000
fi
