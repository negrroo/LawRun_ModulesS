#!/system/bin/sh

#Installed with LawRun Kernel
#Script by @negrroo

# zRam
swapoff /dev/block/zram0
echo "1" > /sys/block/zram0/reset
echo "0" > /sys/block/zram0/disksize
echo "4294967296" > /sys/block/zram0/disksize
echo "4096M" > /sys/block/zram0/mem_limit
echo "8" > /sys/block/zram0/max_comp_streams
mkswap /dev/block/zram0
swapon /dev/block/zram0 -p 32758
echo "100" > /proc/sys/vm/swappiness
echo "10" > /proc/sys/vm/dirty_background_ratio
echo "60" > /proc/sys/vm/vfs_cache_pressure
echo "3000" > /proc/sys/vm/dirty_writeback_centisecs
