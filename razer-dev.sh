#/bin/bash

userid=$(id -u)
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$userid/bus"
export DBUS_SESSION_BUS_ADDRESS

BATTERY_LEVEL=$(polychromatic-cli -s PM2124H12700886 -k | grep "Battery" | cut -d'y' -f 2 | cut -d'%' -f 1)

echo $BATTERY_LEVEL

if [ $BATTERY_LEVEL -gt 20 ]
then
    notify-send --urgency=critical "Low battery!!! $BATTERY_LEVEL%" \
    "Please charge Razer Viper Ultimate (Wireless)"
fi