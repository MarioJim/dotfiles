#!/bin/sh

intern=eDP1
extern=HDMI1

if xrandr | grep "$extern connected"; then
    xrandr --output "$intern" --auto --pos 320x1080 --output "$extern" --auto --pos 0x0
    feh --randomize --bg-fill ~/Pictures/WPs/*
    i3-msg restart
fi
