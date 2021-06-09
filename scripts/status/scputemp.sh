#!/bin/sh
# id 34+4
sname="cputemp"

case $BLOCK_BUTTON in
    1) notify-send "$sname left click" ; exit ;;
    2) notify-send "$sname middle click" ; exit ;;
    3) notify-send "$sname right click" ; exit ;;
    4) notify-send "$sname scroll up" ; exit ;;
    5) notify-send "$sname scroll down" ; exit ;;
    6) notify-send "$sname shift click" ; exit ;;
    7) "$TERMINAL" -e "$EDITOR" "$0" ; exit ;;
    8) notify-send "$sname shift right click" ; exit ;;
esac

icon=""
color="^C4^"

temp=$(sed 's/000$//' /sys/class/thermal/thermal_zone0/temp)
#temp=$(cat /sys/class/thermal/thermal_zone0/temp)
#temp=${temp%???}

if [ "$temp" -lt 40 ] ; then
    color="^C4^"
elif [ "$temp" -lt 50 ] ; then
    color="^C6^"
elif [ "$temp" -lt 60 ] ; then
    color="^C2^"
elif [ "$temp" -lt 70 ] ; then
    color="^C3^"
else
    color="^C1^"
fi

echo "$color$icon $temp°C^d^"
