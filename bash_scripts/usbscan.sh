#!/bin/bash
# This script lists all USB devices currently connected to the system.
# For each device, it lists the device file and the serial number.

for sysdevpath in $(find /sys/bus/usb/devices/usb*/ -name dev); do
    (
        syspath="${sysdevpath%/dev}"
        devname="$(udevadm info --query=name --path=$syspath)"
        [[ "$devname" == "bus/"* ]] && exit
        eval "$(udevadm info --query=property --export --path=$syspath)"
        [[ -z "$ID_SERIAL" ]] && exit
        echo "/dev/$devname - $ID_SERIAL"
    )
done
