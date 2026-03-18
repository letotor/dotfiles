#!/bin/bash
# Réactiver les moniteurs après veille
if [ "$1" = "post" ]; then
    sleep 3
    export DISPLAY=:0
    export XAUTHORITY=/run/user/$(id -u)/gdm/Xauthority
    xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 \
           --output HDMI-1 --auto --right-of eDP-1 \
           --output DP-1 --preferred --right-of HDMI-1
    bash /home/vgermain/bin/launch.sh
fi
