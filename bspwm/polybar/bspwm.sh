#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
killall -q tint2

# DP-2 Bars
polybar -c /home/led3f/.config/polybar/configbspwmdp2 nim &
polybar -c /home/led3f/.config/polybar/configbspwmdp2 nimdes &
polybar -c /home/led3f/.config/polybar/configbspwmdp2 nimmus &

# DVI-I-1 Bars
polybar -c /home/led3f/.config/polybar/configbspwmdvi nim &
polybar -c /home/led3f/.config/polybar/configbspwmdvi nimdes &
polybar -c /home/led3f/.config/polybar/configbspwmdvi nimtray &
