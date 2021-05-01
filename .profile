# Adds `~/.local/bin` to $PATH
if [ -d "$HOME/.local/bin" ] ; then
	export PATH="$PATH:$HOME/.local/bin"
fi

# Source custom scripts
if [ -d "$HOME/scripts" ] ; then
	export PATH="$HOME/scripts:$PATH"
fi

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# History
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILE="$XDG_DATA_HOME/history"

# Less/Man pages color
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;35m' # Header
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33m' # Page line 
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;31m' # Highlights 

# Enviroment vars
export EDITOR="vim"
export VISUAL="vim"
export CODEEDITOR="vscodium"
export PAGER="less"
export TERMINAL="st"
export COLORTERM="truecolor"
export BROWSER="firefox"
export READER="zathura"
export WM="dwm"

# Misc
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

# startx on tty1
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx
