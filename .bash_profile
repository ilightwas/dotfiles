# Source .profile
if [ -f "$HOME/.profile" ] ; then
	. "$HOME/.profile"
fi

# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [ -f "$HOME/.bashrc" ] ; then
	. "$HOME/.bashrc"
fi
