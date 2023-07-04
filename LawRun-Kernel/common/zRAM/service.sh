#!/system/bin/sh

MODDIR=${0%/*}

while [ "$(getprop sys.boot_completed)" != 1 ]; do
 sleep 2
done

# Permissions
chown root /system/etc/VirtualRam/VirtualRam.sh
chmod +x /system/etc/VirtualRam/VirtualRam.sh
/system/etc/VirtualRam/VirtualRam.sh &
