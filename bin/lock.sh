#!/bin/sh
xset s 500 &
xautolock -time 5 -locker "betterlockscreen -l blur --display 1" -notify 30 -notifier "notify-send 'Locker' 'Locking screen in 30 seconds'"
