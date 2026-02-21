#!/usr/bin/env bash




#echo "run: ${0}"




##
## ## Link
##
## * https://github.com/samwhelp/make-gnome-shell-layout-wincity/blob/main/part/make-gnome-shell-prepare/make-gnome-shell-prepare.sh
## * https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-wincity/refs/heads/main/part/make-gnome-shell-prepare/make-gnome-shell-prepare.sh
##




##
## ## Args
##

DEFAULT_MASTER_DISTRO="debian"
REF_MASTER_DISTRO="${REF_MASTER_DISTRO:=$DEFAULT_MASTER_DISTRO}"

DEFAULT_MASTER_STYLE="vimix"
REF_MASTER_STYLE="${REF_MASTER_STYLE:=$DEFAULT_MASTER_STYLE}"




##
##
################################################################################
##
##




##
## ## Portal / Prepare
##

portal_gnome_shell_prepare_install () {

	echo
	echo
	echo "##"
	echo "## ## portal_gnome_shell_prepare_install"
	echo "##"
	echo
	echo

	mod_package_install

	return 0
}




##
## ## Model / Package
##

mod_package_install () {

	sys_package_install

	sys_package_remove

}

sys_package_install () {

	echo
	echo sudo apt-get install -y gnome-shell gnome-tweaks gnome-shell-extension-manager gir1.2-gmenu-3.0 git wget sassc
	echo
	sudo apt-get install -y gnome-shell gnome-tweaks gnome-shell-extension-manager gir1.2-gmenu-3.0 git wget sassc

}

sys_package_remove () {

	return 0

}




##
##
################################################################################
##
##




##
## ## Portal
##

portal_gnome_shell_install () {

	portal_gnome_shell_prepare_install

}


##
## ## Main
##

__main__ () {

	portal_gnome_shell_install

}

__main__
