#!/usr/bin/env bash
# -----------------
# --    cyber    --
# -----------------

# Set strict error handling
set -euo pipefail

# Ensure the script is run with exactly one parameter (the target IP address)
if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <IP_ADDRESS>" >&2
	exit 1
fi

# Locate and source the passwords file, contained in the same directory as this script
PASSWORD_FILE="$(dirname "$0")/passwords"
if [[ -f "$PASSWORD_FILE" ]]; then
	source "$PASSWORD_FILE"
else
	echo "Error: Password file not found. Please create $PASSWORD_FILE." >&2
	exit 1
fi

# Ensure required variables are set (username & password)
if [[ -z "${CYBER_USER:-}" || -z "${CYBER_PASS:-}" ]]; then
	echo "Error: CYBER_USER or CYBER_PASS is not set. Check $PASSWORD_FILE." >&2
	exit 1
fi

# Variables
IP_ADDRESS="$1"
USERNAME="$CYBER_USER"
PASSWORD="$CYBER_PASS"
LOCAL_BASHRC="${CYBER_BASHRC:-$HOME/.bashrc}"
REMOTE_BASHRC="/dev/shm/.remote_bashrc"

# Validate that the input is a properly formatted IP address
if [[ ! "$IP_ADDRESS" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
	echo "Error: The provided argument is not a valid IP address format." >&2
	exit 1
fi

# Additional IP validation (ensure each octet is within the valid range (0-255))
IFS='.' read -r -a ip_parts <<< "$IP_ADDRESS"
for octet in "${ip_parts[@]}"; do
	if [[ ! "$octet" =~ ^[0-9]+$ ]] || [[ "$octet" -gt 255 ]]; then
		echo "Error: IP address octets must be between 0 and 255." >&2
		exit 1
	fi
done

# Ensure required commands are installed
for cmd in sshpass base64 ssh; do
	if ! command -v "$cmd" >/dev/null 2>&1; then
		echo "Error: Required command '$cmd' not found. Please install it first." >&2
		exit 1
	fi
done

# Ensure the local bashrc file exists, fallback to ~/.bashrc if missing
if [[ -v CYBER_BASHRC && -n "$CYBER_BASHRC" && ! -f "$CYBER_BASHRC" ]]; then
	echo "Error: Custom CYBER_BASHRC file '$CYBER_BASHRC' does not exist. Exiting." >&2
	exit 1
fi
LOCAL_BASHRC="${CYBER_BASHRC:-$HOME/.bashrc}"

if [[ ! -f "$LOCAL_BASHRC" ]]; then
	echo "Error: No valid bashrc file found." >&2
	exit 1
fi

# Encode local bashrc as base64 (macOS compatibility fix)
B64_PAYLOAD=$(base64 < "$LOCAL_BASHRC") || {
	echo "Error: Failed to encode bashrc file" >&2
	exit 1
}

# Print usage instructions
echo ""
echo "Remember, after logging in, if you su into another user, run:"
echo "source $REMOTE_BASHRC"
echo ""

# First SSH connection: Transfer the bashrc file to the remote system
echo "Transferring bashrc file..."
sshpass -p "$PASSWORD" ssh -T -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
	-o LogLevel=ERROR -o ServerAliveInterval=60 -o ServerAliveCountMax=3 \
	"$USERNAME@$IP_ADDRESS" "echo '$B64_PAYLOAD' | base64 -d > '$REMOTE_BASHRC'"

# Second SSH connection: Start an interactive shell with cleanup mechanism
echo "Starting interactive session..."
sshpass -p "$PASSWORD" ssh -t -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
	-o ServerAliveInterval=60 -o ServerAliveCountMax=3 \
	"$USERNAME@$IP_ADDRESS" '
		# Automatically remove the remote bashrc file upon session termination
		# This ensures no trace is left on the remote system.
		#
		# The trap executes `rm -f "$REMOTE_BASHRC"` when the session ends due to:
		#   - Normal logout (`exit`, `logout`)
		#   - SSH session timeout or network disconnection
		#   - Standard termination signals (`SIGHUP`, `SIGINT`, `SIGTERM`)
		#   - Admin termination with `kill <PID>` or `pkill ssh`
		#
		# However, the trap will NOT execute if:
		#   - The process is force-killed (`kill -9 <PID>`, `SIGKILL`)
		#   - The system crashes unexpectedly (power failure, kernel panic)
		#
		# The file is also automatically removed upon reboot since it is stored in /dev/shm (tmpfs).
		trap "rm -f \"$REMOTE_BASHRC\"" EXIT SIGHUP SIGINT SIGTERM

		# Start an interactive login shell with the remote bashrc preloaded
		exec bash --rcfile "$REMOTE_BASHRC"
	'
