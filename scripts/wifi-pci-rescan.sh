#!/bin/bash
WIFI_PCI_ID=`lspci -D | grep 7265 | awk '{print $1}'`
WIFI_PCI_ID_PATH=/sys/bus/pci/devices/${WIFI_PCI_ID}
WIFI_ROOT_PORT=/sys`udevadm info -a /sys/bus/pci/devices/${WIFI_PCI_ID}/ | grep "looking at parent device" | head -1 | awk '{print $5}' | sed "s/'//g" | sed 's/.$//g'`

ip link set dev wlp3s0 down
echo ${WIFI_PCI_ID} > /sys/bus/pci/drivers/iwlwifi/unbind
echo 1 > ${WIFI_PCI_ID_PATH}/remove
sleep 3
echo 1 > ${WIFI_ROOT_PORT}/rescan
echo ${WIFI_PCI_ID} > /sys/bus/pci/drivers/iwlwifi/bind
ip link set dev wlp3s0 up
