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
#############################LawRun-Initation###################################

# Clear
ui_print "                                    ";
ui_print "                                    ";

############################# LawRun-LICENSE ###################################

# Install LawRun summary
	ui_print "                 LawRun summary                ";
ui_print "                                    ";
ui_print "                                    ";
if [ -d /data/adb/magisk ]; then
if [ -d /data/adb/modules/Modules ]; then
    ui_print "LawRun Modules Installed...";
fi;
if [ -d /data/adb/modules/zRAM ]; then
    ui_print "LawRun Virtual Ram Installed...";
fi;
if [ -d /data/adb/modules/Thermals ]; then
    ui_print "LawRun thermal Installed (Built-in)...";
rm -rfv /data/adb/modules/Thermals;
fi
if [ -d /data/adb/modules/LawRun-Thermals ]; then
    ui_print "LawRun thermal Installed (Magisk)...";
fi
if [ -d /data/adb/modules/PAWA9N.S-THERMAL.V1 ]; then
    ui_print "PAWAN thermals Installed (Magisk)...";
fi
if [ -d /data/adb/modules/Retention ]; then
    ui_print "LawRun Retention Fix Included...";
fi
if [ -d /data/adb/modules/Kcal ]; then
    ui_print "LawRun Amoled Colors + Retention Fix Included...";
fi
if [ -d /data/adb/modules/battery_Tweaks ]; then
    ui_print "LawRun battery_Tweaks Included...";
fi
if [ -d /data/adb/modules/game_Tweaks ]; then
    ui_print "LawRun game_Tweaks Included...";
fi
if [ -d /data/adb/modules/touch_Tweaks ]; then
    ui_print "LawRun touch_Tweaks Included...";
fi
if [ -d /data/adb/modules/LawRun-Thermals_x ]; then
    ui_print "LawRun Thermals Included...";
fi
if [ -d /data/adb/modules/Uclamp ]; then
    ui_print "Uclamp Module Installed...";
fi;
if [ -d /data/adb/modules/gPhotos ]; then
    ui_print "LawRun gPhotos Module Installed...";
fi;
if [ -d /data/adb/modules/Permissiver ]; then
    ui_print "LawRun Permissiver Included...";
rm -rfv /data/adb/modules/Permissiver;
elif [ -d /data/adb/modules/Enforcing ]; then
    ui_print "LawRun Enforcing Included...";
rm -rfv /data/adb/modules/Enforcing;
fi;
else
ui_print "                                    ";
fi
    ui_print "                                    ";
    ui_print "Download Our App from our website linked below...";
    ui_print "Website ==> https://lawrun-kernel.blogspot.com...";
    ui_print "Telegram ==> https://t.me/LawRunKernel...";
    ui_print "Email ==> lawrunbynegrroo@gmail.com...";
    ui_print "                  Dont forget                    ";
    ui_print "            ALWAYS BE READY TO RUN!!              ";

############################### LawRun-End #####################################
