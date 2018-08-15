#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybars -- automatically reload on config changes
MONITOR=$MONITOR_RIGHT polybar --reload right &
MONITOR=$MONITOR_LEFT polybar --reload left &

echo "Bars launched..."
