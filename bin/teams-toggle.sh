#!/bin/bash
PIDS=$(pgrep -f "teams-for-linux" 2>/dev/null)

if [ -z "$PIDS" ]; then
    notify-send -u low "Teams" "Non démarré" -t 2000
    exit 0
fi

FIRST_PID=$(echo "$PIDS" | head -1)
STATE=$(awk '/^State:/ {print $2}' /proc/$FIRST_PID/status 2>/dev/null)

if [ "$STATE" = "T" ]; then
    echo "$PIDS" | xargs kill -CONT
    notify-send -i preferences-system "Teams" "▶ Repris" -t 2000
else
    echo "$PIDS" | xargs kill -STOP
    notify-send -u low -i preferences-system "Teams" "⏸ En pause — CPU 0%" -t 2000
fi
