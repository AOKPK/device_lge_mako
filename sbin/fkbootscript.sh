#!/system/bin/sh

# disable sysctl.conf to prevent ROM interference with tunables
# backup and replace PowerHAL with custom build to allow OC/UC to survive screen off
# create and set permissions for /system/etc/init.d if it doesn't already exist

echo 90 1350000:90 1512000:99 > /sys/devices/system/cpu/cpufreq/interactive/target_loads