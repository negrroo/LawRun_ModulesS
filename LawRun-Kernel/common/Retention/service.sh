#!/system/bin/sh

MODDIR=${0%/*}

while [ "$(getprop sys.boot_completed)" != 1 ]; do
 sleep 2
done

# Permissions
chown root /system/etc/RetentionFix/RetentionFix.sh
chmod +x /system/etc/RetentionFix/RetentionFix.sh
/system/etc/RetentionFix/RetentionFix.sh &
