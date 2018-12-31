#!/usr/bin/env bash

hc() {
    herbstclient "$@"
}

hc emit_hook reload

# remove all existing keybindings
hc keyunbind --all

# keybindings
# if you have a super key you will be much happier with Mod set to Mod4
Mod=Mod4 # Super Key
Mod2=Mod1 # Alt Key

hc keybind $Mod-Shift-q quit
hc keybind $Mod-Shift-r reload
hc keybind $Mod-Shift-c close
hc keybind $Mod-Return spawn ${TERMINAL:-urxvtc}

# basic movement
# focusing clients
hc keybind $Mod-Left  focus left
hc keybind $Mod-Down  focus down
hc keybind $Mod-Up    focus up
hc keybind $Mod-Right focus right

# moving clients
hc keybind $Mod-Shift-Left  shift left
hc keybind $Mod-Shift-Down  shift down
hc keybind $Mod-Shift-Up    shift up
hc keybind $Mod-Shift-Right shift right
## move windows through monitors
hc keybind $Mod-Shift-h or / shift left / \
    chain , lock , shift_to_monitor -l , focus_monitor -l , unlock
hc keybind $Mod-Shift-j or / shift down / \
    chain , lock , shift_to_monitor -d , focus_monitor -d , unlock
hc keybind $Mod-Shift-k or / shift up / \
    chain , lock , shift_to_monitor -u , focus_monitor -u , unlock
hc keybind $Mod-Shift-l or / shift right / \
    chain , lock , shift_to_monitor -r , focus_monitor -r , unlock

# splitting frames
# create an empty frame at the specified direction
hc keybind $Mod-u       split   bottom  0.5
hc keybind $Mod-o       split   right   0.5
# let the current frame explode into subframes
hc keybind $Mod-Control-space split explode

# resizing frames
resizestep=0.05
hc keybind $Mod-Control-Left    resize left +$resizestep
hc keybind $Mod-Control-Down    resize down +$resizestep
hc keybind $Mod-Control-Up      resize up +$resizestep
hc keybind $Mod-Control-Right   resize right +$resizestep

# tags
tag_names=( {1..8} )
tag_keys=( {1..8} 0 )

hc set focus_follows_mouse 1
hc set default_frame_layout 3
hc set_layout grid

hc rename default "${tag_names[0]}" || true
for i in ${!tag_names[@]} ; do
    hc add "${tag_names[$i]}"
    key="${tag_keys[$i]}"
    if ! [ -z "$key" ] ; then
        hc keybind "$Mod-$key" use_index "$i"
        hc keybind "$Mod-Shift-$key" move_index "$i"
    fi
done

# cycle through tags
hc keybind $Mod-period use_index +1 --skip-visible
hc keybind $Mod-comma  use_index -1 --skip-visible

# layouting
hc keybind $Mod-r remove
hc keybind $Mod-s floating toggle
hc keybind $Mod-f fullscreen toggle
hc keybind $Mod-p pseudotile toggle
# The following cycles through the available layouts within a frame, but skips
# layouts, if the layout change wouldn't affect the actual window positions.
# I.e. if there are two windows within a frame, the grid layout is skipped.
hc keybind $Mod-space                                                           \
            or , and . compare tags.focus.curframe_wcount = 2                   \
                     . cycle_layout +1 vertical horizontal max vertical grid    \
               , cycle_layout +1

# Layouts for tags
hc load 5 '
    (split horizontal:0.750000:0    
        (clients grid:0 0x3800006)
             (clients max:0 0x3e00001))
'

# mouse
hc mouseunbind --all
hc mousebind $Mod-Button1 move
hc mousebind $Mod-Button2 zoom
hc mousebind $Mod-Button3 resize

# focus
hc keybind $Mod-BackSpace   cycle_monitor
hc keybind $Mod-Tab         cycle_all +1
hc keybind $Mod-Shift-Tab   cycle_all -1
hc keybind $Mod-c cycle
hc keybind $Mod-i jumpto urgent

# Custom Hotkeys

# screenshots
## fullscreen
hc keybind Print spawn ~/.scripts/maim/screenshotfull.sh
## area
hc keybind $Mod-a spawn ~/.scripts/maim/screenshotarea.sh
## window
hc keybind $Mod2-s spawn ~/.scripts/maim/screenshotwindow.sh

# rofi
## rofi desktop launcher
hc keybind $Mod-d spawn ~/.scripts/rofi.sh
## rofi launcher
hc keybind $Mod-Shift-d spawn ~/.scripts/rofirun.sh
## rofi window switcher
hc keybind $Mod2-Tab spawn ~/.scripts/rofiwin.sh
## rofi clipboard
hc keybind $Mod-x spawn ~/.scripts/roficlip.sh
## rofi power
hc keybind $Mod2-e spawn rofi-power "herbstclient quit"
## rofi search
hc keybind $Mod-z spawn ~/.scripts/rofi-search.sh

# lock screen
hc keybind $Mod2-Ctrl-l spawn ~/.scripts/lock.sh

# applications
## Vivaldi
hc keybind $Mod-q spawn vivaldi-stable
## Pamac
hc keybind XF86Tools spawn pamac-manager
## Telegram
hc keybind XF86Mail spawn telegram-desktop
## Galculator
hc keybind XF86Calculator spawn galculator
## File Manager
hc keybind XF86Explorer spawn nemo

# mpd controls
## Next Track
hc keybind XF86AudioNext spawn ~/.scripts/next.sh
## Previous Track
hc keybind XF86AudioPrev spawn ~/.scripts/prev.sh
## Toggle Track
hc keybind XF86AudioPlay spawn ~/.scripts/play.sh

# volume control
## Volume Raise
hc keybind XF86AudioRaiseVolume spawn ~/.scripts/volumedunst.sh up
## Volume Down
hc keybind XF86AudioLowerVolume spawn ~/.scripts/volumedunst.sh down
## Toggle Mute
hc keybind XF86AudioMute spawn ~/.scripts/volumedunst.sh mute

## audio sources list
hc keybind XF86AudioStop spawn rofi-pulse

#pywal colors
source ~/.cache/wal/colors.sh

# theme
hc attr theme.tiling.reset 1
hc attr theme.floating.reset 1
#hc set frame_border_active_color "$color15"
#hc set frame_border_normal_color "$color1"
#hc set frame_bg_normal_color "$color3"
#hc set frame_bg_active_color "$color3"
hc set frame_border_width 0
hc set always_show_frame 0
#hc set frame_bg_transparent 0
hc set frame_active_opacity 1
hc set frame_normal_opacity 1
hc set frame_transparent_width 0
hc set frame_gap 0

hc attr theme.active.color "$color1"
hc attr theme.normal.color "$color0"
hc attr theme.urgent.color "$color15"
hc attr theme.inner_width 1
hc attr theme.inner_color "$color2"
hc attr theme.border_width 2
hc attr theme.floating.border_width 2
hc attr theme.floating.outer_width 1
hc attr theme.floating.outer_color "$color0"
hc attr theme.active.inner_color "$color0"
hc attr theme.active.outer_color "$color1"
hc attr theme.background_color  "$color0"

hc set window_gap 10
hc set frame_padding 0
hc set smart_window_surroundings 0
hc set smart_frame_surroundings 0
hc set mouse_recenter_gap 1

# rules
hc unrule -F
hc rule focus=on
# give focus to most common terminals
#hc rule class~'(.*[Rr]xvt.*|.*[Tt]erm|Konsole)' focus=on
hc rule windowtype~'_NET_WM_WINDOW_TYPE_(DIALOG|UTILITY|SPLASH)' pseudotile=on
hc rule windowtype='_NET_WM_WINDOW_TYPE_DIALOG' focus=on
hc rule windowtype~'_NET_WM_WINDOW_TYPE_(NOTIFICATION|DOCK|DESKTOP)' manage=off
hc rule class~'[Pp]olybar' manage=off

## apps
hc rule class=Vivaldi-stable tag=2
hc rule class=smplayer tag=3
hc rule class=mpv tag=3
hc rule class=Vmware tag=3
hc rule class=Gimp-2.10 tag=3
hc rule class=VK tag=5 index=1
hc rule class=TelegramDesktop tag=5 index=0
hc rule class=discord tag=5
hc rule class=Steam tag=6
hc rule class=Lutris tag=6 
hc rule class=File-roller pseudotile=on
hc rule class=Nitrogen pseudotile=on
hc rule class=Galculator pseudotile=on
hc rule class=Woeusbgui pseudotile=on

# unlock, just to be sure
hc unlock

# Monitor Setup
#hc add_monitor 1920x1080+1440+0 1
hc add_monitor 1440x900+0+180 7
hc detect_monitors
hc set swap_monitors_to_get_tag 0
hc set tree_style '╾│ ├└╼─┐'

# Floating tag
hc floating 6 on

# find the panel
panel=~/.config/polybar/herb/herb.sh
for monitor in $(herbstclient list_monitors | cut -d: -f1) ; do
    #start it on each monitor
    "$panel"  &
hc pad 0 34
done

# autostart apps
killall dunst && dunst -config ~/.cache/wal/dunstrcherb &
