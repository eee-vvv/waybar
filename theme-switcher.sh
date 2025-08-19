#!/bin/bash

# Get current hour (24-hour format)
current_hour=$(date +%H)

# Path to waybar config directory
waybar_config_dir="$HOME/.config/waybar"

# Check if current time is between 7 AM (07) and 7 PM (19)
if [ "$current_hour" -ge 7 ] && [ "$current_hour" -lt 19 ]; then
    # Light theme (7 AM to 7 PM)
    theme_file="latte.css"
else
    # Dark theme (7 PM to 7 AM)
    theme_file="mocha.css"
fi

# Create/update symlink to point to the correct theme
ln -sf "$theme_file" "$waybar_config_dir/current-theme.css"

# Reload waybar to apply the new theme
pkill waybar
waybar &