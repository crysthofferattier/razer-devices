#/bin/bash


# Setting config to make notify-send work with cronjob
userid=$(id -u)
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$userid/bus"
export DBUS_SESSION_BUS_ADDRESS

DEVICE_SERIAL_NUMBER=$(polychromatic-cli -l | grep mouse | awk '{ print $4}' | sed s/"(Wireless)mouse"// | sed s/"main,"//)

# Getting battery level
BATTERY_LEVEL=$(polychromatic-cli -s $DEVICE_SERIAL_NUMBER -k | grep "Battery" | cut -d'y' -f 2 | cut -d'%' -f 1)

notify-send "Razer Viper Ultimate (Wireless)" \
    "Battery level!!! - $BATTERY_LEVEL%"