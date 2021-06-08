#!/bin/sh
# id 34+3
sname="time"

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

iconhr=""
colorhr="^C12^"
hr="$(date "+%H:%M")"

echo "$colorhr$iconhr $hr^d^"
