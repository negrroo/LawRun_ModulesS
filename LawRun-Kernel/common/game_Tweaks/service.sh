#!/system/bin/sh

MODDIR=${0%/*}

while [ "$(getprop sys.boot_completed)" != 1 ]; do
 sleep 2
done

# Permissions
chown root /system/etc/GamingTweaks/GamingTweaks.sh
chmod +x /system/etc/GamingTweaks/GamingTweaks.sh
/system/etc/GamingTweaks/GamingTweaks.sh &
