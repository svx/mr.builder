#!/usr/bin/env bash

if type apt-get >/dev/null 2>&1; then
    apt-get clean
fi

if type yum >/dev/null 2>&1; then
    yum clean all
fi

dd if=/dev/zero of=/junk bs=1M
rm -f /junk

# Make sure udev doesn't block our network
if grep -q -i "release 6" /etc/redhat-release ; then
rm /etc/udev/rules.d/70-persistent-net.rules
    mkdir /etc/udev/rules.d/70-persistent-net.rules
    rm /lib/udev/rules.d/75-persistent-net-generator.rules
fi
rm -rf /dev/.udev/
sed -i "/^HWADDR/d" /etc/sysconfig/network-scripts/ifcfg-eth0

sync
