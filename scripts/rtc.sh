#!/bin/sh

sudo apt-get install python-smbus i2c-tools -y

sudo echo -e "\ndtoverlay=i2c-rtc,ds3231" >> /boot/config.txt
sudo apt-get purge fake-hwclock -y
sudo dpkg-reconfigure tzdata

sudo sed -i "/exit 0/i \/sbin\/hwclock -s\/" /etc/rc.local
sudo sed -i 's/HWCLOCKACCESS=.*/\nHWCLOCKACCESS=no/g' /etc/default/hwclock

sudo hwclock -w
