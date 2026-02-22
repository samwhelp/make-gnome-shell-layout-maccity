

# Gnome Shell Keybind




## Subject

* [Script](#script)
* [System](#system)
* [Application](#application)
* [Window](#window)
* [Switch](#switch)
* [Panel](#panel)
* [Screenshot](#screenshot)
* [Project](#project)





## Script

| Script |
| ------ |
| [gnome-shell-keybind](https://github.com/samwhelp/gnome-shell-adjustment/tree/main/demo/scripts/main/gnome-shell-adjustment) |
| [gnome-shell-adjustment](https://github.com/samwhelp/gnome-shell-adjustment/tree/main/demo/scripts/main/gnome-shell-keybind) |


| Script |
| ------ |
| [make-gnome-shell-layout-wincity](https://github.com/samwhelp/make-gnome-shell-layout-wincity) |
| [make-gnome-shell-layout-maccity](https://github.com/samwhelp/make-gnome-shell-layout-maccity) |




## System


## System / Exit

| Keybind                    | Action                      | Command                                 |
| -------------------------- | --------------------------- | --------------------------------------- |
| `Alt + Shift + z`          | Shutdown                    | sapwn `gnome-session-quit --power-off`  |
| `Alt + Shift + x`          | Logout                      | sapwn `gnome-session-quit --logout`     |




## Application


## Application / Lanuch via MainMenu or Runner

> `org.gnome.desktop.wm.keybindings`

| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Alt + F1`                 | Toggle Show ArcMenu         |                                       |
| `Alt + F2`                 | Toggle Show Runner          | `panel-run-dialog`                    |




## Application / Lanuch via Rofi

| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Alt + Shift + d`          | Rofi show drun              | spawn `rofi -show drun -show-icons`   |
| `Alt + Shift + w`          | Rofi show window            | spawn `rofi -show window -show-icons` |
| `Alt + Shift + r`          | Rofi show run               | spawn `rofi -show run`                |




## Application / Terminal

| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Alt + Enter`              | Lanuch Terminal             | spawn `kgx`                           |
| `Alt + Shift + a`          | Lanuch Terminal             | spawn `kgx`                           |
| `Alt + Ctrl + a`           | Lanuch Terminal             | spawn `gnome-terminal`                |
| `Alt + Shift + t`          | Lanuch Terminal             | spawn `xfce4-terminal`                |
| `Alt + Ctrl + t`           | Lanuch Terminal             | spawn `qterminal`                     |


| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Alt + Shift + y`          | Lanuch Drop Down Terminal   | spawn `xfce4-terminal --drop-down`    |




## Application / Favorite

| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Alt + Shift + f`          | Lanuch File Manager         | spawn `nautilus`                      |
| `Alt + Shift + g`          | Lanuch File Manager         | spawn `thunar`                        |
| `Alt + Shift + e`          | Lanuch Text Editor          | spawn `gnome-text-editor`             |
| `Alt + Shift + b`          | Lanuch Web Browser          | spawn `firefox --new-tab about:blank` |
| `Alt + Shift + v`          | Lanuch Volume Control       | spawn `gnome-control-center sound`    |


| Keybind                    | Action                      | Command                                  |
| -------------------------- | --------------------------- | ---------------------------------------- |
| `Alt + Shift + s`          | Lanuch System Settings      | spawn `gnome-control-center`             |
| `Alt + Ctrl + s`           | Lanuch Extensions Manager   | spawn `gnome-extensions-app`             |
| `Win + Shift + s`          | Lanuch Display Settings     | spawn `gnome-control-center display`     |
| `Win + Ctrl + s`           | Lanuch Appearance Settings  | spawn `gnome-control-center background`  |


| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Ctrl + Esc`               | Lanuch Process Manager      | spawn `gnome-system-monitor`          |
| `Win + p`                  | Monitor Switch              | spawn `switch-monitor`                |

> `org.gnome.mutter.keybindings switch-monitor`




## Window

> `org.gnome.desktop.wm.keybindings`

| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Alt + Space`              | Toggle Show Window Menu     | `activate-window-menu`                |
| `Win + q`                  | Window Close                | `close`                               |
| `Win + f`                  | Window Fullscreen           | `toggle-fullscreen`                   |
| `Win + w`                  | Window Maximize             | `maximize`                            |
| `Win + x`                  | Window Minimize             | `minimize`                            |
| `Win + d`                  | Toggle Show Desktop         | `show-desktop`                        |
| `Win + e`                  | Window Begin Move           | `begin-move`                          |
| `Win + r`                  | Window Begin Resize         | `begin-resize`                        |
| `Win + t`                  | Window Always on Top        | `always-on-top`                       |

> Normal keybind `Alt + F4` to `Close Window`

> Normal keybind `F11` to `Toggle Window Fullscreen`

> `gsettings list-recursively | grep keybind`

> We can also move a window by using `Win + [Mouse Left Button drag]`.

> We can also resize a window by using `Win + [Mouse Right Button drag]`.




## Switch

## Switch / Window

| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Win + a`                  | Focus Prev Window           | `switch-windows-backward`             |
| `Win + s`                  | Focus Next Window           | `switch-windows`                      |


> Normal keybind `Alt + Tab` to `Switch Window`




## Switch / Workspace

> `org.gnome.desktop.wm.keybindings`

| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Alt + a`                  | Switch to Prev Workspace    | `switch-to-workspace-left`            |
| `Alt + s`                  | Switch to Next Workspace    | `switch-to-workspace-right`           |

> Alternatively, we can use `Win + [Mouse Middle Button scroll]` on the desktop to `Switch Workspace`.




## Switch / Overview

> `org.gnome.shell.keybindings`

| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Win + grave`              | Toggle Show Applications    | `toggle-application-view`             |
| `Win + Tab`                | Toggle Show Activities      | `toggle-overview`                     |

> The grave refers to the backtick (`), the key above the Tab key.




## Panel

> `org.gnome.shell.keybindings`

| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Win + m`                  | Toggle Show Quick Settings  | `toggle-quick-settings`               |
| `Win + n`                  | Toggle Show Message Tray    | `toggle-message-tray`                 |
| `Win + v`                  | Toggle Show Clipboard       |                                       |




## Screenshot

> `org.gnome.shell.keybindings`

| Keybind                    | Action                      | Command                               |
| -------------------------- | --------------------------- | ------------------------------------- |
| `Print`                    | Screenshot Fullscreen       | `screenshot`                          |
| `Win + Print`              | Screenshot Window           | `screenshot-window`                   |
| `Alt + Print`              | Screenshot App              | `show-screenshot-ui`                  |
| `Win + Control + v`        | Screen Record               | `show-screen-recording-ui`            |




## Project

| [hotkey-tips](https://github.com/samwhelp/gnome-shell-adjustment/tree/main/project/gen/hotkey-tips) |
| ----------- |
| [hotkey-tips.md](https://github.com/samwhelp/gnome-shell-adjustment/blob/main/project/gen/hotkey-tips/dist/locale/en_US/hotkey-tips.md) |
| [hotkey-tips.tsv](https://github.com/samwhelp/gnome-shell-adjustment/blob/main/project/gen/hotkey-tips/dist/locale/en_US/hotkey-tips.tsv) |
| [hotkey-tips.sh](https://github.com/samwhelp/gnome-shell-adjustment/blob/main/project/gen/hotkey-tips/dist/locale/en_US/hotkey-tips.sh) |
