#!/bin/bash
NAME=~/Pictures/Screenshots/$(date +%s).png
maim --hidecursor $NAME
notify-send 'DYNAMIC ENTRY!' "Picture saved at $NAME" --icon=$HOME/Pictures/Icons/screen.png
