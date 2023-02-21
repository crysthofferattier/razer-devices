#/bin/bash


# Setting config to make notify-send work with cronjob
userid=$(id -u)
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$userid/bus"
export DBUS_SESSION_BUS_ADDRESS

# Getting battery level
BATTERY_LEVEL=$(polychromatic-cli -s PM2124H12700886 -k | grep "Battery" | cut -d'y' -f 2 | cut -d'%' -f 1)

# If battery level is lower than 20% show notification
if [ $BATTERY_LEVEL -lt 20 ]
then
    notify-send --urgency=critical "Low battery!!! $BATTERY_LEVEL%" \
    "Please charge Razer Viper Ultimate (Wireless)"
fi