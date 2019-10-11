#!/bin/bash -e

schedule_dpms() {
  sleep 60 # 1 minute
  pgrep i3lock
  pgrep i3lock && start_dpms
  # start_dpms
}

schedule_suspend() {
  sleep 900 # 15 minutes
  pgrep i3lock
  pgrep i3lock
  pgrep i3lock && start_suspend
  # start_suspend
}

start_dpms() {
  xset dpms force off
}

start_suspend() {
  systemctl suspend
}

# Take a screenshot
# scrot /tmp/screen_locked.png

# Pixellate it 10x
# mogrify -monochrome -scale 8% -scale 1250% /tmp/screen_locked.png

PICTURE_FILE=$HOME/Pictures/lockscreen-background.jpg

# Lock screen displaying this image.
if [[ -f $PICTURE_FILE ]]; then
  if [[ -e $HOME/git/i3lock-multimonitor/lock ]]; then
    $HOME/git/i3lock-multimonitor/lock -i $PICTURE_FILE
  else
    i3lock -t -c 000000 -i $PICTURE_FILE
  fi
else
  i3lock -c 000000
fi

# Turn the screen off after a delay.

schedule_dpms&
schedule_suspend&

