#!/sbin/sh

LD_PATH=/system/lib
if [ -d /system/lib64 ]; then
  LD_PATH=/system/lib64
fi

exec_util() {
  LD_LIBRARY_PATH=/system/lib64 $UTILS $1
}

# Add LawRun Own thermal
umount /vendor || true
mount -o rw /dev/block/bootdevice/by-name/vendor /vendor
chmod -R 644 /tmp/anykernel/LawRun-Kernel/Files/Thermals/thermal-engine;
exec_util "cp -a /tmp/anykernel/LawRun-Kernel/Files/Thermals/thermal-engine /vendor/bin/"
umount /vendor || true
