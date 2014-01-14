#!/bin/sh
# This script will change some filesystem setting, do not use it in production !

# Enable writeback for better performance
tune2fs /dev/sda1 -O has_journal -o journal_data_writeback
# Disable journaling
#tune2fs -O ^has_journal /dev/sda1

# Do fs.check
#e2fsck -f /dev/sda1

MYUUID=$(blkid /dev/sda1 | awk '{print $2;}' | sed 's/"//g')

#echo "$MYUUID"
sed -i "s/"$MYUUID"/#"$MYUUID"/g" /etc/fstab
#sed "$MYUUID\"/s/^/#/g" file
#sed '11i\ "$MYUUID" / ext4 errors=remount-ro,noatime,nodiratime,data=writeback,barrier=0,nobh,commit=100,nouser_xattr 0 1' file
#awk 'NR==11{print ""$MYUUID" / ext4 errors=remount-ro,noatime,nodiratime,data=writeback,barrier=0,nobh,commit=100,nouser_xattr 0 1"}12' file
#sed -i '/#UUID=8f1288bd-791d-4d44-a2ff-0a40887e8e29/a '$MYUUID' / ext4 errors=remount-ro,noatime,nodiratime,data=writeback,barrier=0,nobh,commit=100,nouser_xattr 0 1' file
echo $MYUUID / ext4 errors=remount-ro,noatime,nodiratime,data=writeback,barrier=0,nobh,commit=100,nouser_xattr 0 1 >> /etc/fstab

