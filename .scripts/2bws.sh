#!/usr/bin/env bash

nd=$( xdotool get_num_desktops )
ws=$( xdotool get_desktop )

CURRENT="$(polybar -c ~/.config/polybar/config2b -d 'workspace-label-current' 2bws)"
OCCUPIED="$(polybar -c ~/.config/polybar/config2b -d 'workspace-label-occupied' 2bws)"
UNOCCUPIED="$(polybar -c ~/.config/polybar/config2b -d 'workspace-label-unoccupied' 2bws)"

fg1="$(polybar -c ~/.config/polybar/config2b -d 'workspace-current-foreground' 2bws)"
fg2="$(polybar -c ~/.config/polybar/config2b -d 'workspace-occupied-foreground' 2bws)"
fg3="$(polybar -c ~/.config/polybar/config2b -d 'workspace-unoccupied-foreground' 2bws)"

draw() {
	for i in {0..6}; do
        windows=$( xdotool search -desktop $i --name "" | wc -l )

		if [[ $i -eq $ws ]]
		then
			echo -ne "%{F$fg1} $CURRENT "
		else
			if [[ $windows > 0 ]]
			then
				echo -ne "%{F$fg2} $OCCUPIED "
			else
				echo -ne "%{F$fg3} $UNOCCUPIED "
			fi
		fi
	done
}

draw