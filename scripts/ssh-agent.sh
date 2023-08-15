#!/bin/sh

if pidof ssh-agent > /dev/null ; then
  killall ssh-agent
fi

eval "$(ssh-agent -t 10m "$@")"

