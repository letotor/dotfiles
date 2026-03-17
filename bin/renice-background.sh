#!/bin/bash
# Abaisse la priorité CPU des apps Electron en arrière-plan
# Nice +10 = cède le CPU aux apps actives sans les geler

renice_app() {
    local name="$1"
    local nice="$2"
    local pids=$(pgrep -f "$name" 2>/dev/null)
    if [ -n "$pids" ]; then
        echo "$pids" | xargs renice -n "$nice" -p 2>/dev/null
        echo "renice +$nice → $name"
    fi
}

renice_app "teams-for-linux" 10
renice_app "picom" 5
