#!/bin/bash

# Keepalive script to prevent session timeout in the DU web lab environment.
# This script moves the mouse and the terminal window to simulate activity.

# Requirements:
# - `xdotool`: Used to move the mouse and reposition the terminal window.
#   Install with: sudo apt update && sudo apt install -y xdotool
# - `curl`: Used to fetch the public IP address.
#   Install with: sudo apt update && sudo apt install -y curl
# - A terminal window must be open and visible.

# Check if required commands are installed
if ! command -v xdotool &>/dev/null; then
	echo "Error: xdotool is not installed."
	echo "Please install it with: sudo dnf install -y xdotool"
	exit 1
fi

if ! command -v curl &>/dev/null; then
	echo "Error: curl is not installed."
	echo "Please install it with: sudo dnf install -y curl"
	exit 1
fi

# Capture the window ID of the terminal running this script
ORIGINAL_WID=$(xdotool getactivewindow)

# Get screen dimensions
SCREEN_WIDTH=$(xdotool getdisplaygeometry | awk '{print $1}')
SCREEN_HEIGHT=$(xdotool getdisplaygeometry | awk '{print $2}')

# Define safe margins to keep the window within screen bounds
WINDOW_WIDTH=800   # Adjust based on terminal size
WINDOW_HEIGHT=600  # Adjust based on terminal size
MARGIN=10

while true; do
	# Get current time and public IP
	TIMESTAMP=$(date +"%a %b %e %T UTC %Y")
	PUBLIC_IP=$(curl -4 ifconfig.me)

	# Print session alive message with timestamp and public IP
	echo "Keeping session alive: $TIMESTAMP @ $PUBLIC_IP"

	# Move the mouse slightly
	xdotool mousemove_relative -- 10 10
	sleep 1
	xdotool mousemove_relative -- -10 -10

	# Ensure we don't move the wrong window
	if [ -n "$ORIGINAL_WID" ]; then
		# Ensure we don't move it off-screen
		MAX_X=$((SCREEN_WIDTH - WINDOW_WIDTH - MARGIN))
		MAX_Y=$((SCREEN_HEIGHT - WINDOW_HEIGHT - MARGIN))

		NEW_X=$((RANDOM % MAX_X + MARGIN))
		NEW_Y=$((RANDOM % MAX_Y + MARGIN))

		xdotool windowmove "$ORIGINAL_WID" "$NEW_X" "$NEW_Y"
	fi

	# Wait before repeating
	sleep 30
done
