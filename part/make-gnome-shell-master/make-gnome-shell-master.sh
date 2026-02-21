#!/usr/bin/env bash




#echo "run: ${0}"




##
## ## Link
##
## * https://github.com/samwhelp/make-gnome-shell-layout-maccity/blob/main/part/make-gnome-shell-master/make-gnome-shell-master.sh
## * https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-master/make-gnome-shell-master.sh
##




##
## ## Args
##

DEFAULT_MASTER_DISTRO="debian"
REF_MASTER_DISTRO="${REF_MASTER_DISTRO:=$DEFAULT_MASTER_DISTRO}"

DEFAULT_MASTER_STYLE="vimix"
REF_MASTER_STYLE="${REF_MASTER_STYLE:=$DEFAULT_MASTER_STYLE}"




##
## ## Portal / Master
##

portal_gnome_shell_master_install () {

	echo portal_gnome_shell_master_install

}




##
## ## Portal
##

portal_gnome_shell_install () {

	portal_gnome_shell_master_install

}


##
## ## Main
##

__main__ () {

	portal_gnome_shell_install

}

__main__
