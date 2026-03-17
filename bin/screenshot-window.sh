#!/bin/bash
WIN=$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $NF}')
FILE=~/Images/window_$(date +%Y%m%d_%H%M%S).png
if maim -i "$WIN" "$FILE" && xclip -selection clipboard -t image/png "$FILE"; then
    notify-send -i "$FILE" "Capture fenêtre" "Sauvegardé + clipboard\n$(basename "$FILE")" -t 3000
else
    notify-send -u critical "Capture fenêtre" "Échec de la capture" -t 3000
fi
