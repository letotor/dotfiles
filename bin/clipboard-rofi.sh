#!/bin/bash
# Affiche l'historique CopyQ dans rofi

export DISPLAY=:0
export QT_QPA_PLATFORM=xcb
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# Récupère l'historique numéroté (max 50 entrées)
items=$(copyq eval -- "
var out = [];
for (var i = 0; i < Math.min(size(), 50); i++) {
    var text = str(read(i)).replace(/\n/g, ' ').substring(0, 120);
    out.push(i + '\t' + text);
}
print(out.join('\n'));
" 2>/dev/null)

[ -z "$items" ] && exit 0

# Affiche dans rofi (cache le numéro, affiche uniquement le texte)
selected=$(echo "$items" | cut -f2 | rofi -dmenu -p "Clipboard" -theme ~/.config/rofi/tokyonight.rasi -i)

[ -z "$selected" ] && exit 0

# Récupère l'index correspondant
index=$(echo "$items" | awk -F'\t' -v sel="$selected" '$2 == sel {print $1; exit}')

[ -z "$index" ] && exit 0

# Copie le contenu réel (non tronqué) dans le presse-papiers
copyq read "$index" | xclip -selection clipboard
