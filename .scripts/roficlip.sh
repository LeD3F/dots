#!/usr/bin/env bash

xkb-switch -s us && rofi rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}' -theme ~/.config/rofi/clipboard.rasi  
