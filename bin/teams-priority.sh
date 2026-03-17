#!/bin/bash
PIDS=$(pgrep -f "teams-for-linux" 2>/dev/null)

if [ -z "$PIDS" ]; then
    notify-send -u low "Teams" "Non démarré" -t 2000
    exit 0
fi

# Prendre le premier process vivant (pas zombie)
FIRST_PID=$(echo "$PIDS" | while read p; do
    state=$(awk '/^State:/{print $2}' /proc/$p/status 2>/dev/null)
    [ "$state" != "Z" ] && echo $p && break
done)
CURRENT_NICE=$(awk '{print $19}' /proc/$FIRST_PID/stat 2>/dev/null)

if [ "$CURRENT_NICE" -gt 0 ]; then
    echo "$PIDS" | xargs renice -n 0 -p 2>/dev/null
    notify-send -i preferences-system "Teams" "Mode réunion\nPriorité Linux : nice 0 (normale)" -t 3000
else
    echo "$PIDS" | xargs renice -n 10 -p 2>/dev/null
    notify-send -i preferences-system "Teams" "Mode arrière-plan\nPriorité Linux : nice +10 (basse)" -t 3000
fi
