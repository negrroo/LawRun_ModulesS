# AnyKernelx Ramdisk Mod Script
# osm0sis @ xda-developers
# negrroo
# LawRun-Kernel Edit.

## AnyKernel setup
# begin properties
properties() {
do.cleanup=1
do.cleanuponabort=1
do.cpucheck=1
cpu.name1=sdm845
cpu.name2=sdm710
cpu.name2=sdm660
} # end properties

# shell variables
block=

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak3-core.sh;

## AnyKernel permissions
# set permissions for included ramdisk files
set_perm_recursive 0 0 755 750 $ramdisk/*;


# Find boot partition
find_boot;

## AnyKernel install
dump_boot;

# begin ramdisk changes

# LawRun Setup
. /tmp/anykernel/LawRun-Kernel/Setup/LawRun.sh;

# end ramdisk changes

write_boot;

# end install
