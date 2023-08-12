#!/bin/sh

if ! pidof ssh-agent > /dev/null ; then
	eval "$(ssh-agent -t 10m "$@")"
fi

"$@"

