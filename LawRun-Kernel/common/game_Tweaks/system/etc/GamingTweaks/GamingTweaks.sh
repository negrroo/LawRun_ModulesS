#!/system/bin/sh

#Installed with LawRun Kernel
#Script by @negrroo

# Changes system.prop setting at Boot
		# Power Tweaks
		setprop sys.NV_FPSLIMIT 60
		setprop sys.NV_POWERMODE 1
		setprop sys.NV_PROFVER 15
		setprop sys.NV_STEREOCTRL 0
		setprop sys.NV_STEREOSEPCHG 0
		setprop sys.NV_STEREOSEP 20
		setprop sys.purgeable_assets 1

		# Graphics
		setprop debug.enabletr true
		setprop hwui.render_dirty_regions false
		setprop sys.composition.type c2d
		resetprop ro.sf.compbypass.enable 0

		setprop dev.pm.dyn_samplingrate 1
		setprop video.accelerate.hw 1
		resetprop ro.vold.umsdirtyratio 20
		setprop debug.egl.hw 1
		setprop debug.sf.hw 1
		setprop debug.composition.type c2d

		# Gaming
		setprop wifi.supplicant_scan_interval 300
