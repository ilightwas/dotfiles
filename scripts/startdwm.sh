#!/bin/sh

while true; do
	# Log both stdout/stderr
	dwm >>~/.dwm.log 2>&1
	sleep 10
done

