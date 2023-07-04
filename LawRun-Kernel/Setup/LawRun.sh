#!/sbin/sh

################################################################################
            #=================================================#
            #        **          ******      negrroo          #
            #        **          *    *      **   **          #
            #        **          ******      **  **           #
            #        **          **          *****            #
            #        *******     ** **       **  **           #
            #        *******     **   **     **   **          #
            #=================================================#
############################## Installation ####################################

# Clear
ui_print "";
ui_print "";

# If magisk installed will go with installation way
if [ -d $ramdisk/.backup ]; then
mkdir -p /data/adb/modules
cp -R /tmp/anykernel/LawRun-Kernel/Setup/Lawrunkernel /data/adb/modules
ui_print "                                                  "
ui_print "                                                  "
ui_print " This is LawRun-Kernel Installation you can follow it to choose what you want to install"
ui_print "                                                  "
ui_print "                                                  "
else
# You cannot run without magisk
ui_print "You need Magisk to install this file"

# Built-in Thermals without Magisk 
ui_print "New!!! You will get LawRun Buil-in Thermals installed even you dont have magisk"
. /tmp/anykernel/LawRun-Kernel/Setup/Thermal.sh;
ui_print "-> Installing LawRun Built-in Thermals";
ui_print "-> Dont Cry of heating...";
ui_print "-> Reflash your rom is recommended to remove it";
fi

########################### Test Keys-Vol+ Vol- ################################

# Clear
ui_print "";
ui_print "";

keytest() {
  ui_print "   Press a Vol Key..."
  (/system/bin/getevent -lc 1 2>&1 | /system/bin/grep VOLUME | /system/bin/grep " DOWN" > /tmp/anykernel/events) || return 1
  return 0
}

chooseport() {
  #note from chainfire @xda-developers: getevent behaves weird when piped, and busybox grep likes that even less than toolbox/toybox grep
  while (true); do
    /system/bin/getevent -lc 1 2>&1 | /system/bin/grep VOLUME | /system/bin/grep " DOWN" > /tmp/anykernel/events
    if (`cat /tmp/anykernel/events 2>/dev/null | /system/bin/grep VOLUME >/dev/null`); then
      break
    fi
  done
  if (`cat /tmp/anykernel/events 2>/dev/null | /system/bin/grep VOLUMEUP >/dev/null`); then
    return 0
  else
    return 1
  fi
}

chooseportold() {
  # Calling it first time detects previous input. Calling it second time will do what we want
  $bin/keycheck
  $bin/keycheck
  SEL=$?
  if [ "$1" == "UP" ]; then
    UP=$SEL
  elif [ "$1" == "DOWN" ]; then
    DOWN=$SEL
  elif [ $SEL -eq $UP ]; then
    return 0
  elif [ $SEL -eq $DOWN ]; then
    return 1
  else
    abort "   Vol key not detected!"
  fi
}

if [ -d $ramdisk/.backup ]; then
if [ ! -f /data/lawrunconfig/skip ]; then
if keytest; then
  FUNCTION=chooseport
else
  FUNCTION=chooseportold
  ui_print "   Press Vol Up Again..."
  $FUNCTION "UP"
  ui_print "   Press Vol Down..."
  $FUNCTION "DOWN"
fi

############################# Magisk-Modules ###################################

# Clear
ui_print "";
ui_print "";

# Constants
modulesConstant=/tmp/anykernel/LawRun-Kernel/common
modulesVersion=/data/adb/modules
naming=/module.prop

# Catching versions
cModules=$(awk 'NR==3' $modulesConstant/Modules$naming)
vModules=$(awk 'NR==3' $modulesVersion/Modules$naming)
cKcal=$(awk 'NR==3' $modulesConstant/Kcal$naming)
cKcal=$(awk 'NR==3' $modulesVersion/Kcal$naming)
cRetention=$(awk 'NR==3' $modulesConstant/Retention$naming)
vRetention=$(awk 'NR==3' $modulesVersion/Retention$naming)
czRAM=$(awk 'NR==3' $modulesConstant/zRAM$naming)
vzRAM=$(awk 'NR==3' $modulesVersion/zRAM$naming)
cPAWA9N=$(awk 'NR==3' $modulesConstant/PAWA9N.S-THERMAL.V1$naming)
vPAWA9N=$(awk 'NR==3' $modulesVersion/PAWA9N.S-THERMAL.V1$naming)
cLawRun_Thermals=$(awk 'NR==3' $modulesConstant/LawRun-Thermals$naming)
vLawRun_Thermals=$(awk 'NR==3' $modulesVersion/LawRun-Thermals$naming)
cLawRun_Thermals_x=$(awk 'NR==3' $modulesConstant/LawRun-Thermals_x$naming)
vLawRun_Thermals_x=$(awk 'NR==3' $modulesVersion/LawRun-Thermals_x$naming)
cSDM660_EAS_perfHAL_Module=$(awk 'NR==3' $modulesConstant/SDM660_EAS_perfHAL_Module$naming)
vSDM660_EAS_perfHAL_Module=$(awk 'NR==3' $modulesVersion/SDM660_EAS_perfHAL_Module$naming)
ctouch_Tweaks=$(awk 'NR==3' $modulesConstant/touch_Tweaks$naming)
vtouch_Tweaks=$(awk 'NR==3' $modulesVersion/touch_Tweaks$naming)
cgame_Tweaks=$(awk 'NR==3' $modulesConstant/game_Tweaks$naming)
vgame_Tweaks=$(awk 'NR==3' $modulesVersion/game_Tweaks$naming)
cbattery_Tweaks=$(awk 'NR==3' $modulesConstant/battery_Tweaks$naming)
vbattery_Tweaks=$(awk 'NR==3' $modulesVersion/battery_Tweaks$naming)
cUclamp=$(awk 'NR==3' $modulesConstant/Uclamp$naming)
vUclamp=$(awk 'NR==3' $modulesVersion/Uclamp$naming)
cVolume_Booster=$(awk 'NR==3' $modulesConstant/Volume_Booster$naming)
vVolume_Booster=$(awk 'NR==3' $modulesVersion/Volume_Booster$naming)
cgPhotos=$(awk 'NR==3' $modulesConstant/gPhotos$naming)
vgPhotos=$(awk 'NR==3' $modulesVersion/gPhotos$naming)

if [ "$cModules" != "$vModules" ]; then
# Modules
ui_print "-> Installing LawRun-Modules...";
MODMagisk=/data/adb/modules/Modules
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/Modules/* $MODMagisk
chmod 755 $MODMagisk/service.sh
fi

if [ "$cKcal" != "$vKcal" ] || [ "$cRetention" != "$vRetention" ]; then
# kcal
ui_print " "
ui_print "- Do you want LawRun Display Amoled colors? -"
ui_print "   Vol+ = Yes, Vol- = No"
ui_print "   Vol+ = Yes (Amoled Colors or Fix retention Only), Vol- = No (Nothing)"
if $FUNCTION; then
ui_print "   Yes!!... you will have LawRun Display Amoled colors + Fix retention"
ui_print "   No!!... you will have LawRun Fix retention Module only"
if $FUNCTION; then
ui_print "-> Installing LawRun Amoled colors Magisk Module...";
MODMagisk=/data/adb/modules/Kcal
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/Kcal/* $MODMagisk
chmod 755 $MODMagisk/service.sh
if [ -d /data/adb/modules/Retention ]; then
rm -rfv /data/adb/modules/Retention;
fi
else
ui_print "-> Installing LawRun Fix retention Magisk Module...";
MODMagisk=/data/adb/modules/Retention
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/Retention/* $MODMagisk
chmod 755 $MODMagisk/service.sh
if [ -d /data/adb/modules/Kcal ]; then
rm -rfv /data/adb/modules/Kcal;
fi
fi
else
ui_print "Skipping..."
if [ -d /data/adb/modules/Kcal ]; then
MODMagisk=/data/adb/modules/Kcal
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/Kcal;
fi
if [ -d /data/adb/modules/Retention ]; then
MODMagisk=/data/adb/modules/Retention
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/Retention;
fi
fi
fi

if [ "$czRAM" != "$vzRAM" ]; then
# zRAM
ui_print " "
ui_print "- Do you want Extra 4Gb zRAM? -"
ui_print "   Vol+ = Yes, Vol- = No"
if $FUNCTION; then
ui_print "-> Installing zRAM Magisk Module...";
ui_print "-> This is a Virtual Ram...";
MODMagisk=/data/adb/modules/zRAM
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/zRAM/* $MODMagisk
chmod 755 $MODMagisk/service.sh
else
if [ -d /data/adb/modules/zRAM ]; then
ui_print "Skipping..."
MODMagisk=/data/adb/modules/zRAM
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/zRAM;
fi
fi
fi

if [ "$cPAWA9N" != "$vPAWA9N" ] && [ "$cLawRun_Thermals" != "$vLawRun_Thermals" ] && [ "$cLawRun_Thermals_x" != "$vLawRun_Thermals_x" ]; then
# Choose Thermals
ui_print " "
ui_print "-  Do you want LawRun Thermals? -"
ui_print "-  For Best Charging speed & Performance!! - "
ui_print "   Vol+ = Yes, Vol- = No"
ui_print " "
ui_print "   Yes!!... you will have some thermal choices"
ui_print "   No!!... (Nothing)"
ui_print "                     "
if $FUNCTION; then
# Ask for sdm!
ui_print " "
ui_print "-  Do you have sdm845? -"
ui_print "-  Device poco for example!! - "
ui_print "   Vol+ = Yes, Vol- = No"
ui_print "                     "
if $FUNCTION; then
# Choose Thermals
ui_print " "
ui_print "-  Do you want LawRun Thermals? -"
ui_print "-  For Best Charging speed & Performance!! - "
ui_print "   Vol+ = Yes, Vol- = No"
ui_print " "
ui_print "   Yes!!... you will Built-in Thermals"
ui_print "   No!!... Choose again (LawRun Magisk Thermals & PAWAN Thermals)"
ui_print "                     "
if $FUNCTION; then
ui_print "-> Installing LawRun Built-in Thermals";
ui_print "-> Dont Cry of heating...";
ui_print "-> Reflash your rom is recommended to remove it";
# Custom Thermal
. /tmp/anykernel/LawRun-Kernel/Setup/Thermal.sh;
cp -R $modulesConstant/Thermals /data/adb/modules
	## Clearning other magisk Thermals
	if [ -d /data/adb/modules/LawRun-Thermals ]; then
	# Clear LawRun Thermals Magisk module
	MODMagisk=/data/adb/modules/LawRun-Thermals
	# Place MOD options
	rm -rf $MODMagisk
	rm -rfv /data/adb/modules/LawRun-Thermals;
	fi
	if [ -d /data/adb/modules/PAWA9N.S-THERMAL.V1 ]; then
	# Clear LawRun Thermals Magisk module
	MODMagisk=/data/adb/modules/PAWA9N.S-THERMAL.V1
	# Place MOD options
	rm -rf $MODMagisk
	rm -rfv /data/adb/modules/PAWA9N.S-THERMAL.V1;
	fi
	if [ -d /data/adb/modules/LawRun-Thermals_x ]; then
	# Clear LawRun Thermals Magisk module
	MODMagisk=/data/adb/modules/LawRun-Thermals_x
	# Place MOD options
	rm -rf $MODMagisk
	rm -rfv /data/adb/modules/LawRun-Thermals_x;
	fi
else
ui_print "   Vol+ = Yes, Vol- = No"
ui_print "   Yes!!... you will have LawRun Magisk Thermals"
ui_print "   No!!... you will have PAWAN Thermals"
ui_print "                     "
if $FUNCTION; then
ui_print "-> Installing LawRun Thermals as a magisk module";
ui_print "-> Dont Cry of Heating...";
MODMagisk=/data/adb/modules/LawRun-Thermals
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/LawRun-Thermals/* $MODMagisk
chmod 755 $MODMagisk/service.sh
	if [ -d /data/adb/modules/PAWA9N.S-THERMAL.V1 ]; then
	# Clear LawRun Thermals Magisk module
	MODMagisk=/data/adb/modules/PAWA9N.S-THERMAL.V1
	# Place MOD options
	rm -rf $MODMagisk
	rm -rfv /data/adb/modules/PAWA9N.S-THERMAL.V1;
	fi
	if [ -d /data/adb/modules/LawRun-Thermals_x ]; then
	# Clear LawRun Thermals Magisk module
	MODMagisk=/data/adb/modules/LawRun-Thermals_x
	# Place MOD options
	rm -rf $MODMagisk
	rm -rfv /data/adb/modules/LawRun-Thermals_x;
	fi
else
ui_print "-> Installing PAWAN Thermals Module...";
ui_print "-> DOnt Cry of heating...";
ui_print "- Cred: DUDE PAWAN -"
MODMagisk=/data/adb/modules/PAWA9N.S-THERMAL.V1
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/PAWA9N.S-THERMAL.V1/* $MODMagisk
chmod 755 $MODMagisk/service.sh
	## Clearning other magisk Thermals
	if [ -d /data/adb/modules/LawRun-Thermals ]; then
	# Clear LawRun Thermals Magisk module
	MODMagisk=/data/adb/modules/LawRun-Thermals
	# Place MOD options
	rm -rf $MODMagisk
	rm -rfv /data/adb/modules/LawRun-Thermals;
	fi
	if [ -d /data/adb/modules/LawRun-Thermals_x ]; then
	# Clear LawRun Thermals Magisk module
	MODMagisk=/data/adb/modules/LawRun-Thermals_x
	# Place MOD options
	rm -rf $MODMagisk
	rm -rfv /data/adb/modules/LawRun-Thermals_x;
	fi
fi
fi
else
# Thermals selection
ui_print " "
ui_print "-  Do you want LawRun Thermals? -"
ui_print "-  For Best Charging speed & Performance!! - "
ui_print "   Vol+ = Yes, Vol- = No"
if $FUNCTION; then
ui_print "-  Built-in Or Magisk ? -"
ui_print "   Vol+ = Yes, Vol- = No"
ui_print " Yes,Built-in one which is better"
ui_print " No,the Magisk Module"
# Built-in Thermal
if $FUNCTION; then
ui_print "-> Installing LawRun Built-in Thermals";
ui_print "-> Dont Cry of heating...";
ui_print "-> Reflash your rom is recommended to remove it";
# Custom Thermal
. /tmp/anykernel/LawRun-Kernel/Setup/Thermal.sh;
cp -R $modulesConstant/Thermals /data/adb/modules
else
ui_print "-> Installing LawRun Thermals as a magisk module";
ui_print "-> Dont Cry of Heating...";
MODMagisk=/data/adb/modules/LawRun-Thermals_x
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/LawRun-Thermals_x/* $MODMagisk
chmod 755 $MODMagisk/service.sh
fi
else
ui_print "Skipping..."
if [ -d /data/adb/modules/LawRun-Thermals_x ]; then
# Clear LawRun Thermals Magisk module
MODMagisk=/data/adb/modules/LawRun-Thermals_x
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/LawRun-Thermals_x;
fi
fi
fi
fi
fi

if [ "$cSDM660_EAS_perfHAL_Module" != "$vSDM660_EAS_perfHAL_Module" ] && (grep -qi 660 /system/build.prop || grep -qi 636 /system/build.prop); then
# SDM660_EAS_perfHAL_Module
ui_print " "
ui_print "- Do you want EAS_perfHAL Thermal? -"
ui_print "- Be Sure you didnt use 2 thermals together? -"
ui_print "- This thermals specially for sdm660 & sdm636 hmp roms? -"
ui_print "   Vol+ = Yes, Vol- = No"
if $FUNCTION; then
ui_print "-> Installing EAS_perfHAL Magisk Module...";
MODMagisk=/data/adb/modules/SDM660_EAS_perfHAL_Module
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/SDM660_EAS_perfHAL_Module/* $MODMagisk
chmod 755 $MODMagisk/service.sh
	## Clearning other magisk Thermals
	if [ -d /data/adb/modules/LawRun-Thermals ]; then
	# Clear LawRun Thermals Magisk module
	MODMagisk=/data/adb/modules/LawRun-Thermals
	# Place MOD options
	rm -rf $MODMagisk
	rm -rfv /data/adb/modules/LawRun-Thermals;
	fi
	if [ -d /data/adb/modules/PAWA9N.S-THERMAL.V1 ]; then
	# Clear LawRun Thermals Magisk module
	MODMagisk=/data/adb/modules/PAWA9N.S-THERMAL.V1
	# Place MOD options
	rm -rf $MODMagisk
	rm -rfv /data/adb/modules/PAWA9N.S-THERMAL.V1;
	fi
	if [ -d /data/adb/modules/LawRun-Thermals_x ]; then
	# Clear LawRun Thermals Magisk module
	MODMagisk=/data/adb/modules/LawRun-Thermals_x
	# Place MOD options
	rm -rf $MODMagisk
	rm -rfv /data/adb/modules/LawRun-Thermals_x;
	fi
else
ui_print "Skipping..."
if [ -d /data/adb/modules/SDM660_EAS_perfHAL_Module ]; then
# Clear LawRun Thermals Magisk module
MODMagisk=/data/adb/modules/SDM660_EAS_perfHAL_Module
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/SDM660_EAS_perfHAL_Module;
fi
fi
fi

if [ "$ctouch_Tweaks" != "$vtouch_Tweaks" ]; then
# touch_Tweaks
ui_print " "
ui_print "- Do you want LawRun touch_Tweaks? -"
ui_print "   Vol+ = Yes, Vol- = No"
if $FUNCTION; then
ui_print "-> Installing touch_Tweaks Magisk Module...";
MODMagisk=/data/adb/modules/touch_Tweaks
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/touch_Tweaks/* $MODMagisk
chmod 755 $MODMagisk/service.sh
else
if [ -d /data/adb/modules/touch_Tweaks ]; then
ui_print "Skipping..."
MODMagisk=/data/adb/modules/touch_Tweaks
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/touch_Tweaks;
fi
fi
fi

if [ "$cgame_Tweaks" != "$vgame_Tweaks" ]; then
# game_Tweaks
ui_print " "
ui_print "- Do you want LawRun game_Tweaks? -"
ui_print "   Vol+ = Yes, Vol- = No"
if $FUNCTION; then
ui_print "-> Installing game_Tweaks Magisk Module...";
MODMagisk=/data/adb/modules/game_Tweaks
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/game_Tweaks/* $MODMagisk
chmod 755 $MODMagisk/service.sh
else
if [ -d /data/adb/modules/game_Tweaks ]; then
ui_print "Skipping..."
MODMagisk=/data/adb/modules/game_Tweaks
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/game_Tweaks;
fi
fi
fi

if [ "$cbattery_Tweaks" != "$vbattery_Tweaks" ]; then
# battery_Tweaks
ui_print " "
ui_print "- Do you want LawRun battery_Tweaks? -"
ui_print "   Vol+ = Yes, Vol- = No"
if $FUNCTION; then
ui_print "-> Installing battery_Tweaks Magisk Module...";
MODMagisk=/data/adb/modules/battery_Tweaks
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/battery_Tweaks/* $MODMagisk
chmod 755 $MODMagisk/service.sh
else
if [ -d /data/adb/modules/battery_Tweaks ]; then
ui_print "Skipping..."
MODMagisk=/data/adb/modules/battery_Tweaks
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/battery_Tweaks;
fi
fi
fi

if [ "$cUclamp" != "$vUclamp" ]; then
# Uclamp
ui_print " "
ui_print "- Do you want Uclamp Module? -"
ui_print "   Vol+ = Yes, Vol- = No"
if $FUNCTION; then
ui_print "-> Installing Uclamp Module...";
MODMagisk=/data/adb/modules/Uclamp
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/Uclamp/* $MODMagisk
chmod 755 $MODMagisk/service.sh
else
if [ -d /data/adb/modules/Uclamp ]; then
ui_print "Skipping..."
MODMagisk=/data/adb/modules/Uclamp
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/Uclamp;
fi
fi
fi

if [ "$cVolume_Booster" != "$vVolume_Booster" ]; then
# Volume Booster
ui_print " "
ui_print "- Do you want Volume Booster Module? -"
ui_print "- May not work for all devices, all roms or you may face bootloop! -"
ui_print "   Vol+ = Yes, Vol- = No"
if $FUNCTION; then
ui_print "-> Installing Volume Booster Module...";
MODMagisk=/data/adb/modules/Volume_Booster
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/Volume_Booster/* $MODMagisk
chmod 755 $MODMagisk/service.sh
else
if [ -d /data/adb/modules/Volume_Booster ]; then
ui_print "Skipping..."
MODMagisk=/data/adb/modules/Volume_Booster
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/Volume_Booster;
fi
fi
fi

if [ "$cgPhotos" != "$vgPhotos" ]; then
# gPhotos Unlocker
ui_print " "
ui_print "- Do you want gPhotos Unlocker Module? -"
ui_print "- May not work for all devices, all roms or you may face bootloop! -"
ui_print "   Vol+ = Yes, Vol- = No"
if $FUNCTION; then
ui_print "-> Installing gPhotos Unlocker Module...";
MODMagisk=/data/adb/modules/gPhotos
# Place MOD options
rm -rf $MODMagisk
mkdir -p $MODMagisk
cp -Rf $modulesConstant/gPhotos/* $MODMagisk
chmod 755 $MODMagisk/service.sh
else
if [ -d /data/adb/modules/gPhotos ]; then
ui_print "Skipping..."
MODMagisk=/data/adb/modules/gPhotos
# Place MOD options
rm -rf $MODMagisk
rm -rfv /data/adb/modules/gPhotos;
fi
fi
fi

# Permissiver
ui_print " "
ui_print "- Do you want Change Selinux Policy? -"
ui_print "- Permissive, Enforcing or nothing -"
ui_print "   Vol+ = Yes (Permissive Or Enforcing), Vol- = No (Nothing)"
if $FUNCTION; then
ui_print "- Do you want Permissive Selinux? -"
ui_print "- If you faced Internal Storage Missing click Yes! -"
ui_print "   Vol+ = Yes (Permissive), Vol- = No (Enforcing)"
if $FUNCTION; then
ui_print "-> Patching Permissive Selinux...";
patch_cmdline "androidboot.selinux=permissive" "androidboot.selinux=permissive"
# LawRun Permissiver
cp -R $modulesConstant/Permissiver /data/adb/modules
else
ui_print "-> Patching Enforcing Selinux...";
patch_cmdline "androidboot.selinux=permissive" ""
# LawRun Permissiver
cp -R $modulesConstant/Enforcing /data/adb/modules
fi
else
ui_print "Skipping..."
fi

# LICENSE
. /tmp/anykernel/LawRun-Kernel/Setup/LICENSE.sh;

############################### LawRun-End #####################################

fi
fi
