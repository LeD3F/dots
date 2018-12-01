#! /bin/sh

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
    esac
fi