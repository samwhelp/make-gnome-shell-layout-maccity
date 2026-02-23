#!/usr/bin/env bash




#echo "run: ${0}"




##
## ## Link
##
## * https://github.com/samwhelp/make-gnome-shell-layout-maccity/blob/main/part/make-gnome-shell-keybind/make-gnome-shell-keybind.sh
## * https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-keybind/make-gnome-shell-keybind.sh
##




##
## ## Args
##

DEFAULT_MASTER_DISTRO="debian"
REF_MASTER_DISTRO="${REF_MASTER_DISTRO:=$DEFAULT_MASTER_DISTRO}"

DEFAULT_MASTER_STYLE="colloid"
REF_MASTER_STYLE="${REF_MASTER_STYLE:=$DEFAULT_MASTER_STYLE}"




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
## ## Portal
##

portal_gnome_shell_install () {

	portal_gnome_shell_keybind_install

}


##
## ## Main
##

__main__ () {

	portal_gnome_shell_install

}

__main__
