#!/usr/bin/env bash




#echo "run: ${0}"




##
## ## Link
##
## * https://github.com/samwhelp/make-gnome-shell-layout-maccity/blob/main/part/make-gnome-shell-layout/make-gnome-shell-layout.sh
## * https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-layout/make-gnome-shell-layout.sh
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
position-in-panel='Center'
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
