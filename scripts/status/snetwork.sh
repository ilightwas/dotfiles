#!/bin/sh
# id 34+5
sname="network"
tmpfile="/tmp/snetwork.cache"
colorrx="^C7^"
colortx="^C7^"
interface="enp0s25"
ipath="/sys/class/net/$interface/statistics"

rxtxtotal() {
    read  -r totalrx < "$ipath/rx_bytes"
    read  -r totaltx < "$ipath/tx_bytes"
    notify-send "Total network io
    Download:   $(numfmt --to=si "$totalrx")
    Upload:     $(numfmt --to=si "$totaltx")"
}

rxtxcolor() {
    if [ "$1" -lt 1000 ] ; then # bytes
        echo "^C8^"
    elif [ "$1" -lt 1048576 ] ; then # kilobytes
        echo "^C15^"
    elif [ "$1" -lt $(( 1048576 * $2 )) ] ; then # Megabytes
        echo "^C3^"
    else
        echo "^C1^"
    fi
}

case $BLOCK_BUTTON in
    1) rxtxtotal ; exit ;;
    2) notify-send "$sname middle click" ; exit ;;
    3) notify-send "$sname right click" ; exit ;;
    4) notify-send "$sname scroll up" ; exit ;;
    5) notify-send "$sname scroll down" ; exit ;;
    6) notify-send "$sname shift click" ; exit ;;
    7) "$TERMINAL" -e "$EDITOR" "$0" ; exit ;;
    8) notify-send "$sname shift right click" ; exit ;;
esac

read  -r currx < "$ipath/rx_bytes"
read  -r curtx < "$ipath/tx_bytes"
read  -r oldrxtx < "$tmpfile"

oldrx="$(echo "$oldrxtx" | cut -d\  -f1)"
oldtx="$(echo "$oldrxtx" | cut -d\  -f2)"

rx="$(( currx - oldrx ))"
tx="$(( curtx - oldtx ))"
echo "$currx" "$curtx" "$rx" "$tx" > "$tmpfile"

if [ "$rx" -lt 1 ]; then
    rx="$(echo "$oldrxtx" | cut -d\  -f3)"
fi

if [ "$tx" -lt 1 ]; then
    tx="$(echo "$oldrxtx" | cut -d\  -f4)"
fi

colorrx="$(rxtxcolor "$rx" 10)"
colortx="$(rxtxcolor "$tx" 4)"

printf "%s %4sB/s  %s %4sB/s^d^\\n" "$colorrx" "$(numfmt --to=si "$rx")" "$colortx" "$(numfmt --to=si "$tx")"
