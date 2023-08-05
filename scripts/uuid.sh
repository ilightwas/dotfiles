#!/bin/sh

if [ -z "$1" ]; then
  echo "No partition given"
  exit 1
fi

lsb="$(lsblk -lno NAME,UUID)"
parts="$(echo "$lsb" | grep "$1")"

status=$?
if [ $status -ne 0 ]; then
	echo "Partition not found"
	exit $status
fi

match_count="$(echo "$parts" | wc -l)"
if [ "$match_count" -ne 1 ]; then
 echo "Ambiguous input, especify the partition full name"
 exit 1
fi

uuid="$(echo "$parts" | cut --only-delimited -d' ' -f2)"
if [ -z "$uuid" ]; then
  echo "Partition has no UUID"
  exit
fi

#if piped (e.g., xclip) don't include new line
[ -t 1 ] && echo "$uuid" || printf "%s" "$uuid"

