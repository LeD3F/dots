#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start Apps
nitrogen --restore &
compton &
dunst -config ~/.cache/wal/dunstrc &
xautolock -detectsleep -time 15 -locker "i3lock-fancy-dualmonitor -pf Roboto-Regular -- scrot -z"  -notify 30 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" &

# Xset
xset s 910 910 &
xset dpms 910 920 930 &

# Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

# Pulseaudio
pulseuadio &

# Xrandr
xrandr --output DVI-I-1 --mode 1440x900 -r 75 --pos 0x180 --rotate normal --output DP-2 --primary --mode 1920x1080 -r 144 --pos 1440x0 --rotate normal &\

# Window Managers
session=${1:-i3}

case $session in
	i3|i3wm ) exec i3;;
	2bwm ) exec 2bwm;;
esac	
