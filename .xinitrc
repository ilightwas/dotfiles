#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -n "$(/etc/X11/chooser.sh)" ]; then
    command="$(/etc/X11/chooser.sh)"
else
    failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if [ -n "$failsafe" ]; then
   
   # in case of using nvidia optimus
   # xrandr --setprovideroutputsource modesetting NVIDIA-G0
   # xrandr --auto 
   
   # source xprofile
    [ -f /etc/xprofile ] && . /etc/xprofile
    [ -f "$HOME/.xprofile" ] && . "$HOME/.xprofile"

    #Fix "Authorization required, but no authorization protocol specified" when running graphical apps as root
    xhost si:localuser:root

    exec startdwm.sh
else
    exec $command
fi

