#!/bin/sh

intern=eDP-1
extern=HDMI-1

if xrandr | grep "$extern connected"; then
    xrandr --output "$intern" --auto --pos 320x1080 --output "$extern" --auto --pos 0x0
else
    xrandr --output "$intern" --auto
fi
