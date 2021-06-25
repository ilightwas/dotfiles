#!/bin/sh
# id 34+2
sname="date"

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

icondate=""
colorday="^C15^"
colordate="^C5^"

fulldate="$(date "+%a %d/%m/%y %H %M %S")"
day="$(echo "$fulldate" | cut -d\  -f1)"
date="$(echo "$fulldate" | cut -d\  -f2)"
hour="$(echo "$fulldate" | cut -d\  -f3)"
rantoday="/tmp/$day.sdate"

if [ ! -e "$rantoday" ] ; then
    touch "$rantoday"
    min="$(echo "$fulldate" | cut -d\  -f4)"
    sec="$(echo "$fulldate" | cut -d\  -f5)"
    tosleep=$(( (((23 - hour) * 60) + (60 - min)) * 60 - sec + 1 ))
    sleep "$tosleep" && kill -36 "$(pidof dwmblocks)" && notify-send "It's Midnight" && rm "$rantoday" &
fi


echo "$colorday$day $colordate$icondate $date^d^"
