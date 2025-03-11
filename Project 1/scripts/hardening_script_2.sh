#!/bin/bash

# Variable for the report output file, choose a NEW output file name
REPORT_FILE="$(pwd)/hardening_script_2_report_$(date +%F-%H-%M-%S).txt"  # Use the current directory and timestamp for the report

# Output the sshd configuration file
echo "Gathering details from sshd configuration file"
# Display the contents of the sshd_config file
echo "sshd configuration file: $(cat /etc/ssh/sshd_config)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Update packages and services
echo "Updating packages and services"
# Update the package list and upgrade installed packages
apt update && apt upgrade -y
echo "Packages have been updated and upgraded" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# List all installed packages
echo "Installed Packages: $(dpkg --get-selections)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Printing out logging configuration data
echo "Printing out logging configuration data"
# Output journald.conf data (systemd logging)
echo "journald.conf file data: $(cat /etc/systemd/journald.conf)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

# Output logrotate configuration (for log management)
echo "logrotate.conf file data: $(cat /etc/logrotate.conf)" >> $REPORT_FILE
printf "\n" >> $REPORT_FILE

echo "Script execution completed. Check $REPORT_FILE for details."
