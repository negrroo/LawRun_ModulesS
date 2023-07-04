#!/system/bin/sh

MODDIR=${0%/*}

while [ "$(getprop sys.boot_completed)" != 1 ]; do
 sleep 2
done

# Permissions
chown root /system/etc/TouchTweaks/TouchTweaks.sh
chmod +x /system/etc/TouchTweaks/TouchTweaks.sh
/system/etc/TouchTweaks/TouchTweaks.sh &
