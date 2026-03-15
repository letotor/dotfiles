#!/bin/bash
# Usage: notify-brightness.sh up|down|kbd
export LANG=C
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

case "$1" in
    up)
        brightnessctl set +10%
        val=$(brightnessctl get)
        max=$(brightnessctl max)
        pct=$((val * 100 / max))
        dunstify -a "Luminosite" -u low -r 2003 -h int:value:"$pct" "Luminosite  $pct%"
        ;;
    down)
        brightnessctl set 10%-
        val=$(brightnessctl get)
        max=$(brightnessctl max)
        pct=$((val * 100 / max))
        dunstify -a "Luminosite" -u low -r 2003 -h int:value:"$pct" "Luminosite  $pct%"
        ;;
    kbd)
        curr=$(brightnessctl -d dell::kbd_backlight get)
        max=$(brightnessctl -d dell::kbd_backlight max)
        next=$(( (curr + 1) % (max + 1) ))
        brightnessctl -d dell::kbd_backlight set "$next"
        case "$next" in
            0) label="Eteint" ; pct=0  ; dots="○○○" ;;
            1) label="Faible" ; pct=50 ; dots="●○○" ;;
            2) label="Plein"  ; pct=100; dots="●●●" ;;
            *) label="Niveau $next" ; pct=$((next * 100 / max)) ; dots="" ;;
        esac
        dunstify -a "Clavier" -u low -r 2004 -h int:value:"$pct" "Clavier  $dots  $label"
        ;;
esac
