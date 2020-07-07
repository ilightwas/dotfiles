# Source custom scripts
if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi

# History
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILE="$HOME/.cache/history"

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
export TERMINAL="alacritty"
export COLORTERM="truecolor"
export BROWSER="firefox"
