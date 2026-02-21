#!/usr/bin/env bash




#echo "run: ${0}"




##
## ## Link
##
## * https://github.com/samwhelp/make-gnome-shell-layout-maccity/blob/main/part/make-gnome-shell-tool/make-gnome-shell-tool.sh
## * https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-tool/make-gnome-shell-tool.sh
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
## ## Portal / Tool
##

portal_tool_install () {

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
## ## Portal
##

portal_gnome_shell_install () {

	portal_tool_install

}


##
## ## Main
##

__main__ () {

	portal_gnome_shell_install

}

__main__
