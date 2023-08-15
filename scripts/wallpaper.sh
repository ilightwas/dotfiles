#!/bin/sh

xcmd() {
  feh --bg-fill "$wallpaper"
}
wcmd() {
# hyprctl hyprpaper wallpaper "\"DP-2 $wallpaper\""
swww img "$wallpaper"
}

if pgrep -x "Xorg" >/dev/null || pgrep -x "X" >/dev/null; then 
  menu="dmenu -i -l 40"
  wallcmd=xcmd
else
  menu="rofi -dmenu"
  wallcmd=wcmd
fi

wallpaper="$(find "$WALLPAPERS" -type f | grep -E "\.png|jpg|jpeg" | $menu )"

[ -n "$wallpaper" ] && "$wallcmd"

