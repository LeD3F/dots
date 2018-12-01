#!/bin/sh

# Spotify

id="${1?}" \
instance="$3" \
class="$2";

case "$class" in
    (foo)
        bar;;
    ("")
        unset -v _NET_WM_PID;
        . /dev/fd/0 2>/dev/null <<IN
        : \"\${$(
            xprop \
                -id "$id" \
                -notype \
                -f _NET_WM_PID 32c '=$0' \
                _NET_WM_PID;
        )}\";
IN
        case "$(ps -p "${_NET_WM_PID:?}" -o comm= 2>/dev/null)" in
            (spotify)
                echo desktop=music;;
        esac;;
esac;

# Pamac

wid=$1
class=$2
instance=$3
title=$(xtitle "$wid")

if [ "$instance" = pamac-manager ] ; then
    case "$title" in
        buddy_list|Buddy-Liste)
            echo "floating = on"
            xdotool windowmove $wid 0 0
            ;;
    esac;
fi;

# Lutris

wid=$1
class=$2
instance=$3
title=$(xtitle "$wid")

if [ "$instance" = Lutris ] ; then
    case "$title" in
        buddy_list|Buddy-Liste)
            echo "floating = on"
            xdotool windowmove $wid 0 0
            ;;
    esac;
fi;

# File Roller

wid=$1
class=$2
instance=$3
title=$(xtitle "$wid")

if [ "$instance" = File-roller ] ; then
    case "$title" in
        buddy_list|Buddy-Liste)
            echo "floating = on"
            xdotool windowmove $wid 0 0
            ;;
    esac;
fi;

# Galculator

wid=$1
class=$2
instance=$3
title=$(xtitle "$wid")

if [ "$instance" = Galculator ] ; then
    case "$title" in
        buddy_list|Buddy-Liste)
            echo "floating = on"
            xdotool windowmove $wid 0 0
            ;;
    esac;
fi;

# Gnac

wid=$1
class=$2
instance=$3
title=$(xtitle "$wid")

if [ "$instance" = Gnac ] ; then
    case "$title" in
        buddy_list|Buddy-Liste)
            echo "floating = on"
            xdotool windowmove $wid 0 0
            ;;
    esac;
fi;

# Pavucontrol

wid=$1
class=$2
instance=$3
title=$(xtitle "$wid")

if [ "$instance" = Pavucontrol ] ; then
    case "$title" in
        buddy_list|Buddy-Liste)
            echo "floating = on"
            xdotool windowmove $wid 0 0
            ;;
    esac;
fi;

# WoeUSB

wid=$1
class=$2
instance=$3
title=$(xtitle "$wid")

if [ "$instance" = WoeUSB ] ; then
    case "$title" in
        buddy_list|Buddy-Liste)
            echo "floating = on"
            xdotool windowmove $wid 0 0
            ;;
    esac;
fi;
