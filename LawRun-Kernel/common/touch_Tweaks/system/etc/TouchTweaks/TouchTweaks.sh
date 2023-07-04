#!/system/bin/sh

#Installed with LawRun Kernel
#Script by @negrroo

# Changes system.prop setting at Boot
setprop touch.pressure.scale 0.001
setprop persist.sys.ui.hw 1
setprop view.scroll_friction 10
setprop touch.size.calibration diameter
setprop touch.size.scale 1
setprop touch.size.bias 0
setprop touch.size.isSummed 0
setprop touch.orientation.calibration none
setprop touch.distance.calibration none
setprop touch.distance.scale 0
setprop touch.coverage.calibration box
setprop touch.gestureMode spots
setprop MultitouchSettleInterval 1ms
setprop MultitouchMinDistance 1px
setprop TapInterval 1ms
setprop TapSlop 1px


# New for test

setprop service.lgospd.enable 0
setprop service.pcsync.enable 0
setprop ro.ril.enable.a52 1
setprop ro.ril.enable.a53 0

setprop touch.deviceType touchScreen
setprop touch.orientationAware 1
setprop touch.pressure.calibration physical
