#!/bin/bash -e

schedule_dpms() {
  echo "Scheduling dpms" >>/tmp/zee_log
  sleep 60 # 1 minute
  echo "dpms: Done sleeping" >>/tmp/zee_log
  pgrep i3lock && echo "i3lock found: dpms" >>/tmp/zee_log
  pgrep i3lock && start_dpms
  # start_dpms
}

schedule_suspend() {
  echo "Scheduling suspend" >>/tmp/zee_log
  sleep 900 # 15 minutes
  echo "Suspend: Done sleeping" >>/tmp/zee_log
  pgrep i3lock >>/tmp/zee_log 2>&1
  pgrep i3lock && echo "i3lock found: suspending" >>/tmp/zee_log
  pgrep i3lock && start_suspend
  # start_suspend
}

start_dpms() {
  echo "Starting DPMS" >>/tmp/zee_log
  xset dpms force off >>/tmp/zee_log 2>&1
}

start_suspend() {
  echo "Starting suspend" >>/tmp/zee_log 2>&1
  systemctl suspend >>/tmp/zee_log 2>&1
}

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

echo "Script start" >/tmp/zee_log
# Turn the screen off after a delay.

schedule_dpms&
schedule_suspend&

