#!/usr/bin/env bash

# Terminate already running bar instances
pkill waybar

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

# If an external monitor is connected (DP-2 or HDMI-A-2), use the docked config.
# Otherwise, use the laptop config.
if hyprctl monitors | grep -q -e "Xiaomi" -e "HDMI-A-2"; then
    hyprctl keyword monitor eDP-2,preferred,auto,1.2
    waybar -c ~/.config/waybar/config-docked.jsonc &
else
    hyprctl keyword monitor eDP-2,preferred,auto,1
    waybar -c ~/.config/waybar/config-laptop.jsonc &
fi
