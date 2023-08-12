#!/bin/sh

# Xauthority
[ -z "$XDG_RUNTIME_DIR" ] && XAUTHORITY="$XDG_CACHE_HOME/Xauthority" || XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
touch "$XAUTHORITY"
export XAUTHORITY

exec startx

