#!/bin/sh
# This script will change some filesystem setting, do not use it in production !

echo "Tweaking filesystem...hold on .. "

# Enable writeback for better performance
tune2fs /dev/sda1 -O has_journal -o journal_data_writeback

# Disable journaling
#tune2fs -O ^has_journal /dev/sda1

# Do fs.check
#e2fsck -f /dev/sda1

MYUUID=$(blkid /dev/sda1 | awk '{print $2;}' | sed 's/"//g')

sed -i "s/"$MYUUID"/#"$MYUUID"/g" /etc/fstab
echo $MYUUID / ext4 errors=remount-ro,noatime,nodiratime,data=writeback,barrier=0,nobh,commit=100,nouser_xattr 0 1 >> /etc/fstab
