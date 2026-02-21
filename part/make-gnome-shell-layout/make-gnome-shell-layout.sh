#!/usr/bin/env bash




#echo "run: ${0}"




##
## ## Link
##




##
## ## Option
##

REF_GNOME_SHELL_EXTENSIONS_INSTALL=(
	"dash-to-dock@micxgx.gmail.com"
	"arcmenu@arcmenu.com"
	"blur-my-shell@aunetx"
	"date-menu-formatter@marcinjakubowski.github.com"
	"user-theme@gnome-shell-extensions.gcampax.github.com"
	"status-icons@gnome-shell-extensions.gcampax.github.com"
	"gtk4-ding@smedius.gitlab.com"
)




REF_GNOME_SHELL_EXTENSIONS_ENABLE=(
	"dash-to-dock@micxgx.gmail.com"
	"arcmenu@arcmenu.com"
	"blur-my-shell@aunetx"
	"date-menu-formatter@marcinjakubowski.github.com"
	"user-theme@gnome-shell-extensions.gcampax.github.com"
	"status-icons@gnome-shell-extensions.gcampax.github.com"
	"gtk4-ding@smedius.gitlab.com"
)




REF_GNOME_SHELL_EXTENSIONS_DISABLE=(
	"dash-to-panel@jderose9.github.com"
	"apps-menu@gnome-shell-extensions.gcampax.github.com"
	"places-menu@gnome-shell-extensions.gcampax.github.com"
	"window-list@gnome-shell-extensions.gcampax.github.com"
)




##
## ## Args
##

DEFAULT_MASTER_DISTRO="debian"
REF_MASTER_DISTRO="${REF_MASTER_DISTRO:=$DEFAULT_MASTER_DISTRO}"

DEFAULT_MASTER_STYLE="vimix"
REF_MASTER_STYLE="${REF_MASTER_STYLE:=$DEFAULT_MASTER_STYLE}"




##
## ## Portal / Layout
##

portal_gnome_shell_layout_install () {

	echo portal_gnome_shell_layout_install

}




##
## ## Portal
##

portal_gnome_shell_install () {

	portal_gnome_shell_layout_install

}


##
## ## Main
##

__main__ () {

	portal_gnome_shell_install

}

__main__
