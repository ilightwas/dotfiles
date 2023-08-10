# /etc/skel/.bashrc

# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

# Disable ctrl+s *suspend ctrl+q *resume
stty -ixon

# Case insensitive auto complete
bind 'set completion-ignore-case on'

# Doas autocompletion
complete -cf doas

# Source my custom general aliases
if [ -f "$HOME/.config/aliasrc" ] ; then
	. "$HOME/.config/aliasrc"
fi

# Source custom functions
if [ -f "$HOME/.config/shfunctionsrc" ] ; then
	. "$HOME/.config/shfunctionsrc"
fi

export PS1="\[\e[31m\][\[\e[m\]\[\e[35m\]\u\[\e[m\]\[\e[34m\]@\[\e[m\]\[\e[31m\]\h\[\e[m\] \[\e[32m\]\w\[\e[m\]\[\e[33m\]\`nonzero_return\`\[\e[m\]\[\e[31m\]]\[\e[m\]\[\e[36m\]\`parse_git_branch\`\[\e[m\]\[\e[35m\]\\$\[\e[m\] "

neofetch
