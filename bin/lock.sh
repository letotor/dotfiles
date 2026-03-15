#!/bin/bash
# Lock screen with blur effect using scrot + ImageMagick + i3lock

TMPIMG=/tmp/lockscreen.png

# Screenshot + blur
import -window root "$TMPIMG"
magick "$TMPIMG" -filter Gaussian -blur 0x8 "$TMPIMG"

# Lock with blurred image
i3lock -i "$TMPIMG" --color 000000
