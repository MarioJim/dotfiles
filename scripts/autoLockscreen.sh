#!/bin/sh

xidlehook \
    --not-when-fullscreen                           \
    --not-when-audio                                \
    --timer 300 '~/scripts/lock.sh' ''              \
    --timer 900 'systemctl suspend-then-hibernate' ''
