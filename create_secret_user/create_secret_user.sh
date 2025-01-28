#!/bin/bash

# Function to find the lowest unused UID below 1000
find_lowest_unused_uid() {
    for i in $(seq 1 999); do
        if ! id -u $i &>/dev/null; then
            echo $i
            return
        fi
    done
    echo "No available UID below 1000." >&2
    exit 1
}

# Prompt for username
read -p "Enter the username for the secret user: " username

# Check if the username already exists
if id "$username" &>/dev/null; then
    echo "Error: User '$username' already exists." >&2
    exit 1
fi

# Find the lowest available UID
uid=$(find_lowest_unused_uid)

# Create the group with the same GID as the UID
sudo groupadd -g "$uid" "$username"

# Create the user with the found UID and matching GID
sudo useradd -r -u "$uid" -g "$uid" -s /bin/bash "$username"

# Set the password for the user
echo "Set a password for the user:"
sudo passwd "$username"

# Grant passwordless sudo access
sudo bash -c "echo '$username ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"

# Verify the user creation and configuration
cat /etc/passwd | grep "$username"

# Verify passwordless sudo access
sudo -l -U "$username"

echo "User '$username' has been created with UID $uid and granted passwordless sudo access."
