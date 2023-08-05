#!/bin/sh

wallpaper="$(find $WALLPAPERS -type f | egrep "\.png|jpg|jpeg" | dmenu -i -l 40)"
[ -n "$wallpaper" ] && feh --bg-fill "$wallpaper"

