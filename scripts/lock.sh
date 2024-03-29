#!/bin/sh

# Based on https://github.com/lokesh-krishna/dotfiles/blob/master/nord-v2/bin/lock.sh

TOP_MONITOR_HEIGHT=$(xrandr | rg " connected" | rg ".*\d+x(\d+)\+\d+\+0.*" -r '$1' | head -1)
TOP_MONITOR_HEIGHT="${TOP_MONITOR_HEIGHT:=1600}"
CLOCK_Y_POS=$(( (TOP_MONITOR_HEIGHT - 400) * 120 / $(xrdb -get Xft.dpi) ))

i3lock \
    --nofork                         \
    --ignore-empty-password          \
    \
    --indicator                      \
    --line-color=00000000            \
    --keyhl-color=5e81acff           \
    --bshl-color=bf616aff            \
    --separator-color=00000000       \
    --radius=32                      \
    --ring-width=7                   \
    --ind-pos="100:$CLOCK_Y_POS"     \
    \
    --inside-color=00000000          \
    --insidever-color=00000000       \
    --insidewrong-color=00000000     \
    \
    --ring-color=eceff4ff            \
    --ringver-color=6dab3cff         \
    --ringwrong-color=bf616aff       \
    \
    --clock                          \
    --time-color=eceff4ff            \
    --time-str="%I:%M %P"            \
    --time-font="Google Sans Medium" \
    --time-size=56                   \
    --time-pos="ix+60:iy+4"          \
    --time-align=1                   \
    \
    --date-color=eceff4ff            \
    --date-str="%A, %B %e"           \
    --date-font="Google Sans"        \
    --date-size=24                   \
    --date-pos="ix+60:iy+36"         \
    --date-align=1                   \
    \
    --verif-text=""                  \
    --wrong-text=""                  \
    --color=00000000
