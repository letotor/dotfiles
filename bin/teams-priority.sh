#!/bin/bash
PIDS=$(pgrep -f "teams-for-linux" 2>/dev/null)

if [ -z "$PIDS" ]; then
    notify-send -u low "Teams" "Non démarré" -t 2000
    exit 0
fi

FIRST_PID=$(echo "$PIDS" | head -1)
CURRENT_NICE=$(cat /proc/$FIRST_PID/stat 2>/dev/null | awk '{print $19}')

if [ "$CURRENT_NICE" -gt 0 ]; then
    echo "$PIDS" | xargs renice -n 0 -p 2>/dev/null
    notify-send -i preferences-system "Teams" "🎥 Mode réunion — priorité normale" -t 3000
else
    echo "$PIDS" | xargs renice -n 10 -p 2>/dev/null
    notify-send -u low -i preferences-system "Teams" "💤 Mode arrière-plan — priorité basse" -t 3000
fi
