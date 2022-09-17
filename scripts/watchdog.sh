#!/bin/sh

sudo echo -e "\n# Enabling watchdog \ndtparam=watchdog=on" >> /boot/config.txt
