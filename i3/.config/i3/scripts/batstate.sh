#! /bin/bash
if [ "$(acpi -V | grep Adapter | awk '{print $NF}')" == "on-line" ]; then
  echo "charging"
#elif  ["$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | cut -d':' -f2 | xargs)" == "charging"  ]; then
#  echo "charging"
  else echo ""
fi
