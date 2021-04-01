#!/bin/sh

if currstatus=$(playerctl status 2>&1); then
    case $(echo "$currstatus" | tail -1) in
        Playing)
            statusicon=" "
            ;;
        Paused | Stopped)
            statusicon=" "
            ;;
        *)
            statusicon="? "
            ;;
    esac
    currplaying=$(playerctl metadata --format "{{title}} - {{artist}}" 2>&1 | tail -1)
    echo "$statusicon" "${currplaying:0:80}"
else
    echo
    exit
fi

