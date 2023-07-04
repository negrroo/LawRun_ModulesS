#!/system/bin/sh

#Installed with LawRun Kernel
#Script by @negrroo

# Changes system.prop setting at Boot
		# PowerSaving
		setprop radio.add_power_save 1
		resetprop ro.ril.power_collapse 1
		setprop pm.sleep_mode 1
		setprop power_supply.wakeup enable
		resetprop ro.config.hw_fast_dormancy 1
		resetprop ro.config.hw_power_saving 1
