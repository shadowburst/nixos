#!/usr/bin/env bash

notification="brightness-notification"

icon="display-brightness-off-symbolic"
brightness=$(light -G | awk -F '.' '{print $1}')

if [[ "$brightness" -ge 50 ]]; then
    icon="display-brightness-high-symbolic"
elif [[ "$brightness" -gt 0 ]]; then
    icon="display-brightness-medium-symbolic"
fi

dunstify -a "changeBrightness" -u low -i "$icon" -h string:x-dunst-stack-tag:$notification -h int:value:"$brightness" "Brightness: ${brightness}%" > /dev/null
