#!/usr/bin/env bash
# Affiche l'IP avec couleur selon la connexion :
#   ethernet actif        → vert
#   wifi signal fort      → vert  (> -65 dBm)
#   wifi signal moyen     → jaune (-65 à -75 dBm)
#   wifi signal faible    → orange (< -75 dBm)

GREEN="#50FA7B"
YELLOW="#F1FA8C"
ORANGE="#FFB86C"

ETH="enp0s31f6"
WIFI="wlp0s20f3"

# Récupère l'IP globale
IP=$(ip -4 addr show scope global | awk '/inet /{print $2}' | cut -d/ -f1 | head -1)
[ -z "$IP" ] && exit 0

# Vérifie ethernet
CARRIER=$(cat /sys/class/net/$ETH/carrier 2>/dev/null)
if [ "$CARRIER" = "1" ]; then
    echo "%{F$GREEN}$IP%{F-}"
    exit 0
fi

# Sinon wifi : lire le signal et le SSID
WIFI_INFO=$(iw dev $WIFI link 2>/dev/null)
SIGNAL=$(echo "$WIFI_INFO" | awk '/signal:/{print $2}')
SSID=$(echo "$WIFI_INFO" | awk '/SSID:/{print $2}')

if [ -z "$SIGNAL" ]; then
    echo "%{F$ORANGE}$IP%{F-}"
    exit 0
fi

if [ "$SIGNAL" -ge -65 ]; then
    COLOR=$GREEN
elif [ "$SIGNAL" -ge -75 ]; then
    COLOR=$YELLOW
else
    COLOR=$ORANGE
fi

echo "%{F$GREEN}$SSID%{F-} %{F$COLOR}$SIGNAL dBm%{F-}  %{F$COLOR}$IP%{F-}"
