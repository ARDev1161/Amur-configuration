#!/bin/sh

cd scripts

./update.sh
./user-setup.sh
./raspi-config.sh
./rtc.sh
./network.sh
./bluetooth.sh
./watchdog.sh
./add-software.sh
