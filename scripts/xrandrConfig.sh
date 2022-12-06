#!/bin/sh

if xrandr | rg "HDMI-1 connected"; then
    xrandr --output "eDP-1" --auto \
           --output "HDMI-1" --auto --above "eDP-1" \
           --output "DP-1" --off
elif xrandr | rg "^DP-1 connected"; then
    xrandr --output "eDP-1" --off \
           --output "HDMI-1" --off \
           --output "DP-1" --auto --mode 3440x1440 --rate 120
    xrdb -merge ~/scripts/mateview_gt34.Xresources
else
    xrandr --output "eDP-1" --auto \
           --output "HDMI-1" --off \
           --output "DP-1" --off
    xrdb -merge ~/.Xresources
fi
