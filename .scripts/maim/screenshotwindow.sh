#!/bin/bash
NAME=~/Pictures/Screenshots/$(date +%s).png
maim -u -i $(xdotool getactivewindow) $NAME
notify-send 'DYNAMIC ENTRY!' "Picture saved at ~/Pictrues/Screenshots" --icon=$HOME/Pictures/Icons/screen.png
