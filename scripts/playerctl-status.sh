#!/bin/sh

if currstatus=$(playerctl status -p spotify 2>/dev/null); then
    case $(echo "$currstatus" | tail -1) in
        Playing) statusicon=" " ;;
        Paused)  statusicon=" " ;;
        *)       echo && exit
    esac
    currplaying=$(playerctl metadata -p spotify --format "{{title}} - {{artist}}" 2>/dev/null | tail -1)
    echo "$statusicon" "${currplaying:0:80}"
else
    echo
fi
