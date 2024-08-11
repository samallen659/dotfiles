#!/user/bin/env bash

windows="$(yabai -m query --spaces --space | jq '.windows')"

if [[ $windows == *","* ]]
then
    yabai -m config window_border on
    yabai -m config active_window_border_color "0x660000"
else
    yabai -m config window_border off
fi
