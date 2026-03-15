#!/bin/bash
# Réactiver les moniteurs après veille
if [ "$1" = "post" ]; then
    sleep 3
    export DISPLAY=:0
    export XAUTHORITY=/run/user/1000/gdm/Xauthority
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 \
           --output HDMI-1 --mode 2560x1440 --right-of eDP-1 \
           --output DP-1 --auto --right-of HDMI-1
fi
