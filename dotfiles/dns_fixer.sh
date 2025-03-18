#!/usr/bin/env bash

echo "=============================================="
echo " AWS EC2 DNS Fixer Script "
echo "=============================================="
echo "Checking current public IP resolution speed..."
echo "----------------------------------------------"

# Measure response time and extract time_namelookup
old_response_time=$(curl -o /dev/null -s -w "%{time_namelookup}" -4 ifconfig.me)

echo
echo "----------------------------------------------"
echo "Old DNS resolution time: ${old_response_time} seconds"

# Assess speed
if (( $(echo "$old_response_time <= 0.001" | bc -l) )); then
	echo "✅ DNS resolution speed is pretty dang good already (≤1ms)."
else
	echo "⚠️ DNS resolution is slow (>1ms). Consider using this script to adjust your settings."
fi

echo "----------------------------------------------"

read -p "Do you want to adjust the DNS settings to improve resolution speed? (y/n): " choice
case "$choice" in
	y|Y )
		echo "Proceeding with DNS configuration adjustments..."
		;;
	n|N )
		echo "Exiting without making changes."
		exit 0
		;;
	* )
		echo "Invalid input. Exiting."
		exit 1
		;;
esac

# Add AWS EC2 default resolver if not already present
echo "----------------------------------------------"
echo "# Add AWS EC2 default resolver if not already present"
COMMAND='grep -q "nameserver 169.254.169.253" /etc/resolv.conf || sudo sed -i "1i nameserver 169.254.169.253" /etc/resolv.conf'
echo "Executing command: $COMMAND"
eval "$COMMAND"

echo "Current /etc/resolv.conf contents:"
cat /etc/resolv.conf
echo "-------------------------------------------"

# Ensure DHCP does not override DNS settings
echo "----------------------------------------------"
echo "# Ensure DHCP does not override DNS settings"
echo "Updating dhclient.conf to enforce AWS resolver..."
echo "supersede domain-name-servers 169.254.169.253;" | sudo tee -a /etc/dhcp/dhclient.conf
sudo dhclient -r && sudo dhclient

# Configure systemd-resolved
echo "----------------------------------------------"
echo "# Configure systemd-resolved"
echo "Configuring systemd-resolved to use AWS resolver..."
sudo bash -c 'echo -e "[Resolve]\nDNS=169.254.169.253\nFallbackDNS=8.8.8.8" > /etc/systemd/resolved.conf'
sudo systemctl restart systemd-resolved

# Prevent resolv.conf from being overwritten
echo "----------------------------------------------"
echo "# Prevent resolv.conf from being overwritten"
echo "Ensuring resolv.conf is linked correctly to avoid overwrites..."
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

echo "-------------------------------------------"
echo "New DNS resolver settings applied. Checking performance..."
echo "-------------------------------------------"

# Measure new DNS response time
new_response_time=$(curl -o /dev/null -s -w "%{time_namelookup}" https://google.com)

echo "-------------------------------------------"
echo "Old performance was: ${old_response_time} seconds"
echo "New performance is: ${new_response_time} seconds"

if (( $(echo "$new_response_time < $old_response_time" | bc -l) )); then
	echo "✅ DNS resolution speed has improved!"
else
	echo "⚠️ No significant improvement in DNS resolution speed."
fi
