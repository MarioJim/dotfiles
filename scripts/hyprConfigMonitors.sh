#!/bin/sh

if hyprctl monitors | rg "Monitor DP-1"; then
    CURRENT_WORKSPACE=$(hyprctl monitors | rg -Uor '$1' "Monitor DP-1\p{any}*?active workspace: ([0-9]+)")
    hyprctl keyword monitor eDP-1,disable
    hyprctl keyword monitor DP-1,3440x1440@165,0x0,1
    hyprctl dispatch workspace "$CURRENT_WORKSPACE"
fi
