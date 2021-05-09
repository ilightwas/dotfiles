#!/bin/sh

mylogdir="$XDG_CACHE_HOME/mylogs"
cmdlogdir="$mylogdir/$1"
cmdlogfile="$cmdlogdir/$1-$(date +%d-%m-%Y).log"

if [ ! -d "$cmdlogdir" ] ; then
    mkdir -pv "$cmdlogdir"
fi

echo "Starting log at $(date +%T)" >> "$cmdlogfile"
# Log both stdout/stderr
"$@" >> "$cmdlogfile" 2>&1
