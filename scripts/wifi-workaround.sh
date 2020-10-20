#!/bin/sh

echo 1 > /sys/bus/pci/devices/0000:03:00.0/remove
echo "Removed device"
killall wpa_supplicant
sleep 3
echo "Rescanning pci devices"
echo 1 > /sys/bus/pci/rescan

