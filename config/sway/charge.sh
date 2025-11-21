#!/bin/bash

ac=$(cat /sys/class/power_supply/BAT0/status)

if [ $ac = "Discharging" ]; then
  echo "Dec"
else
  echo "Inc"
fi
