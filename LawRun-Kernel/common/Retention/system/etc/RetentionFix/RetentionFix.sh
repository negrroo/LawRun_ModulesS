#!/system/bin/sh

#Installed with LawRun Kernel
#Script by @negrroo

# Changes kcal setting at Boot
echo "226" > /sys/module/msm_drm/parameters/kcal_red
echo "226" > /sys/module/msm_drm/parameters/kcal_green
echo "226" > /sys/module/msm_drm/parameters/kcal_blue

echo '226 226 226' > /sys/devices/platform/kcal_ctrl.0/kcal
