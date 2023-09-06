#!/usr/bin/env bash

# Watch monitor hot pluggin in order to reload the config
~/.config/hypr/scripts/watch-monitors.sh &

# Set minimum screen brightness
light -N 5 &

# Launch torrents daemon
transmission-daemon &

# Launch EWW daemon
eww daemon &
