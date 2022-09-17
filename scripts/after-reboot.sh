#!/bin/sh

sudo hwclock -w

./update.sh

sudo apt install watchdog
sudo cp /etc/watchdog.conf /etc/watchdog.conf.old

sudo sed -i 's/max-load-1.*/\nmax-load-1 = 24/g' /etc/watchdog.conf
sudo sed -i 's/min-memory.*/\nmin-memory = 1/g' /etc/watchdog.conf
sudo sed -i 's/watchdog-device.*/\nwatchdog-device = /dev/watchdog/g' /etc/watchdog.conf
sudo echo -e "\nwatchdog-timeout=7" >> /etc/watchdog.conf

sudo sed -i 's/watchdog_module.*/\nwatchdog_module="bcm2835_wdt"' /etc/default/watchdog

sudo systemctl enable watchdog
sudo systemctl start watchdog
sudo systemctl status watchdog

sudo sed -i 's/temperature-sensor.*/\ntemperature-sensor=\/sys\/class\/thermal\/thermal_zone0\/temp/g' /etc/watchdog.conf
sudo sed -i 's/max-temperature.*/\nmax-temperature = 90/g' /etc/watchdog.conf
