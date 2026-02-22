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
## ## Util / Command
##

is_function_exist () {

	if type -p "${1}" > /dev/null; then
		return 0
	else
		return 1
	fi

}

# is_command_exist () {
# 	if command -v "${1}" > /dev/null; then
# 		return 0
# 	else
# 		return 1
# 	fi
# }

is_command_exist () {

	if [ -x "$(command -v ${1})" ]; then
		return 0
	else
		return 1
	fi

}




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
## ## Model / Package / Install
##

mod_package_install () {

	local the_distro="${REF_MASTER_DISTRO}"

	local the_delegate="sys_package_install_for_${the_distro}"


	if ! is_function_exist "${the_delegate}"; then
		return 0
	fi


	"${the_delegate}"


	return 0
}

sys_package_install_for_ubuntu () {

	echo
	echo sudo apt-get install -y gnome-shell gnome-tweaks gnome-shell-extension-manager gir1.2-gmenu-3.0 git wget sassc
	echo
	sudo apt-get install -y gnome-shell gnome-tweaks gnome-shell-extension-manager gir1.2-gmenu-3.0 git wget sassc

}

sys_package_install_for_debian () {

	echo
	echo sudo apt-get install -y gnome-shell gnome-tweaks gnome-shell-extension-manager gir1.2-gmenu-3.0 git wget sassc
	echo
	sudo apt-get install -y gnome-shell gnome-tweaks gnome-shell-extension-manager gir1.2-gmenu-3.0 git wget sassc

}

sys_package_install_for_fedora () {

	echo
	echo sudo dnf install gnome-shell gnome-tweaks gnome-extensions-app gnome-menus git wget sassc
	echo
	sudo dnf install gnome-shell gnome-tweaks gnome-extensions-app gnome-menus git wget sassc

}

sys_package_install_for_archlinux () {

	echo
	echo sudo pacman -Sy --needed gnome-shell gnome-tweaks gnome-menus git wget sassc
	echo
	sudo pacman -Sy --needed gnome-shell gnome-tweaks gnome-menus git wget sassc

}

sys_package_install_for_voidlinux () {

	echo
	echo sudo xbps-install -Su gnome-shell gnome-tweaks gnome-menus git wget sassc
	echo
	sudo xbps-install -Su gnome-shell gnome-tweaks gnome-menus git wget sassc

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
