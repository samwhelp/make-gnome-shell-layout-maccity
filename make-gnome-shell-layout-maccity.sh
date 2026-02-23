#!/usr/bin/env bash




#echo "run: ${0}"




##
## ## Link
##
## * https://github.com/samwhelp/make-gnome-shell-layout-maccity/blob/main/make-gnome-shell-layout-maccity.sh
## * https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/make-gnome-shell-layout-maccity.sh
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
	"ding@rastersoft.com"
)




REF_GNOME_SHELL_EXTENSIONS_ENABLE=(
	"dash-to-dock@micxgx.gmail.com"
	"arcmenu@arcmenu.com"
	"blur-my-shell@aunetx"
	"date-menu-formatter@marcinjakubowski.github.com"
	"user-theme@gnome-shell-extensions.gcampax.github.com"
	"status-icons@gnome-shell-extensions.gcampax.github.com"
	"ding@rastersoft.com"
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

	sys_wallpaper_install_for_graphite

	#sys_wallpaper_install_for_wincity

	#sys_wallpaper_install_for_maccity

	return 0
}




##
## ## Model / Wallpaper / graphite
##

sys_wallpaper_install_for_graphite () {

	sys_wallpaper_asset_install_for_graphite

	sys_wallpaper_config_install_for_graphite

}

sys_wallpaper_config_install_for_graphite () {


	## config via gsettings set
	#gsettings set org.gnome.desktop.background picture-uri "'/usr/share/backgrounds/default.jpg'"
	#gsettings set org.gnome.desktop.background picture-uri-dark "'/usr/share/backgrounds/default.jpg'"
	#gsettings set org.gnome.desktop.screensaver picture-uri "'/usr/share/backgrounds/default-login.jpg'"


	## config via dconf write
	#dconf write /org/gnome/desktop/background/picture-uri "'/usr/share/backgrounds/default.jpg'"
	#dconf write /org/gnome/desktop/background/picture-uri-dark "'/usr/share/backgrounds/default.jpg'"
	#dconf write /org/gnome/desktop/screensaver/picture-uri "'/usr/share/backgrounds/default-login.jpg'"


	## config via dconf load

dconf load / << __EOF__


[org/gnome/desktop/background]
picture-options='zoom'
picture-uri='file:///usr/share/backgrounds/default.jpg'
picture-uri-dark='file:///usr/share/backgrounds/default.jpg'


[org/gnome/desktop/screensaver]
picture-uri='file:///usr/share/backgrounds/default-login.jpg'


__EOF__

}

sys_wallpaper_asset_install_for_graphite () {


	if [ -e "/usr/share/backgrounds/wave-Dark.jpg" ]; then
		return 0
	fi


	echo
	echo sudo mkdir -p "/usr/share/backgrounds"
	echo
	sudo mkdir -p "/usr/share/backgrounds"


	cd "/usr/share/backgrounds"


	echo
	echo sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Graphite-gtk-theme/refs/heads/main/wallpaper/wallpapers/wave-Dark.jpg" -O "./wave-Dark.jpg"
	echo
	sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Graphite-gtk-theme/refs/heads/main/wallpaper/wallpapers/wave-Dark.jpg" -O "./wave-Dark.jpg"


	echo
	echo sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Graphite-gtk-theme/refs/heads/main/wallpaper/wallpapers/wave-Light.jpg" -O "./wave-Light.jpg"
	echo
	sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Graphite-gtk-theme/refs/heads/main/wallpaper/wallpapers/wave-Light.jpg" -O "./wave-Light.jpg"


	sudo ln -sf wave-Dark.jpg next.jpg
	sudo ln -sf next.jpg default.jpg
	sudo ln -sf next.jpg default-login.jpg
	sudo ln -sf next.jpg default-grub.jpg


	cd "${OLDPWD}"

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
	#gsettings set org.gnome.desktop.background picture-uri "'/usr/share/backgrounds/default.png'"
	#gsettings set org.gnome.desktop.background picture-uri-dark "'/usr/share/backgrounds/default.png'"
	#gsettings set org.gnome.desktop.screensaver picture-uri "'/usr/share/backgrounds/default-login.png'"


	## config via dconf write
	#dconf write /org/gnome/desktop/background/picture-uri "'/usr/share/backgrounds/default.png'"
	#dconf write /org/gnome/desktop/background/picture-uri-dark "'/usr/share/backgrounds/default.png'"
	#dconf write /org/gnome/desktop/screensaver/picture-uri "'/usr/share/backgrounds/default-login.png'"


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
	echo sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Fluent-kde/refs/heads/main/wallpaper/Fluent-round-light/contents/images/3840x2160.png" -O "./Fluent-round-light.png"
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
## ## Model / Style / graphite
##

sys_style_install_for_graphite () {

	sys_style_asset_install_for_graphite

	sys_style_config_install_for_graphite

}

sys_style_config_install_for_graphite () {

dconf load / << __EOF__


[org/gnome/desktop/interface]
color-scheme='prefer-dark'
gtk-theme='Graphite-Dark'
icon-theme='GreyStone-Circle'
cursor-theme='Graphite-dark-cursors'
cursor-size=24


[org/gnome/desktop/wm/preferences]
theme='Graphite-Dark'


[org/gnome/shell/extensions/user-theme]
name='Graphite-Dark'


__EOF__

}

sys_style_asset_install_for_graphite () {

	sys_wallpaper_install_for_graphite

	sys_theme_install_graphite_gtk_theme

	sys_theme_install_graphite_cursor_theme

	sys_theme_install_citrus_icon_theme

	sys_theme_install_greystone_icon_theme

}

sys_theme_install_graphite_gtk_theme () {

	sys_theme_install_graphite_gtk_theme_via_wget_archive

}

sys_theme_install_graphite_gtk_theme_via_wget_archive () {


	if [ -e "${HOME}/.themes/Graphite" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Graphite-gtk-theme/archive/refs/heads/main.tar.gz' -O '/tmp/Graphite-gtk-theme-main.tar.gz'




	cd /tmp

	tar xf Graphite-gtk-theme-main.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Graphite-gtk-theme-main

	./install.sh --theme all

	cd "${OLDPWD}"

}

sys_theme_install_graphite_cursor_theme () {

	sys_theme_install_graphite_cursor_theme_via_wget_archive

}

sys_theme_install_graphite_cursor_theme_via_wget_archive () {


	if [ -e "${HOME}/.local/share/icons/Graphite-dark-cursors" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Graphite-cursors/archive/refs/heads/main.tar.gz' -O '/tmp/Graphite-cursors-main.tar.gz'




	cd /tmp

	tar xf Graphite-cursors-main.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Graphite-cursors-main

	./install.sh

	cd "${OLDPWD}"




}




##
##
################################################################################
##
##




##
## ## Model / Style / jasper
##

sys_style_install_for_jasper () {

	sys_style_asset_install_for_jasper

	sys_style_config_install_for_jasper

}

sys_style_config_install_for_jasper () {

dconf load / << __EOF__


[org/gnome/desktop/interface]
color-scheme='prefer-dark'
gtk-theme='Jasper-Dark'
icon-theme='GreyStone-Circle'
cursor-theme='Vimix-cursors'
cursor-size=24


[org/gnome/desktop/wm/preferences]
theme='Jasper-Dark'


[org/gnome/shell/extensions/user-theme]
name='Jasper-Dark'


__EOF__

}

sys_style_asset_install_for_jasper () {

	sys_wallpaper_install_for_default

	sys_theme_install_jasper_gtk_theme

	sys_theme_install_vimix_cursor_theme

	sys_theme_install_citrus_icon_theme

	sys_theme_install_greystone_icon_theme

}

sys_theme_install_jasper_gtk_theme () {

	sys_theme_install_jasper_gtk_theme_via_wget_archive

}

sys_theme_install_jasper_gtk_theme_via_wget_archive () {


	if [ -e "${HOME}/.themes/Jasper" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Jasper-gtk-theme/archive/refs/heads/main.tar.gz' -O '/tmp/Jasper-gtk-theme-main.tar.gz'




	cd /tmp

	tar xf Jasper-gtk-theme-main.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Jasper-gtk-theme-main

	./install.sh --theme all

	cd "${OLDPWD}"

}




##
##
################################################################################
##
##




##
## ## Portal / Tool
##

portal_tool_install () {

	echo
	echo
	echo "##"
	echo "## ## portal_tool_install"
	echo "##"
	echo
	echo

	mod_tool_package_install

	mod_tool_config_install

	return 0
}




##
## ## Model / Tool / Package
##

mod_tool_package_install () {

	return 0
}




##
## ## Model / Tool / Config
##

mod_tool_config_install () {

	sys_tool_config_install_for_nautilus

	sys_tool_config_install_for_gedit

	sys_tool_config_install_for_gnome_text_editor

	sys_tool_config_install_for_gnome_terminal

	sys_tool_config_install_for_gnome_console

	sys_tool_config_install_for_ptyxis

	sys_tool_config_install_for_mate_terminal

	sys_tool_config_install_for_nemo

	sys_tool_config_install_for_mousepad

	sys_tool_config_install_for_plank

}

sys_tool_config_install_for_nautilus () {

dconf load / << __EOF__


[org/gnome/nautilus/preferences]
click-policy='double'
show-hidden-files=true
default-sort-in-reverse-order=false
default-sort-order='name'
default-folder-viewer='list-view'
search-filter-time-type='last_modified'


[org/gnome/nautilus/list-view]
use-tree-view=false
default-zoom-level='medium'
default-visible-columns=['name', 'size', 'date_modified', 'starred']


[org/gnome/nautilus/icon-view]
default-zoom-level='medium'


[org/gtk/gtk4/settings/file-chooser]
expand-folders=false
show-hidden=true
sort-column='name'
sort-directories-first=true
sort-order='ascending'


[org/gtk/settings/file-chooser]
expand-folders=false
show-hidden=true
sort-column='name'
sort-directories-first=true
sort-order='ascending'


__EOF__

}

sys_tool_config_install_for_gedit () {

dconf load / << __EOF__


[org/gnome/gedit/state/window]
side-panel-active-page='GeditFileBrowserPanel'


[org/gnome/gedit/preferences/ui]
side-panel-visible=true
show-tabs-mode='auto'


[org/gnome/gedit/preferences/editor]
display-line-numbers=true
display-right-margin=true
highlight-current-line=true
insert-spaces=false
tabs-size=uint32 4
#scheme='oblivion'
style-scheme-for-dark-theme-variant='oblivion'
style-scheme-for-light-theme-variant='solarized-light'
use-default-font=false
editor-font='Monospace 14'


[org/gnome/gedit/preferences/encodings]
candidate-encodings=['UTF-8', 'ISO-8859-15', 'UTF-16', 'BIG5', 'GB2312']





[org/gnome/gedit/plugins]
active-plugins=['filebrowser', 'quickhighlight', 'modelines', 'sort', 'externaltools', 'openlinks', 'docinfo', 'pythonconsole', 'spell']


[org/gnome/gedit/plugins/externaltools]
use-system-font=false
font='Monospace 14'



[org/gnome/gedit/plugins/pythonconsole]
use-system-font=false
font='Monospace 14'


__EOF__

}

sys_tool_config_install_for_gnome_text_editor () {

dconf load / << __EOF__


[org/gnome/TextEditor]
auto-indent=true
auto-save-delay=uint32 3
custom-font='Monospace 12'
discover-settings=true
draw-spaces='[]'
enable-snippets=false
highlight-current-line=true
highlight-matching-brackets=true
indent-style='tab'
indent-width=-1
keybindings='default'
last-save-directory=''
line-height=1.2
recolor-window=true
restore-session=false
right-margin-position=80
show-grid=false
show-line-numbers=true
show-map=true
show-right-margin=true
spellcheck=true
style-scheme='oblivion'
style-variant='dark'
tab-width=uint32 4
use-system-font=false
wrap-text=true


__EOF__

}

sys_tool_config_install_for_gnome_terminal () {

dconf load / << __EOF__


[org/gnome/terminal/legacy]
default-show-menubar=false


[org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
scrollbar-policy='never'
use-system-font=false
font='Monospace 14'
use-theme-colors=false
background-color='rgb(0,0,0)'
foreground-color='rgb(170,170,170)'
palette=['rgb(46,52,54)', 'rgb(204,0,0)', 'rgb(78,154,6)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(6,152,154)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(138,226,52)', 'rgb(252,233,79)', 'rgb(114,159,207)', 'rgb(173,127,168)', 'rgb(52,226,226)', 'rgb(238,238,236)']


__EOF__

}

sys_tool_config_install_for_gnome_console () {

dconf load / << __EOF__


[org/gnome/Console]
ignore-scrollback-limit=true
scrollback-lines=10000
theme='night'
transparency=true
font-scale=1.0
use-system-font=false
custom-font='Monospace 12'


__EOF__

}

sys_tool_config_install_for_ptyxis () {

dconf load / << __EOF__


[org/gnome/Ptyxis]
profile-uuids=['578c7b2df2d9745eebe348d968ee32b4']
default-profile-uuid='578c7b2df2d9745eebe348d968ee32b4'
interface-style='dark'
font-name='Monospace 12'
use-system-font=false
restore-session=false


[org/gnome/Ptyxis/Profiles/578c7b2df2d9745eebe348d968ee32b4]
label='Default'
opacity=0.9
palette='Vs Code'


[org/gnome/Ptyxis/Shortcuts]
zoom-in='<Control>equal'
zoom-one='<Control>0'
zoom-out='<Control>minus'


__EOF__

}

sys_tool_config_install_for_mate_terminal () {

dconf load / << __EOF__


[org/mate/terminal/profiles/default]
visible-name='Default'
default-show-menubar=false
scrollbar-position='hidden'
scroll-on-keystroke=true
silent-bell=true
cursor-blink-mode='off'
use-theme-colors=false
use-custom-default-size=true
use-system-font=false
font='Monospace 14'
allow-bold=true
bold-color='#000000000000'
background-type='transparent'
background-darkness=0.85
background-color='#000000000000'
foreground-color='#AAAAAAAAAAAA'
palette='#000000000000:#CCCC00000000:#4E4D9A9A0605:#C4C3A0A00000:#34346564A4A3:#7575504F7B7B:#060598979A9A:#D3D3D7D6CFCF:#555457565352:#EFEF29282928:#8A89E2E23434:#FCFBE9E84F4F:#72729F9ECFCF:#ADAC7F7EA8A8:#3434E2E2E2E2:#EEEDEEEDECEB'


__EOF__

}

sys_tool_config_install_for_nemo () {

dconf load / << __EOF__


[org/nemo/desktop]
font='Sans 12'
#font='Monospace 12'


[org/nemo/preferences]
show-hidden-files=true
ignore-view-metadata=true
default-folder-viewer='list-view'
click-policy='double'
show-open-in-terminal-toolbar=true
show-reload-icon-toolbar=true
show-new-folder-icon-toolbar=true
date-format='iso'
never-queue-file-ops=true
inherit-folder-viewer=false
show-full-path-titles=true
date-font-choice='no-mono'


[org/nemo/compact-view]
default-zoom-level='standard'


[org/nemo/icon-view]
default-zoom-level='standard'


[org/nemo/list-view]
default-zoom-level='standard'


__EOF__

}

sys_tool_config_install_for_mousepad () {

dconf load / << __EOF__


[org/xfce/mousepad/preferences/file]
add-last-end-of-line=true


[org/xfce/mousepad/preferences/view]
auto-indent=true
color-scheme='oblivion'
font-name='Monospace 16'
highlight-current-line=true
match-braces=true
show-line-endings=false
show-line-numbers=true
show-right-margin=true
show-whitespace=true
smart-backspace=false
smart-home-end='after'
tab-width=uint32 4
use-default-monospace-font=false
word-wrap=true


[org/xfce/mousepad/preferences/window]
always-show-tabs=true
cycle-tabs=true
old-style-menu=true
statusbar-visible=true
toolbar-style='icons'
toolbar-visible=true


[org/xfce/mousepad/state/search]
highlight-all=true


[org/xfce/mousepad/state/window]
fullscreen=false
height=uint32 628
maximized=false
width=uint32 668


__EOF__

}

sys_tool_config_install_for_plank () {

dconf load / << __EOF__


[net/launchpad/plank/dock/settings]
auto-pinning=false
hide-mode='none'
theme='Gtk+'
icon-size=36
zoom-enabled=true
zoom-percent=150
#dock-items=['pcmanfm-qt.dockitem', 'org.xfce.mousepad.dockitem', 'firefox.dockitem', 'sakura.dockitem', 'desktop.dockitem']
dock-items=['thunar.dockitem', 'org.xfce.mousepad.dockitem', 'firefox.dockitem', 'xfce4-terminal.dockitem', 'xfce-settings-manager.dockitem', 'xfce-ui-settings.dockitem', 'desktop.dockitem']


__EOF__

}




##
##
################################################################################
##
##




##
## ## Portal / Master
##

portal_gnome_shell_master_install () {

	echo
	echo
	echo "##"
	echo "## ## portal_gnome_shell_master_install"
	echo "##"
	echo
	echo

	mod_gnome_shell_main_config_install

	return 0
}




##
## ## Model / Master / Gnome Shell
##

mod_gnome_shell_main_config_install () {

	sys_gnome_shell_main_config_install_for_main

	sys_gnome_shell_main_config_install_for_workspace_main

	sys_gnome_shell_main_config_install_for_favorite_apps

	sys_gnome_shell_main_config_install_for_theme_main

	sys_gnome_shell_main_config_install_for_wallpaper_main

}

sys_gnome_shell_main_config_install_for_main () {

dconf load / << __EOF__


[org/gnome/desktop/wm/preferences]
action-double-click-titlebar='toggle-maximize'
action-middle-click-titlebar='toggle-shade'
action-right-click-titlebar='menu'
button-layout='appmenu:minimize,maximize,close'
mouse-button-modifier='<Super>'
resize-with-right-button=true
raise-on-click=true
focus-mode='click'
focus-new-windows='smart'


[org/gnome/desktop/peripherals/keyboard]
numlock-state=false
remember-numlock-state=true


[org/gnome/desktop/sound]
event-sounds=false


[org/gnome/desktop/interface]
clock-format='24h'
clock-show-seconds=true
clock-show-weekday=true
enable-hot-corners=true


__EOF__

}

sys_gnome_shell_main_config_install_for_workspace_main () {

dconf load / << __EOF__


[org/gnome/desktop/wm/preferences]
num-workspaces=5
workspace-names=['File', 'Edit', 'Web', 'Term', 'Misc']


[org/gnome/mutter]
dynamic-workspaces=false


__EOF__

}

sys_gnome_shell_main_config_install_for_favorite_apps () {

dconf load / << __EOF__


[org/gnome/shell]
#favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.TextEditor.desktop', 'firefox_firefox.desktop', 'org.gnome.Ptyxis.desktop', 'org.gnome.Settings.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.Extensions.desktop', 'com.mattjakeman.ExtensionManager.desktop', 'org.gnome.Software.desktop']
favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.TextEditor.desktop', 'firefox-esr.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Settings.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.Extensions.desktop', 'com.mattjakeman.ExtensionManager.desktop', 'org.gnome.Software.desktop']








##
## ## Terminal / Sample
##

#[org/gnome/desktop/default-applications.terminal]
#exec='xdg-terminal-exec'
#exec-arg='--'




##
## ## Terminal / Use Case
##

[org/gnome/desktop/default-applications.terminal]
exec='ptyxis'
exec-arg=''


[org/mate/applications-terminal]
exec='ptyxis'
exec-arg=''


[org/cinnamon/desktop/default-applications.terminal]
exec='ptyxis'
exec-arg=''


__EOF__

}

sys_gnome_shell_main_config_install_for_theme_main () {

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

sys_gnome_shell_main_config_install_for_wallpaper_main () {

dconf load / << __EOF__


[org/gnome/desktop/background]
picture-options='zoom'
picture-uri='file:///usr/share/backgrounds/default.jpg'
picture-uri-dark='file:///usr/share/backgrounds/default.jpg'


[org/gnome/desktop/screensaver]
picture-uri='file:///usr/share/backgrounds/default-login.jpg'


__EOF__

}




##
##
################################################################################
##
##




##
## ## Portal / Keybind
##

portal_gnome_shell_keybind_install () {

	echo
	echo
	echo "##"
	echo "## ## portal_gnome_shell_keybind_install"
	echo "##"
	echo
	echo

	mod_gnome_shell_keybind_config_install

	return 0
}




##
## ## Model / Keybind / Gnome Shell
##

mod_gnome_shell_keybind_config_install () {

	sys_gnome_shell_keybind_config_install_for_main

	sys_gnome_shell_keybind_config_install_for_custom

}

sys_gnome_shell_keybind_config_install_for_main () {

dconf load / << __EOF__


[org/gnome/shell/keybindings]
toggle-application-view=['<Super>grave', '<Control><Alt>Up']
toggle-overview=['<Super>Tab', '<Control><Alt>Down']
toggle-message-tray=['<Super>n']
toggle-quick-settings=['<Super>m']
focus-active-notification=['<Super>b']
screenshot=['Print']
screenshot-window=['<Super>Print']
show-screenshot-ui=['<Alt>Print']
show-screen-recording-ui=['<Super><Control>v']


[org/gnome/desktop/wm/keybindings]
begin-move=['<Super>e']
begin-resize=['<Super>r']
close=['<Super>q', '<Alt>F4']
cycle-group=@as []
cycle-group-backward=@as []
cycle-panels=@as []
cycle-panels-backward=@as []
cycle-windows=['<Super>Escape', '<Super>Right']
cycle-windows-backward=['<Alt>Escape', '<Super>Left']
maximize=['<Control><Super>Up']
minimize=['<Super>x']
move-to-workspace-1=['<Shift><Alt>exclam']
move-to-workspace-10=['<Shift><Alt>parenright']
move-to-workspace-2=['<Shift><Alt>at']
move-to-workspace-3=['<Shift><Alt>numbersign']
move-to-workspace-4=['<Shift><Alt>dollar']
move-to-workspace-5=['<Shift><Alt>percent']
move-to-workspace-6=['<Shift><Alt>asciicircum']
move-to-workspace-7=['<Shift><Alt>ampersand']
move-to-workspace-8=['<Shift><Alt>asterisk']
move-to-workspace-9=['<Shift><Alt>parenleft']
show-desktop=['<Super>d']
switch-applications=@as []
switch-applications-backward=@as []
switch-group=@as []
switch-group-backward=@as []
switch-panels=@as []
switch-panels-backward=@as []
switch-to-workspace-1=['<Control><Alt>1']
switch-to-workspace-10=['<Control><Alt>0']
switch-to-workspace-2=['<Control><Alt>2']
switch-to-workspace-3=['<Control><Alt>3']
switch-to-workspace-4=['<Control><Alt>4']
switch-to-workspace-5=['<Control><Alt>5']
switch-to-workspace-6=['<Control><Alt>6']
switch-to-workspace-7=['<Control><Alt>7']
switch-to-workspace-8=['<Control><Alt>8']
switch-to-workspace-9=['<Control><Alt>9']
switch-to-workspace-down=@as []
switch-to-workspace-last=['<Alt>z']
switch-to-workspace-left=['<Alt>a', '<Control><Alt>Left']
switch-to-workspace-right=['<Alt>s', '<Control><Alt>Right']
switch-to-workspace-up=@as []
switch-windows=['<Super>s']
switch-windows-backward=['<Super>a']
toggle-above=['<Super>t']
toggle-fullscreen=['<Super>f', 'F11']
toggle-maximized=['<Super>w']
toggle-on-all-workspaces=['<Super>g']
#toggle-shaded=['<Super>y']
unmaximize=['<Control><Super>Down']




[org/gnome/mutter]
overlay-key=''


[org/gnome/mutter/keybindings]
toggle-tiled-left=['<Control><Super>Left']
toggle-tiled-right=['<Control><Super>Right']


[org/gnome/mutter/wayland/keybindings]
restore-shortcuts=['']




[org/gnome/settings-daemon/plugins/media-keys]
screensaver=['<Control><Alt>x']


__EOF__

}

sys_gnome_shell_keybind_config_install_for_custom () {

dconf load / << __EOF__


[org/gnome/settings-daemon/plugins/media-keys]
custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/system-logout/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/system-shutdown/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/wallpaper-shuf/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/wallpaper-default/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/control-center/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/rofi-show-run/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/rofi-show-window/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/rofi-show-drun/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal-1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal-2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal-3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal-4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/text-editor/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/web-browser/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/file-manager/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/file-manager-1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-control/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-toggle-mute/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-decrease/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-increase/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-decrease-slowly/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-increase-slowly/']




[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/file-manager-1]
binding='<Shift><Alt>g'
command='thunar'
name='File_Manager-1'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/file-manager]
binding='<Shift><Alt>f'
command='nautilus'
name='File_Manager'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/rofi-show-drun]
binding='<Shift><Alt>d'
command='rofi -show drun -show-icons'
name='Rofi_Show_Drun'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/rofi-show-run]
binding='<Shift><Alt>r'
command='rofi -show run'
name='Rofi_Show_Run'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/rofi-show-window]
binding='<Shift><Alt>w'
command='rofi -show window -show-icons'
name='Rofi_Show_Window'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/control-center]
binding='<Shift><Alt>s'
command='gnome-control-center'
name='Control_Center'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/system-logout]
binding='<Shift><Alt>x'
command='gnome-session-quit --logout'
name='System_Logout'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/system-shutdown]
binding='<Shift><Alt>z'
command='gnome-session-quit --power-off'
name='System_Shutdown'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal-1]
binding='<Shift><Alt>a'
command='ptyxis --new-window'
name='Terminal-1'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal-2]
binding='<Control><Alt>a'
command='xfce4-terminal'
name='Terminal-2'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal-3]
binding='<Shift><Alt>t'
command='gnome-terminal'
name='Terminal-3'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal-4]
binding='<Control><Alt>t'
command='sakura'
name='Terminal-4'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal]
binding='<Alt>Return'
command='ptyxis --new-window'
name='Terminal'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/text-editor]
binding='<Shift><Alt>e'
command='gnome-text-editor'
name='Text_Editor'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-control]
binding='<Shift><Alt>v'
command='pavucontrol'
name='Volume_Control'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-decrease-slowly]
binding='<Control><Alt>comma'
command='amixer -q -D pulse sset Master 1%- unmute'
name='Volume_Decrease_Slowly'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-decrease]
binding='<Shift><Alt>comma'
command='amixer -q -D pulse sset Master 5%- unmute'
name='Volume_Decrease'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-increase-slowly]
binding='<Control><Alt>period'
command='amixer -q -D pulse sset Master 1%+ unmute'
name='Volume_Increase_Slowly'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-increase]
binding='<Shift><Alt>period'
command='amixer -q -D pulse sset Master 5%+ unmute'
name='Volume_Decrease'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/volume-toggle-mute]
binding='<Alt>m'
command='amixer -q -D pulse sset Master toggle'
name='Volume_Toggle_Mute'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/wallpaper-default]
binding='<Control><Alt>w'
command='wallpaper-select-gnome default'
name='Wallpaper_Default'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/wallpaper-shuf]
binding='<Alt>w'
command='wallpaper-select-gnome shuf_favorite'
name='Wallpaper_Shuf'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/web-browser]
binding='<Shift><Alt>b'
command='firefox-esr --new-tab about:blank'
name='Web_Browser'


__EOF__

}




##
##
################################################################################
##
##




##
## ## Portal / Layout
##

portal_gnome_shell_layout_install () {

	echo
	echo
	echo "##"
	echo "## ## portal_gnome_shell_layout_install"
	echo "##"
	echo
	echo

	mod_gnome_shell_layout_install_prerun

	mod_gnome_shell_layout_install_mainrun

	mod_gnome_shell_layout_install_postrun

}




##
## ## Model / Layout
##

mod_gnome_shell_layout_install_prerun () {

	mod_python_pipx_install

	mod_gnome_shell_extensions_cli_install

	return 0

}

mod_gnome_shell_layout_install_mainrun () {

	sys_gnome_shell_extensions_install

	sys_gnome_shell_extensions_enable

	sys_gnome_shell_extensions_disable

	sys_gnome_shell_extensions_config

	return 0

}

mod_gnome_shell_layout_install_postrun () {

	return 0

}




##
## ## Model / Pipx
##

mod_python_pipx_install () {

	if is_command_exist pipx; then

		return

	fi

	sys_python_pipx_install

}

sys_python_pipx_install () {

	local the_distro="${REF_MASTER_DISTRO}"

	local the_delegate="sys_python_pipx_install_for_${the_distro}"


	if ! is_function_exist "${the_delegate}"; then
		return 0
	fi


	"${the_delegate}"


	return 0
}

sys_python_pipx_install_for_ubuntu () {

	echo
	echo sudo apt-get install -y pipx
	echo
	sudo apt-get install -y pipx

}

sys_python_pipx_install_for_debian () {

	echo
	echo sudo apt-get install -y pipx
	echo
	sudo apt-get install -y pipx

}

sys_python_pipx_install_for_fedora () {

	echo
	echo sudo dnf install pipx
	echo
	sudo dnf install pipx

}

sys_python_pipx_install_for_archlinux () {

	echo
	echo sudo pacman -Sy --needed python-pipx
	echo
	sudo pacman -Sy --needed python-pipx

}

sys_python_pipx_install_for_voidlinux () {

	echo
	echo sudo xbps-install -Su python3-pipx
	echo
	sudo xbps-install -Su python3-pipx

}




##
## ## Model / Gext
##

mod_gnome_shell_extensions_cli_install () {

	if is_command_exist gext; then

		return

	fi

	sys_gnome_shell_extensions_cli_install

}

sys_gnome_shell_extensions_cli_install () {

	sys_gnome_shell_extensions_cli_install_via_pipx

}

sys_gnome_shell_extensions_cli_install_via_pipx () {

	echo
	echo sudo pipx install gnome-extensions-cli --global
	echo
	sudo pipx install gnome-extensions-cli --global

}




##
## ## Model / Layout / Gnome Shell Extension
##

sys_gnome_shell_extensions_install () {

	local the_extension_list=${REF_GNOME_SHELL_EXTENSIONS_INSTALL[@]}

	local the_extension_id

	for the_extension_id in ${the_extension_list[@]}; do
		echo
		echo gext -F install "${the_extension_id}"
		gext -F install "${the_extension_id}"
		echo

		echo
		echo mkdir -p "${HOME}/.local/share/gnome-shell/extensions/${the_extension_id}/schemas"
		mkdir -p "${HOME}/.local/share/gnome-shell/extensions/${the_extension_id}/schemas"
		echo

		echo
		echo glib-compile-schemas "${HOME}/.local/share/gnome-shell/extensions/${the_extension_id}/schemas"
		glib-compile-schemas "${HOME}/.local/share/gnome-shell/extensions/${the_extension_id}/schemas"
		echo
	done

}

sys_gnome_shell_extensions_enable () {

	local the_extension_list=${REF_GNOME_SHELL_EXTENSIONS_ENABLE[@]}

	local the_extension_id

	for the_extension_id in ${the_extension_list[@]}; do
		echo
		echo gext enable "${the_extension_id}"
		gext enable "${the_extension_id}"
		echo
	done

}

sys_gnome_shell_extensions_disable () {

	local the_extension_list=${REF_GNOME_SHELL_EXTENSIONS_DISABLE[@]}

	local the_extension_id

	for the_extension_id in ${the_extension_list[@]}; do
		echo
		echo gext disable "${the_extension_id}"
		gext disable "${the_extension_id}"
		echo
	done

}




##
## ## Model / Layout / Gnome Shell Extension / Config
##

sys_gnome_shell_extensions_config () {

	sys_gnome_shell_extensions_config_for_dash_to_dock

	sys_gnome_shell_extensions_config_for_dash_to_panel

	sys_gnome_shell_extensions_config_for_arcmenu

	sys_gnome_shell_extensions_config_for_date_menu_formatter

	sys_gnome_shell_extensions_config_for_blur_my_shell

	return
}

sys_gnome_shell_extensions_config_for_dash_to_dock () {

dconf load / << __EOF__


[org/gnome/shell/extensions/dash-to-dock]
apply-custom-theme=false
autohide=false
autohide-in-fullscreen=true
background-color='#ffffff'
background-opacity=0.80000000000000004
click-action='cycle-windows'
dash-max-icon-size=36
dock-fixed=true
dock-position='BOTTOM'
extend-height=false
isolate-locations=true
middle-click-action='launch'
scroll-action='cycle-windows'
shift-click-action='previews'
shift-middle-click-action='quit'
shortcut=['']
shortcut-text=''
show-mounts=false
show-show-apps-button=true
show-trash=false
show-windows-preview=false
transparency-mode='DYNAMIC'


__EOF__

}

sys_gnome_shell_extensions_config_for_dash_to_panel () {

dconf load / << __EOF__


[org/gnome/shell/extensions/dash-to-panel]
animate-appicon-hover-animation-extent={'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}
click-action='CYCLE-MIN'
dot-position='BOTTOM'
group-apps=true
hotkeys-overlay-combo='TEMPORARILY'
intellihide=false
isolate-workspaces=true
panel-anchors='{"AUO-0x00000000":"MIDDLE","unknown-unknown":"MIDDLE"}'
panel-element-positions='{"AUO-0x00000000":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"unknown-unknown":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'
panel-lengths='{}'
panel-positions='{}'
panel-sizes='{}'
prefs-opened=false
scroll-icon-action='CYCLE_WINDOWS'
scroll-panel-action='SWITCH_WORKSPACE'
shortcut=['<Super>0']
shortcut-text='<Super>0'
show-window-previews=false
stockgs-keep-dash=false
stockgs-keep-top-panel=false
taskbar-locked=false
window-preview-title-position='TOP'


__EOF__

}

sys_gnome_shell_extensions_config_for_arcmenu () {

dconf load / << __EOF__


[org/gnome/shell/extensions/apps-menu]
apps-menu-toggle-menu=['<Alt>F3']


[org/gnome/shell/extensions/arcmenu]
activate-on-hover=true
arcmenu-hotkey=['<Alt>F1']
arcmenu-hotkey-overlay-key-enabled=false
enable-horizontal-flip=true
force-menu-location='Off'
hide-overview-on-startup=false
hotkey-open-primary-monitor=false
#menu-button-icon='start-here'
menu-button-icon-size=32
menu-button-padding=6
menu-item-grid-icon-size='Default'
menu-item-icon-size='Large'
menu-layout='Whisker'
override-menu-theme=false
position-in-panel='Left'
prefs-visible-page=0
searchbar-default-top-location='Bottom'
show-activities-button=true
vert-separator=true


__EOF__

}

sys_gnome_shell_extensions_config_for_date_menu_formatter () {

dconf load / << __EOF__


[org/gnome/shell/extensions/date-menu-formatter]
formatter='01_luxon'
pattern='HH:MM:ss \\n yyyy-MM-dd EEEE'
text-align='center'
use-default-calendar=true
use-default-locale=true


__EOF__

}

sys_gnome_shell_extensions_config_for_blur_my_shell () {

dconf load / << __EOF__

__EOF__

}




##
##
################################################################################
##
##




##
## ## Portal / Tips
##

portal_tips_on_done () {

	sys_tips_on_done

	return 0
}


##
## ## Model / Tips
##

sys_tips_on_done () {

cat << __EOF__

##
## ## Done
##
## It's done.
##
## Please Logout and Login.
##
## For Example:
##
## run to logout.
##
## \`\`\` sh
## gnome-session-quit
## \`\`\`
##
## or just 'Alt + Shfit + x' to Logout.
##
## Please check.
##
## For Example:
##
## * 'Super + w' to Maximize Window.
## * 'gsettings list-recursively | grep keybind' to see config via gsettings
## * 'dconf dump / | less' to see config via dconf
##

__EOF__

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

	portal_gnome_shell_master_install

	portal_gnome_shell_keybind_install

	portal_tool_install

	portal_gnome_shell_layout_install

	portal_gnome_shell_style_install

	portal_tips_on_done

}


##
## ## Main
##

__main__ () {

	portal_gnome_shell_install

}

__main__
