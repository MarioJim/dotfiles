#!/bin/sh

cd ~

export _JAVA_AWT_WM_NONREPARENTING=1
export GDK_BACKEND=wayland,x11
export QT_QPA_PLATFORM="wayland;xcb"
export XCURSOR_SIZE=24
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland

exec Hyprland
