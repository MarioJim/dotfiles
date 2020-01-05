#!/bin/sh

if xrandr | grep "$EDISP connected 2560x1080"; then
    xrandr --output "$IDISP" --auto --pos 320x1080 --output "$EDISP" --auto --pos 0x0
elif xrandr | grep "$EDISP connected 1920x1080"; then
    xrandr --output "$IDISP" --auto --output "$EDISP" --auto --right-of "$IDISP"
else
    xrandr --output "$IDISP" --auto
fi

