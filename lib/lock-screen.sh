#!/bin/bash -e

# Take a screenshot
# scrot /tmp/screen_locked.png

# Pixellate it 10x
# mogrify -monochrome -scale 8% -scale 1250% /tmp/screen_locked.png

PICTURE_FILE=$HOME/Pictures/lockscreen-background.png

# Lock screen displaying this image.
if [[ -f $PICTURE_FILE ]]; then
  i3lock -t -c 000000 -i $PICTURE_FILE
else
  i3lock -c 000000
fi

# Turn the screen off after a delay.
sleep 60; pgrep i3lock && xset dpms force off
