#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run compton
run nitrogen --restore
run nm-applet
run setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &
xrandr   --output DVI-I-1 --mode 1440x900 -r 75 --pos 0x180 --rotate normal --output DP-2 --primary --mode 1920x1080 -r 144 --pos 1440x0 --rotate normal
run pamac-tray
