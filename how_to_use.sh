#!/bin/bash

# Run this script to update the files 
# which will overwrite the corresponding files in AOSP
#
# Note: confirm the android project path first
#
ANDROID_ROOT_PATH=/home/nick/p9.0_android_imx8

################ MAINBODY ############################################
help() {
bn=$(basename $0)
cat << EOFG
usage :  $bn <option>

options:
  -h		displays this help message
  -a		copy these files to update the android source project

EOFG
}
[ $# -lt 1 -o $# -gt 1 ] && help && exit
[ "$1" != "-a" ] && help && exit

# check the AOSP directory
if [ ! -d ${ANDROID_ROOT_PATH} ]; then
    echo ""
    echo "Error: ${ANDROID_ROOT_PATH} is not found !"
    echo ""
    echo "Please specify a correct AOSP path to the ANDROID_ROOT_PATH,"
    echo "and ANDROID_ROOT_PATH is in the 8th line of this script."
    echo ""
    echo "use the command \"vim how_to_use.sh +8\" to modify."
    echo ""
	exit
fi
echo ${ANDROID_ROOT_PATH}
# ==================== frameworks =====================================
#  @file-name: config.xml
#  @path     : frameworks/base/core/res/res/values/config.xml
#  @git      : frameworks/base
#  @commit-message:
#		Date:modify NTP server
#				solve the problem that the system cannot automatically 
#				update the date and time over the network
mdfile_frameworks_1=frameworks/base/core/res/res/values/config.xml
cp -f ${mdfile_frameworks_1} ${ANDROID_ROOT_PATH}/${mdfile_frameworks_1}
echo "copy file to ${mdfile_frameworks_1}"

# ==================== system =====================================
#  @file-name: BatteryMonitor.cpp
#  @path     : system/core/healthd/BatteryMonitor.cpp
#  @git      : system/core
#  @commit-message:
#		Battery:Mask charging logs in the serial console
mdfile_system_1=system/core/healthd/BatteryMonitor.cpp
cp -f ${mdfile_system_1} ${ANDROID_ROOT_PATH}/${mdfile_system_1}
echo "copy file to ${mdfile_system_1}"

# ==================== frameworks =====================================
#  @file-name: NetworkMonitor.java
#  @path     : frameworks/base/services/core/java/com/android/server/connectivity/NetworkMonitor.java
#  @git      : frameworks/base
#  @commit-message:
#		WIFI:skip captive portal detection
#				disable mIsCaptivePortalCheckEnabled to solve the problem that 
#               is show "Connected, no Internet" while it is successful for WIFI
#               connection and can access the Internet.
#  @modified-date: 2019-11-4
mdfile_frameworks_2=frameworks/base/services/core/java/com/android/server/connectivity/NetworkMonitor.java
cp -f ${mdfile_frameworks_2} ${ANDROID_ROOT_PATH}/${mdfile_frameworks_2}
echo "copy file to ${mdfile_frameworks_2}"

exit