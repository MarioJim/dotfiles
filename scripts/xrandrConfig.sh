#!/bin/zsh

source /home/mario/.zshrc

if xrandr | grep -A 1 "$EDISP connected" | grep "2560x1080"; then
    xrandr --output "$IDISP" --auto --pos 320x1080 --output "$EDISP" --auto --pos 0x0
elif xrandr | grep -A 1 "$EDISP connected" | grep "1920x1080"; then
    xrandr --output "$IDISP" --auto --output "$EDISP" --auto --left-of "$IDISP"
else
    xrandr --output "$IDISP" --auto
fi

