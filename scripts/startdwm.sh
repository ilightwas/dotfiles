#!/bin/sh

notify-send "Starting dwm"

while true; do
	logmy.sh dwm
	notify-send "Restarting dwm"
	sleep 5
done

