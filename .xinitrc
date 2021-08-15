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


# Xset
xset s off -dpms  &

# Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & \
eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

# Xrandr
xrandr --output HDMI-0 --mode 1440x900 -r 75 --pos 0x180 --rotate normal \
--output DVI-I-1 --primary --mode 1920x1080 -r 144 --pos 1440x0 --rotate normal &
 
# Cursor
xsetroot -cursor_name left_ptr

# Numlock
numlockx &

# Window Managers
exec herbstluftwm
