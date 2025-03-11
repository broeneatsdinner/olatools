#!/bin/bash

# Variable for the report output file, choose an output file name
REPORT_FILE="$(pwd)/hardening_script_1_report_$(date +%F-%H-%M-%S).txt"  # Use the current directory and timestamp for the report

# Output the hostname
echo "Gathering hostname..."
echo "Hostname: $(hostname)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Output the OS version
echo "Gathering OS version..."
echo "OS Version: $(lsb_release -a | grep 'Description' | cut -f2)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Output memory information
echo "Gathering memory information..."
echo "Memory Information: $(free -h)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Output uptime information
echo "Gathering uptime information..."
echo "Uptime Information: $(uptime)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Backup the OS
echo "Backing up the OS..."
# Example command for backing up using tar
#tar -czf /backup/os_backup_$(date +%F).tar.gz /etc /home /var
tar -cvpzf /root/baker_street_backup_$(date +%F).tar.gz --exclude=/root/baker_street_backup* --exclude=/proc --exclude=/tmp --exclude=/mnt --exclude=/sys --exclude=/dev --exclude=/run /
echo "OS backup completed." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Output the sudoers file to the report
echo "Gathering sudoers file..."
echo "Sudoers file: $(cat /etc/sudoers)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Script to check for files with world permissions and update them
echo "Checking for files with world permissions..."
find /home -type f -perm -0002 -exec chmod o-w {} \;
echo "World permissions have been removed from any files found." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Find specific files and update their permissions
echo "Updating permissions for specific scripts..."

# Engineering scripts - Only members of the engineering group
echo "Updating permissions for Engineering scripts."
find / -iname '*engineering*' -exec chown :engineering {} + -exec chmod 770 {} + 2>/dev/null
echo "Permissions updated for Engineering scripts." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Research scripts - Only members of the research group
echo "Updating permissions for Research scripts..."
find / -iname '*research*' -exec chown :research {} + -exec chmod 770 {} + 2>/dev/null
echo "Permissions updated for Research scripts." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Finance scripts - Only members of the finance group
echo "Updating permissions for Finance scripts"
find / -iname '*finance*' -exec chown :finance {} + -exec chmod 770 {} + 2>/dev/null
echo "Permissions updated for Finance scripts." >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

echo "Script execution completed. Check $REPORT_FILE for details."
