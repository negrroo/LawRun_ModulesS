#!/system/bin/sh

#Installed with LawRun Kernel
#Script by @negrroo

PixelCheck=`getprop ro.product.manufacturer`
	if [ "${PixelCheck}" != Google ]; then
ro.build.fingerprint=google/sailfish/sailfish:10/QP1A.191005.007.A3/5972272:user/release-keys
ro.product.brand=google
ro.product.name=sailfish
ro.product.manufacturer=Google
ro.product.model=Pixel
	fi
