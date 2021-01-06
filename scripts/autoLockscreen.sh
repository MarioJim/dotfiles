#!/bin/sh

xidlehook \
    --not-when-audio                                \
    --timer 300 "$HOME/scripts/lock.sh" ''              \
    --timer 360 'systemctl suspend' ''
