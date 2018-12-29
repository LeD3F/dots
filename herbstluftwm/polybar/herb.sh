#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
killall -q tint2

# Wait until the processes have been shut down

# Launch bar1 and bar2
polybar -c ~/.config/polybar/herb/config nim &
polybar -c ~/.config/polybar/herb/config nim2 &

echo "Bars launched..."
