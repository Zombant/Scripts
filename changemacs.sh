#!/bin/sh

devices=( $(ip link show | awk '{if ($1 ~ "[0-9]:") print substr($2, 1, length($2)-1) }') )
for device in "${devices[@]}"
do
    echo "Changing MAC address of "$device
    macchanger -r $device
    echo ""
done
