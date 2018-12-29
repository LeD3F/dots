#!/usr/bin/env bash

xkb-switch -s us && rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}' \
    -lines 3 -theme ~/.cache/wal/flat-red.rasi
