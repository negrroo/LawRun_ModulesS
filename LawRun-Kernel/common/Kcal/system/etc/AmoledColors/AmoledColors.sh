#!/system/bin/sh

#Installed with LawRun Kernel
#Script by @negrroo

# Changes kcal setting at Boot
echo "226" > /sys/module/msm_drm/parameters/kcal_red
echo "226" > /sys/module/msm_drm/parameters/kcal_green
echo "226" > /sys/module/msm_drm/parameters/kcal_blue
echo "275" > /sys/module/msm_drm/parameters/kcal_sat
echo "245" > /sys/module/msm_drm/parameters/kcal_val
echo "265" > /sys/module/msm_drm/parameters/kcal_cont
echo "0" > /sys/module/msm_drm/parameters/kcal_hue

if [ -d /sys/devices/platform/kcal_ctrl.0 ]; then
echo "35" > /sys/devices/platform/kcal_ctrl.0/kcal_min
echo "0" > /sys/devices/platform/kcal_ctrl.0/kcal_hue
echo "1" > /sys/devices/platform/kcal_ctrl.0/kcal_enable
echo "275" > /sys/devices/platform/kcal_ctrl.0/kcal_sat
echo "226 226 226" > /sys/devices/platform/kcal_ctrl.0/kcal
echo "265" > /sys/devices/platform/kcal_ctrl.0/kcal_cont
echo "245" > /sys/devices/platform/kcal_ctrl.0/kcal_vall
fi
