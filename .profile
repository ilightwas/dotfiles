


# Source custom scripts

if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# Source my custom general aliases

if [ -f "$HOME/.config/.aliases" ] ; then
	source "$HOME/.config/.aliases"
fi

export PATH

