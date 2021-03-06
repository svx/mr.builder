# Clean up
apt-get -y remove linux-headers-$(uname -r) build-essential
apt-get -y autoremove
apt-get -y clean

echo "cleaning up gest additions"
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?


# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
if [ -d "/var/lib/dhcp" ]; then
    # Remove leftover leases and persistent rules
    rm /var/lib/dhcp/*
fi

# Make sure Udev doesn't block our network
echo "cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces

echo "Cleaning /tmp"
rm -rf /tmp/*

echo "cleaning logs"
find /var/log -type f -exec /bin/cp /dev/null {} \;

# Todo
# check: http://debianforum.de/forum/viewtopic.php?f=12&t=143452,
# 70-persistent-net.rules was not there last time, need to check again
