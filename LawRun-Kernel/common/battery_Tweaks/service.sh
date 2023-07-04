#!/system/bin/sh

MODDIR=${0%/*}

while [ "$(getprop sys.boot_completed)" != 1 ]; do
 sleep 2
done

# Permissions
chown root /system/etc/BatteryTweaks/BatteryTweaks.sh
chmod +x /system/etc/BatteryTweaks/BatteryTweaks.sh
/system/etc/BatteryTweaks/BatteryTweaks.sh &
