#!/usr/bin/env bash




#echo "run: ${0}"




##
## ## Link
##
## * https://github.com/samwhelp/make-gnome-shell-layout-maccity/blob/main/part/make-gnome-shell-style/make-gnome-shell-style.sh
## * https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh
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
## ## Portal / Style
##

portal_gnome_shell_style_install () {

	echo
	echo
	echo "##"
	echo "## ## portal_gnome_shell_style_install"
	echo "##"
	echo
	echo

	mod_theme_install

	return 0
}




##
## ## Model / Theme
##

mod_theme_install () {

	sys_theme_install_wallpaper

	sys_theme_install_colloid_gtk_theme

	sys_theme_install_colloid_icon_theme

}

sys_theme_install_colloid_gtk_theme () {

	#sys_theme_install_colloid_gtk_theme_via_git_clone

	sys_theme_install_colloid_gtk_theme_via_wget_archive

}

sys_theme_install_colloid_gtk_theme_via_git_clone () {


	if [ -e "${HOME}/.themes/Colloid" ]; then
		return 0
	fi


	git clone https://github.com/vinceliuice/Colloid-gtk-theme /tmp/colloid-gtk-theme




	cd /tmp/colloid-gtk-theme

	./install.sh --theme all

	cd "${OLDPWD}"

}

sys_theme_install_colloid_gtk_theme_via_wget_archive () {


	if [ -e "${HOME}/.themes/Colloid" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Colloid-gtk-theme/archive/refs/heads/main.tar.gz' -O '/tmp/Colloid-gtk-theme-main.tar.gz'




	cd /tmp

	tar xf Colloid-gtk-theme-main.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Colloid-gtk-theme-main

	./install.sh --theme all

	cd "${OLDPWD}"

}

sys_theme_install_colloid_icon_theme () {

	#sys_theme_install_colloid_icon_theme_via_git_clone

	sys_theme_install_colloid_icon_theme_via_wget_archive

}

sys_theme_install_colloid_icon_theme_via_git_clone () {


	if [ -e "${HOME}/.local/share/icons/Colloid" ]; then
		return 0
	fi


	git clone https://github.com/vinceliuice/Colloid-icon-theme /tmp/colloid-icon-theme




	cd /tmp/colloid-icon-theme

	./install.sh --all

	cd "${OLDPWD}"




	cd /tmp/colloid-icon-theme/cursors

	./install.sh

	cd "${OLDPWD}"

}

sys_theme_install_colloid_icon_theme_via_wget_archive () {


	if [ -e "${HOME}/.local/share/icons/Colloid" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Colloid-icon-theme/archive/refs/heads/main.tar.gz' -O '/tmp/Colloid-icon-theme-main.tar.gz'




	cd /tmp

	tar xf Colloid-icon-theme-main.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Colloid-icon-theme-main

	./install.sh --theme all

	cd "${OLDPWD}"




	cd /tmp/Colloid-icon-theme-main/cursors

	./install.sh

	cd "${OLDPWD}"

}




##
## ## Model / Wallpaper
##

sys_theme_install_wallpaper () {


	## config via dconf
	dconf write /org/gnome/desktop/background/picture-uri "'/usr/share/backgrounds/default.jpeg'"
	dconf write /org/gnome/desktop/background/picture-uri-dark "'/usr/share/backgrounds/default.jpeg'"
	dconf write /org/gnome/desktop/screensaver/picture-uri "'/usr/share/backgrounds/default-login.jpeg'"


	if [ -e "/usr/share/backgrounds/MacTahoe-Dark.jpeg" ]; then
		return 0
	fi


	echo
	echo sudo mkdir -p "/usr/share/backgrounds"
	echo
	sudo mkdir -p "/usr/share/backgrounds"


	cd "/usr/share/backgrounds"


	echo
	echo sudo wget -c "https://raw.githubusercontent.com/vinceliuice/MacTahoe-kde/refs/heads/main/wallpapers/MacTahoe-Dark/contents/images/3840x2160.jpeg" -O "./MacTahoe-Dark.jpeg"
	echo
	sudo wget -c "https://raw.githubusercontent.com/vinceliuice/MacTahoe-kde/refs/heads/main/wallpapers/MacTahoe-Dark/contents/images/3840x2160.jpeg" -O "./MacTahoe-Dark.jpeg"


	echo
	echo sudo wget -c "https://raw.githubusercontent.com/vinceliuice/MacTahoe-kde/refs/heads/main/wallpapers/MacTahoe-Light/contents/images/3840x2160.jpeg" -O "./MacTahoe-Light.jpeg"
	echo
	sudo wget -c "https://raw.githubusercontent.com/vinceliuice/MacTahoe-kde/refs/heads/main/wallpapers/MacTahoe-Light/contents/images/3840x2160.jpeg" -O "./MacTahoe-Light.jpeg"


	sudo ln -sf MacTahoe-Dark.jpeg next.jpeg
	sudo ln -sf next.jpeg default.jpeg
	sudo ln -sf next.jpeg default-login.jpeg
	sudo ln -sf next.jpeg default-grub.jpeg


	cd "${OLDPWD}"

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

	portal_gnome_shell_style_install

}


##
## ## Main
##

__main__ () {

	portal_gnome_shell_install

}

__main__
