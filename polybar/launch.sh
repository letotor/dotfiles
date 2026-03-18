#!/bin/bash

# Attendre que i3 soit prêt
sleep 1

# Tuer les instances existantes
killall -q polybar

# Attendre que polybar se termine
while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

# Exporter le socket i3
export I3SOCK=$(i3 --get-socketpath)

# Lancer une barre par moniteur connecté
if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    case $m in
      eDP-1)   MONITOR=$m polybar -r left &  ;;
      HDMI-1)  MONITOR=$m polybar -r center & ;;
      DP-1)    MONITOR=$m polybar -r right &  ;;
    esac
  done
fi
