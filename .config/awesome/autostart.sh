#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run nitrogen --restore
run compton
run nm-applet
run setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &