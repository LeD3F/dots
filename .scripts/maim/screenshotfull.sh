#!/bin/bash
NAME=~/Pictures/Screenshots/$(date +%s).png
maim -u $NAME
notify-send 'DYNAMIC ENTRY!' "Picture saved at ~/Pictrues/Screenshots" --icon=$HOME/Pictures/Icons/screen.png
