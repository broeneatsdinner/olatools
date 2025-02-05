#!/usr/bin/env bash
# -----------------
# --    cyber    --
# -----------------

# Set strict error handling
set -euo pipefail

# Prompt for user password securely and store it in a variable
echo "Please enter your password for checking sudo access:"
read -s -p "Password: " sudo_password
echo # For a newline after the password prompt

# Here's what this script should do:
# 1. Find out the type of system (debian/ubuntu/which flavor of Linux)
echo "System Information:"
echo "-------------------"
if [ -f /etc/os-release ]; then
    # Modern systems (Ubuntu/Debian/RHEL)
    source /etc/os-release
    echo "Operating System: $NAME $VERSION"
else
    echo "Could not determine OS from /etc/os-release"
fi

# 2. Find out whoami
echo
echo "User Information:"
echo "-----------------"
whoami="$(whoami)"
echo "Logged in as: $whoami"

# 3. Find out which groups I'm a part of
echo "Groups: $(groups)"

# 4. Find out if I can sudo without bringing more attention to this account than necessary
# Check if the current user is in the sudoers group
echo
echo "Sudo Privileges:"
echo "----------------"
if echo "$sudo_password" | sudo -S -l | grep -q "(ALL)"; then
    echo "User $whoami (you) has sudo privileges."
else
    echo "User $whoami (you) does not have sudo privileges."
fi

# 5. List all users on the system
echo
echo "All Users:"
echo "----------"
cat /etc/passwd | cut -d: -f1

# 6. See if I can cat /etc/shadow, /etc/passwd, /etc/group
echo
echo "Sensitive Files:"
echo "----------------"
for file in /etc/shadow /etc/passwd /etc/group; do
    if [ -r "$file" ]; then
        echo "$file is readable."
    else
        echo "$file is not readable."
    fi
done

# 7. Find any exploits (privileged shell, etc.)
echo
echo "Privilege Escalation/Exploits:"
echo "-----------------------------"
# Check if user has read access to /etc/sudoers (could use sudo to escalate privileges)
if [ -r /etc/sudoers ]; then
    echo "/etc/sudoers is readable."
else
    echo "/etc/sudoers is not readable."
fi

# Check for less running with elevated privileges
if ps aux | grep -q 'less.*root'; then
    echo "Warning: 'less' is running with root privileges."
else
    echo "'less' is not running with root privileges."
fi
