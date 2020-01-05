#!/bin/sh

# Based on https://github.com/lokesh-krishna/dotfiles/blob/master/nord-v2/bin/lock.sh

i3lock \
    --nofork                    \
    --ignore-empty-password     \
    \
    --indicator                 \
    --linecolor=00000000        \
    --keyhlcolor=5e81acff       \
    --bshlcolor=bf616aff    	\
    --separatorcolor=00000000   \
    --radius=32			        \
    --ring-width=7		        \
    --indpos="100:980"		    \
    \
    --insidevercolor=00000000	\
    --insidewrongcolor=00000000 \
    --insidecolor=00000000	    \
    \
    --ringcolor=eceff4ff        \
    --ringvercolor=6dab3cff     \
    --ringwrongcolor=bf616aff   \
    \
    --clock			            \
    --timecolor=eceff4ff	    \
    --timestr="%I:%M %P"		    \
    --time-font="Google Sans"   \
    --timesize=54		        \
    --time-align=1		        \
    --timepos="ix+60:iy+4"		\
    \
    --datecolor=eceff4ff	    \
    --datestr="%A, %e %B"	    \
    --date-font="Google Sans"   \
    --datesize=24		        \
    --datepos="ix+60:iy+36"	    \
    --date-align=1		        \
    \
    --veriftext=""		        \
    --wrongtext=""              \
    -B=1
