#!/bin/sh
# id 34+1
sname="volume"

case $BLOCK_BUTTON in
    1) amixer -q set Master 5%+ ; exit ;;
    2) amixer -q set Master toggle ; exit ;;
    3) amixer -q set Master 5%- ; exit ;;
    4) amixer -q set Master 1%+ ; exit ;;
    5) amixer -q set Master 1%- ; exit ;;
    6) notify-send "$sname shift click" ; exit ;;
    7) "$TERMINAL" -e "$EDITOR" "$0" ; exit ;;
    8) notify-send "$sname shift right click" ; exit ;;
esac

icon=""
color="^C8^"
mixer="$(amixer sget Master | sed '6q;d')"
#vol=$(echo "$mixer" | awk -F"[][]" '/Left:/ { print $2 }' | tr -d '%')
vol="$(echo "$mixer" | awk '{ print $5 }' | tr -d '][%')"
#sound=$(echo "$mixer" | awk -F"[][]" '/Left:/ { print $4 }')
sound="$(echo "$mixer" | awk '{ print $6 }' | tr -d '][')"

if [ "$sound" = "off" ] ; then # mute
    color="^C1^"
    icon=""
fi

#printf '%-4s%-2s %-3s^d^' "$color" "$icon" "$vol%"
echo "$color$icon $vol%^d^"
