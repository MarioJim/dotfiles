#!/bin/sh

if xrandr | rg "HDMI-1 connected"; then
    xrandr --output "eDP-1" --auto \
           --output "HDMI-1" --auto --above "eDP-1" \
           --output "DP-1" --off
elif xrandr | rg "^DP-1 connected"; then
    xrandr --output "eDP-1" --auto --pos 440x1440 \
           --output "HDMI-1" --off \
           --output "DP-1" --auto --mode 3440x1440 --rate 120 --pos 0x0
else
    xrandr --output "eDP-1" --auto \
           --output "HDMI-1" --off \
           --output "DP-1" --off
fi

