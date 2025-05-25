#!/bin/bash
capacity=$(cat /sys/class/power_supply/BAT*/capacity)
status=$(cat /sys/class/power_supply/BAT*/status)

if [ "$status" == "Charging" ]; then
  echo "$capacity%⚡"
else
  echo "$capacity%"
fi
