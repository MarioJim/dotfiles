#!/bin/sh

if currstatus=$(playerctl status 2>&1); then
    case $currstatus in
        Playing)
            statusicon=" "
            ;;
        Paused)
            statusicon=" "
            ;;
        *)
            statusicon="? "
            ;;
    esac
    currplaying=$(playerctl metadata --format "{{title}} - {{artist}}" 2>&1)
    echo "$statusicon" "$currplaying"
else
    echo
    exit
fi

