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
gtk-theme='Adwaita-dark'
icon-theme='Papirus-Dark'
cursor-theme='Adwaita'
cursor-size=24


[org/gnome/desktop/wm/preferences]
theme='Adwaita-dark'


[org/gnome/shell/extensions/user-theme]
name='Adwaita-dark'


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
