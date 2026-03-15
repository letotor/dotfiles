#!/bin/bash
# Usage: kitty-tab-color.sh #actif #inactif [#terminal_bg]
COLOR=$1
INACTIVE=${2:-$1}
TERMINAL_BG=$3
TAB_ID=$(kitty @ ls | python3 -c "
import sys, json
d = json.load(sys.stdin)
win_id = int('$KITTY_WINDOW_ID')
for w in d:
    for t in w['tabs']:
        for win in t['windows']:
            if win['id'] == win_id:
                print(t['id'])
                sys.exit()
")
kitty @ set-tab-color --match "id:$TAB_ID" active_bg="$COLOR" active_fg="#ffffff" inactive_bg="$INACTIVE" inactive_fg="#cccccc"
[ -n "$TERMINAL_BG" ] && kitty @ set-colors --configured --match "id:$KITTY_WINDOW_ID" background="$TERMINAL_BG"
