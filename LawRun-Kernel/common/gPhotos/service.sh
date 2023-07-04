#!/system/bin/sh

MODDIR=${0%/*}

while [ "$(getprop sys.boot_completed)" != 1 ]; do
 sleep 2
done

# Permissions
chown root /system/etc/UnlimitedPhotos/UnlimitedPhotos.sh
chmod +x /system/etc/UnlimitedPhotos/UnlimitedPhotos.sh
/system/etc/UnlimitedPhotos/UnlimitedPhotos.sh &
