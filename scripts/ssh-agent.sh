#!/bin/sh

if ! pidof ssh-agent > /dev/null ; then
	notify-send "Starting ssh-agent"
	eval "$(ssh-agent -t 10m)"
fi

