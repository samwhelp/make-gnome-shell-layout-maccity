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

DEFAULT_MASTER_STYLE="colloid"
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

	mod_gnome_shell_style_install_prerun

	mod_gnome_shell_style_install_mainrun

	mod_gnome_shell_style_install_postrun


	return 0
}




##
## ## Model / Style
##

mod_gnome_shell_style_install_prerun () {

	mod_style_install_prepare

	return 0

}

mod_gnome_shell_style_install_mainrun () {

	mod_style_install

	return 0

}

mod_gnome_shell_style_install_postrun () {

	return 0

}




##
## ## Model / Style / Prepare
##

mod_style_install_prepare () {

	local the_distro="${REF_MASTER_DISTRO}"

	local the_delegate="mod_style_install_prepare_for_${the_distro}"


	if ! is_function_exist "${the_delegate}"; then
		return 0
	fi


	"${the_delegate}"


	return 0
}

mod_style_install_prepare_for_ubuntu () {

	echo
	echo sudo apt-get install -y git wget sassc
	echo
	sudo apt-get install -y git wget sassc

}

mod_style_install_prepare_for_debian () {

	echo
	echo sudo apt-get install -y git wget sassc
	echo
	sudo apt-get install -y git wget sassc

}

mod_style_install_prepare_for_fedora () {

	echo
	echo sudo dnf install git wget sassc
	echo
	sudo dnf install git wget sassc

}

mod_style_install_prepare_for_archlinux () {

	echo
	echo sudo pacman -Sy --needed git wget sassc
	echo
	sudo pacman -Sy --needed git wget sassc

}

mod_style_install_prepare_for_voidlinux () {

	echo
	echo sudo xbps-install -Su git wget sassc
	echo
	sudo xbps-install -Su git wget sassc

}




##
## ## Model / Style / Install
##

mod_style_install () {

	local the_style="${REF_MASTER_STYLE}"

	local the_delegate="sys_style_install_for_${the_style}"


	if ! is_function_exist "${the_delegate}"; then
		return 0
	fi


	"${the_delegate}"


	return 0
}




##
##
################################################################################
##
##




##
## ## Model / Wallpaper
##

sys_wallpaper_install_for_default () {

	#sys_wallpaper_install_for_wincity

	sys_wallpaper_install_for_maccity

	return 0
}




##
## ## Model / Wallpaper / wincity
##

sys_wallpaper_install_for_wincity () {

	sys_wallpaper_asset_install_for_wincity

	sys_wallpaper_config_install_for_wincity

}

sys_wallpaper_config_install_for_wincity () {


	## config via gsettings set
	#gsettings set org.gnome.desktop.background picture-uri "'/usr/share/backgrounds/default.jpeg'"
	#gsettings set org.gnome.desktop.background picture-uri-dark "'/usr/share/backgrounds/default.jpeg'"
	#gsettings set org.gnome.desktop.screensaver picture-uri "'/usr/share/backgrounds/default-login.jpeg'"


	## config via dconf write
	#dconf write /org/gnome/desktop/background/picture-uri "'/usr/share/backgrounds/default.jpeg'"
	#dconf write /org/gnome/desktop/background/picture-uri-dark "'/usr/share/backgrounds/default.jpeg'"
	#dconf write /org/gnome/desktop/screensaver/picture-uri "'/usr/share/backgrounds/default-login.jpeg'"


	## config via dconf load

dconf load / << __EOF__


[org/gnome/desktop/background]
picture-options='zoom'
picture-uri='file:///usr/share/backgrounds/default.png'
picture-uri-dark='file:///usr/share/backgrounds/default.png'


[org/gnome/desktop/screensaver]
picture-uri='file:///usr/share/backgrounds/default-login.png'


__EOF__

}

sys_wallpaper_asset_install_for_wincity () {


	if [ -e "/usr/share/backgrounds/Fluent-round-dark.png" ]; then
		return 0
	fi


	echo
	echo sudo mkdir -p "/usr/share/backgrounds"
	echo
	sudo mkdir -p "/usr/share/backgrounds"


	cd "/usr/share/backgrounds"


	echo
	echo sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Fluent-kde/refs/heads/main/wallpaper/Fluent-round-dark/contents/images/3840x2160.png" -O "./Fluent-round-dark.png"
	echo
	sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Fluent-kde/refs/heads/main/wallpaper/Fluent-round-dark/contents/images/3840x2160.png" -O "./Fluent-round-dark.png"


	echo
	echo sudo wget -c "https://raw.githubusercontent.com/vinceliuice/MacTahoe-kde/refs/heads/main/wallpapers/MacTahoe-Light/contents/images/3840x2160.jpeg" -O "./Fluent-round-light.png"
	echo
	sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Fluent-kde/refs/heads/main/wallpaper/Fluent-round-light/contents/images/3840x2160.png" -O "./Fluent-round-light.png"


	sudo ln -sf Fluent-round-dark.png next.png
	sudo ln -sf next.png default.png
	sudo ln -sf next.png default-login.png
	sudo ln -sf next.png default-grub.png


	cd "${OLDPWD}"

}




##
## ## Model / Wallpaper / maccity
##

sys_wallpaper_install_for_maccity () {

	sys_wallpaper_asset_install_for_maccity

	sys_wallpaper_config_install_for_maccity

}

sys_wallpaper_config_install_for_maccity () {


	## config via gsettings set
	#gsettings set org.gnome.desktop.background picture-uri "'/usr/share/backgrounds/default.jpeg'"
	#gsettings set org.gnome.desktop.background picture-uri-dark "'/usr/share/backgrounds/default.jpeg'"
	#gsettings set org.gnome.desktop.screensaver picture-uri "'/usr/share/backgrounds/default-login.jpeg'"


	## config via dconf write
	#dconf write /org/gnome/desktop/background/picture-uri "'/usr/share/backgrounds/default.jpeg'"
	#dconf write /org/gnome/desktop/background/picture-uri-dark "'/usr/share/backgrounds/default.jpeg'"
	#dconf write /org/gnome/desktop/screensaver/picture-uri "'/usr/share/backgrounds/default-login.jpeg'"


	## config via dconf load

dconf load / << __EOF__


[org/gnome/desktop/background]
picture-options='zoom'
picture-uri='file:///usr/share/backgrounds/default.jpeg'
picture-uri-dark='file:///usr/share/backgrounds/default.jpeg'


[org/gnome/desktop/screensaver]
picture-uri='file:///usr/share/backgrounds/default-login.jpeg'


__EOF__

}

sys_wallpaper_asset_install_for_maccity () {


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
## ## Model / Style / fluent
##

sys_style_install_for_fluent () {

	sys_style_asset_install_for_fluent

	sys_style_config_install_for_fluent

}

sys_style_config_install_for_fluent () {

dconf load / << __EOF__


[org/gnome/desktop/interface]
color-scheme='prefer-dark'
gtk-theme='Fluent-round-Dark'
icon-theme='Fluent-dark'
cursor-theme='Fluent-dark-cursors'
cursor-size=24


[org/gnome/desktop/wm/preferences]
theme='Fluent-round-Dark'


[org/gnome/shell/extensions/user-theme]
name='Fluent-round-Dark'


__EOF__

}

sys_style_asset_install_for_fluent () {

	sys_wallpaper_install_for_wincity

	sys_theme_install_fluent_gtk_theme

	sys_theme_install_fluent_icon_theme

}

sys_theme_install_fluent_gtk_theme () {

	#sys_theme_install_fluent_gtk_theme_via_git_clone

	sys_theme_install_fluent_gtk_theme_via_wget_archive

}

sys_theme_install_fluent_gtk_theme_via_git_clone () {


	if [ -e "${HOME}/.themes/Fluent-round" ]; then
		return 0
	fi


	git clone https://github.com/vinceliuice/Fluent-gtk-theme /tmp/fluent-gtk-theme




	cd /tmp/fluent-gtk-theme

	./install.sh --tweaks noborder round --theme all

	cd "${OLDPWD}"

}

sys_theme_install_fluent_gtk_theme_via_wget_archive () {


	if [ -e "${HOME}/.themes/Fluent-round" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Fluent-gtk-theme/archive/refs/heads/master.tar.gz' -O '/tmp/Fluent-gtk-theme-master.tar.gz'




	cd /tmp

	tar xf Fluent-gtk-theme-master.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Fluent-gtk-theme-master

	./install.sh --tweaks noborder round --theme all

	cd "${OLDPWD}"

}

sys_theme_install_fluent_icon_theme () {

	#sys_theme_install_fluent_icon_theme_via_git_clone

	sys_theme_install_fluent_icon_theme_via_wget_archive

}

sys_theme_install_fluent_icon_theme_via_git_clone () {


	if [ -e "${HOME}/.local/share/icons/Fluent" ]; then
		return 0
	fi


	git clone https://github.com/vinceliuice/Fluent-icon-theme /tmp/fluent-icon-theme




	cd /tmp/fluent-icon-theme

	./install.sh --all

	cd "${OLDPWD}"




	cd /tmp/fluent-icon-theme/cursors

	./install.sh

	cd "${OLDPWD}"

}

sys_theme_install_fluent_icon_theme_via_wget_archive () {


	if [ -e "${HOME}/.local/share/icons/Fluent" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Fluent-icon-theme/archive/refs/heads/master.tar.gz' -O '/tmp/Fluent-icon-theme-master.tar.gz'




	cd /tmp

	tar xf Fluent-icon-theme-master.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Fluent-icon-theme-master

	./install.sh --all

	cd "${OLDPWD}"




	cd /tmp/Fluent-icon-theme-master/cursors

	./install.sh

	cd "${OLDPWD}"

}




##
##
################################################################################
##
##




##
## ## Model / Style / colloid
##

sys_style_install_for_colloid () {

	sys_style_asset_install_for_colloid

	sys_style_config_install_for_colloid

}

sys_style_config_install_for_colloid () {

dconf load / << __EOF__


[org/gnome/desktop/interface]
color-scheme='prefer-dark'
gtk-theme='Colloid-Dark'
icon-theme='Colloid-Dark'
cursor-theme='Colloid-dark-cursors'
cursor-size=24


[org/gnome/desktop/wm/preferences]
theme='Colloid-Dark'


[org/gnome/shell/extensions/user-theme]
name='Colloid-Dark'


__EOF__

}

sys_style_asset_install_for_colloid () {

	sys_wallpaper_install_for_maccity

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
##
################################################################################
##
##




##
## ## Model / Style / vimix
##

sys_style_install_for_vimix () {

	sys_style_asset_install_for_vimix

	sys_style_config_install_for_vimix

}

sys_style_config_install_for_vimix () {

dconf load / << __EOF__


[org/gnome/desktop/interface]
color-scheme='prefer-dark'
gtk-theme='Vimix-dark-ruby'
icon-theme='Citrus-red-dark'
cursor-theme='Vimix-cursors'
cursor-size=24


[org/gnome/desktop/wm/preferences]
theme='Vimix-dark-ruby'


[org/gnome/shell/extensions/user-theme]
name='Vimix-dark-ruby'


__EOF__

}

sys_style_asset_install_for_vimix () {

	sys_wallpaper_install_for_default

	sys_theme_install_vimix_gtk_theme

	#sys_theme_install_vimix_icon_theme

	sys_theme_install_vimix_cursor_theme

	sys_theme_install_citrus_icon_theme

	sys_theme_install_greystone_icon_theme

}

sys_theme_install_vimix_gtk_theme () {

	sys_theme_install_vimix_gtk_theme_via_wget_archive

}

sys_theme_install_vimix_gtk_theme_via_wget_archive () {


	if [ -e "${HOME}/.themes/Vimix-ruby" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Vimix-gtk-themes/archive/refs/heads/master.tar.gz' -O '/tmp/Vimix-gtk-themes-master.tar.gz'




	cd /tmp

	tar xf Vimix-gtk-themes-master.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Vimix-gtk-themes-master

	./install.sh --theme all

	cd "${OLDPWD}"

}

sys_theme_install_vimix_icon_theme () {

	sys_theme_install_vimix_icon_theme_via_wget_archive

}

sys_theme_install_vimix_icon_theme_via_wget_archive () {


	if [ -e "${HOME}/.local/share/icons/Vimix" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Vimix-icon-theme/archive/refs/heads/master.tar.gz' -O '/tmp/Vimix-icon-theme-master.tar.gz'




	cd /tmp

	tar xf Vimix-icon-theme-master.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Vimix-icon-theme-master

	./install.sh -a

	cd "${OLDPWD}"




}

sys_theme_install_vimix_cursor_theme () {

	sys_theme_install_vimix_cursor_theme_via_wget_archive

}

sys_theme_install_vimix_cursor_theme_via_wget_archive () {


	if [ -e "${HOME}/.local/share/icons/Vimix-cursors" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Vimix-cursors/archive/refs/heads/master.tar.gz' -O '/tmp/Vimix-cursors-master.tar.gz'




	cd /tmp

	tar xf Vimix-cursors-master.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Vimix-cursors-master

	./install.sh

	cd "${OLDPWD}"




}




##
##
################################################################################
##
##




##
## ## Model / Icon / citrus
##

sys_theme_install_citrus_icon_theme () {

	sys_theme_install_citrus_icon_theme_via_wget_archive

}

sys_theme_install_citrus_icon_theme_via_wget_archive () {


	if [ -e "${HOME}/.local/share/icons/Citrus-red" ]; then
		return 0
	fi


	wget -c 'https://github.com/samwhelp/citrus-icon-theme/archive/refs/heads/port.tar.gz' -O '/tmp/citrus-icon-theme-port.tar.gz'




	cd /tmp

	tar xf citrus-icon-theme-port.tar.gz

	cd "${OLDPWD}"




	cd /tmp/citrus-icon-theme-port

	./install.sh -red

	cd "${OLDPWD}"




}




##
## ## Model / Icon / greystone
##

sys_theme_install_greystone_icon_theme () {

	sys_theme_install_greystone_icon_theme_via_wget_archive

}

sys_theme_install_greystone_icon_theme_via_wget_archive () {


	if [ -e "${HOME}/.local/share/icons/GreyStone" ]; then
		return 0
	fi


	mkdir -p "${HOME}/.local/share/icons"


	wget -c 'https://github.com/samwhelp/greystone-icon-theme/archive/refs/heads/port.tar.gz' -O '/tmp/greystone-icon-theme-port.tar.gz'




	cd /tmp

	tar xf greystone-icon-theme-port.tar.gz

	cd "${OLDPWD}"




	cd /tmp/greystone-icon-theme-port

	tar xf GreyStone.tar.xz
	cp -rfT ./GreyStone "${HOME}/.local/share/icons/GreyStone"


	tar xf GreyStone-Circle.tar.xz
	cp -rfT ./GreyStone-Circle "${HOME}/.local/share/icons/GreyStone-Circle"

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
