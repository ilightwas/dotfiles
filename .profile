# Source custom scripts
if [ -d "$HOME/scripts" ] ; then
	export PATH="$HOME/scripts:$PATH"
fi

# Source status scripts
if [ -d "$HOME/scripts/status" ] ; then
	export PATH="$HOME/scripts/status:$PATH"
fi

# Adds `~/.local/bin` to $PATH
if [ -d "$HOME/.local/bin" ] ; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/desktop"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_PUBLICSHARE_DIR="$HOME/public"
export XDG_TEMPLATES_DIR="$HOME/templates"
export XDG_VIDEOS_DIR="$HOME/videos"

# History
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILE="$XDG_DATA_HOME/history"

#less
export LESSHISTFILE="$XDG_CACHE_HOME/lesshst"

# Less/Man pages color
export LESS_TERMCAP_mb=$(printf %b '\e[1;31m')
export LESS_TERMCAP_md=$(printf %b '\e[1;35m') # Header
export LESS_TERMCAP_me=$(printf %b '\e[0m')
export LESS_TERMCAP_se=$(printf %b '\e[0m')
export LESS_TERMCAP_so=$(printf %b '\e[1;33m') # Page line 
export LESS_TERMCAP_ue=$(printf %b '\e[0m')
export LESS_TERMCAP_us=$(printf %b '\e[1;31m') # Highlights 

# Enviroment vars
export EDITOR="nvim"
export VISUAL="nvim"
export CODEEDITOR="vscodium"
export PAGER="less"
export TERMINAL="st"
export COLORTERM="truecolor"
export BROWSER="firefox"
export READER="zathura"
export WM="dwm"

export SUCKLESS_DIR="$HOME/suckless"
export DOTFILES_GIT_DIR="$XDG_DATA_HOME/dotfiles"
export SYSPORTAGE_GIT_DIR="$XDG_DATA_HOME/sysportage"

# Xauthority
[ -z "$XDG_RUNTIME_DIR" ] && XAUTHORITY="$XDG_CACHE_HOME/Xauthority" || XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XAUTHORITY 

# Misc
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/.gtkrc-2.0"
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

# startx on tty1
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx
