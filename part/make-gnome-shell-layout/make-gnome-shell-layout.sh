#!/usr/bin/env bash




#echo "run: ${0}"




##
## ## Link
##




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
