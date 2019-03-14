#!/bin/bash

# Run this script to update the files 
# which will overwrite the corresponding files in AOSP
#
# Note: confirm the android project path first
#
ANDROID_ROOT_PATH=/home/chengbin/p9.0_android_imx8

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

exit