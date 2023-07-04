#!/system/bin/sh

MODDIR=${0%/*}

while [ "$(getprop sys.boot_completed)" != 1 ]; do
 sleep 2
done

# Permissions
chown root /system/etc/AmoledColors/AmoledColors.sh
chmod +x /system/etc/AmoledColors/AmoledColors.sh
/system/etc/AmoledColors/AmoledColors.sh &
