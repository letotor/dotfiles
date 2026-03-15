#!/bin/bash
# Usage: notify-volume.sh up|down|mute|micmute
export LANG=C
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

case "$1" in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +10%
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)
        dunstify -a "Volume" -u low -r 2001 -h int:value:"$vol" "Volume  $vol%"
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -10%
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)
        dunstify -a "Volume" -u low -r 2001 -h int:value:"$vol" "Volume  $vol%"
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -c yes)
        if [ "$muted" -eq 1 ]; then
            dunstify -a "Volume" -u low -r 2001 -h string:fgcolor:#ff5555 "Son COUPE"
        else
            vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)
            dunstify -a "Volume" -u low -r 2001 -h int:value:"$vol" "Son actif  $vol%"
        fi
        ;;
    micmute)
        pactl set-source-mute @DEFAULT_SOURCE@ toggle
        muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -c yes)
        if [ "$muted" -eq 1 ]; then
            dunstify -a "Micro" -u low -r 2002 -h string:fgcolor:#ff5555 "Micro COUPE"
        else
            dunstify -a "Micro" -u low -r 2002 "Micro actif"
        fi
        ;;
esac
