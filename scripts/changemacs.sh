#!/bin/sh

# Give 1 argument to only change one device
if [ ! -z "$1" ]; then
    echo "Changing MAC address of "$1
    macchanger -r $1
    echo ""
    exit 0
fi

devices=( $(ip link show | awk '{if ($1 ~ "[0-9]:") print substr($2, 1, length($2)-1) }') )

for device in "${devices[@]}"
do
    case $device in "e"*|"w"*)
        echo "Changing MAC address of "$device
        macchanger -r $device
        echo ""
    esac
done
