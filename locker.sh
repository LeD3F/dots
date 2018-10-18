#!/bin/sh
exec xautolock -detectsleep -time 1 -locker "i3lock-fancy-dualmonitor -pf Roboto -- scrot -z" -notify 30 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"