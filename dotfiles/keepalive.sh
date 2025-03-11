#!/bin/bash
# keepalive.sh - Function to keep SSH session alive

# Keepalive script to prevent session timeout in the DU web lab environment.
# This script moves the mouse and the terminal window to simulate activity.

# Requirements:
# - `xdotool`: Used to move the mouse and reposition the terminal window.
#   Install with: sudo apt update && sudo apt install -y xdotool
# - `curl`: Used to fetch the public IP address.
#   Install with: sudo apt update && sudo apt install -y curl
# - A terminal window must be open and visible.

# Detect OS and set package manager
if [[ -f /etc/os-release ]]; then
	source /etc/os-release
	OS_FAMILY=$ID_LIKE  # Example: "debian" or "rhel fedora"
else
	OS_FAMILY="unknown"
fi

# Function to display installation instructions based on OS (Redhat vs Debian/Ubuntu)
install_instructions() {
	echo "Error: $1 is not installed."
	if [[ "$OS_FAMILY" == *"debian"* ]]; then
		echo "Please install it with: sudo apt update && sudo apt install -y $1"
	elif [[ "$OS_FAMILY" == *"rhel"* || "$OS_FAMILY" == *"fedora"* ]]; then
		echo "Please install it with: sudo dnf install -y $1"
	else
		echo "Unknown OS. Please install $1 manually."
	fi
	return 1
}

# Check if required commands are installed
if ! command -v xdotool &>/dev/null; then
	install_instructions "xdotool"
	return 1
fi

if ! command -v curl &>/dev/null; then
	install_instructions "curl"
	return 1
fi

# Define keepalive function
keepalive() {
	echo "Starting keepalive session..."

	# Define safe margins for screen movement
	local WINDOW_WIDTH=800
	local WINDOW_HEIGHT=600
	local MARGIN=10

	# Capture the window ID of the terminal running this function
	local ORIGINAL_WID=$(xdotool getactivewindow)

	# Get screen dimensions
	local SCREEN_WIDTH
	local SCREEN_HEIGHT
	SCREEN_WIDTH=$(xdotool getdisplaygeometry | awk '{print $1}')
	SCREEN_HEIGHT=$(xdotool getdisplaygeometry | awk '{print $2}')

	while true; do
		# Get current time and public IP
		local TIMESTAMP=$(date +"%a %b %e %T UTC %Y")
		local PUBLIC_IP=$(curl -4 ifconfig.me)

		# Print session alive message
		echo "Keeping session alive: $TIMESTAMP @ $PUBLIC_IP"

		# Move the mouse slightly to simulate activity
		xdotool mousemove_relative -- 10 10
		sleep 1
		xdotool mousemove_relative -- -10 -10

		# Ensure we only move the original window
		if [[ -n "$ORIGINAL_WID" ]]; then
			local MAX_X=$((SCREEN_WIDTH - WINDOW_WIDTH - MARGIN))
			local MAX_Y=$((SCREEN_HEIGHT - WINDOW_HEIGHT - MARGIN))

			local NEW_X=$((RANDOM % MAX_X + MARGIN))
			local NEW_Y=$((RANDOM % MAX_Y + MARGIN))

			xdotool windowmove "$ORIGINAL_WID" "$NEW_X" "$NEW_Y"
		fi

		sleep 30  # Wait before repeating
	done
}
