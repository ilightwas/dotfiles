# Source custom scripts
if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi

# History
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILE="$HOME/.cache/history"

# Enviroment vars
export EDITOR="vim"
export VISUAL="vim"
export CODEEDITOR="vscodium"
export PAGER="less"
export TERMINAL="st"
export COLORTERM="truecolor"
export BROWSER="firefox"
