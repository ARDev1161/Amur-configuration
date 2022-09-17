#!/bin/sh

sudo adduser amur
sudo usermod -a -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,gpio,i2c,spi amur

su amur
sudo pkill -u pi
sudo deluser --remove-all-files pi

sudo sed -i.bak 's/autologin-user=.*/autologin-user=amur/g' /etc/lightdm/lightdm.conf

sudo sed -i 's/raspberrypi/sensorika/g' /etc/hosts
sudo sed -i 's/raspberrypi/sensorika/g' /etc/hostname

