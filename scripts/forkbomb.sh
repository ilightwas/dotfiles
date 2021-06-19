#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
	echo "Run as root"
	exit 1
fi

renice -n -20 "$$"

printf "After run: killall -KILL -u %s" "$1"
while : ; do
	killall -STOP -u "$1";
done

