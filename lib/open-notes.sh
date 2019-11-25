#!/bin/bash

is_visible=$(xdotool search --all --onlyvisible --desktop $(xprop -notype -root _NET_CURRENT_DESKTOP | cut -c 24-) --class Gnote)

if [[ "$is_visible" != "" ]]; then
  i3-msg "[class=\"Gnote\"] move scratchpad"
  exit
fi

exists=$(i3-msg "[class=\"Gnote\"] focus" 2>&1)

if [[ "$exists" == *"ERROR"* ]]; then
  i3-msg exec "gnote --open-note=my_memory"
  i3-msg "[class=\"Gnote\"] floating enable"
fi
