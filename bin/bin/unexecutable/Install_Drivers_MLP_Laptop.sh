#!/bin/bash

cd

mkdir .tmp

cd .tmp

git clone https://github.com/Nevergiveup11837/mt7902driverforlinux.git

cd mt7902driverforlinux

chmod +x install_wifi_driver.sh

sudo ./install_wifi_driver.sh

reboot

# Source and more informetion: [Fedora Linux 41: No WiFi, No Bluetooth, Disk Not Recognized on ASUS Vivobook X1504VA : r/Fedora](https://www.reddit.com/r/Fedora/comments/1hx4vpw/fedora_linux_41_no_wifi_no_bluetooth_disk_not/)
