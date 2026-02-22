

# Requirement

* [Requirement for Install Gnome Extensions](#requirement-for-install-gnome-extensions)
* [Requirement for ArcMenu](#requirement-for-arcmenu)
* [Requirement for Install fluent-gtk-theme](#requirement-for-install-fluent-gtk-theme)




## Requirement for Install Gnome Extensions

| Requirement | Note |
| ----------- | ---- |
| [pipx](https://github.com/pypa/pipx) | for install gnome-extensions-cli |
| [gnome-extensions-cli](https://github.com/essembeh/gnome-extensions-cli) | for install extension |

> run to install [pipx](https://packages.fedoraproject.org/pkgs/pipx/pipx/) at fedora

``` sh
sudo dnf install pipx
```

> run to install gnome-extensions-cli (gext)

``` sh
sudo pipx install gnome-extensions-cli --global
```




## Requirement for ArcMenu

| Requirement | Note |
| ----------- | ---- |
| [gnome-menus](https://packages.fedoraproject.org/pkgs/gnome-menus/gnome-menus/) | for [ArcMenu](https://extensions.gnome.org/extension/3628/arcmenu/) |

> run to install [gnome-menus](https://packages.fedoraproject.org/pkgs/gnome-menus/gnome-menus/) at fedora

``` sh
sudo dnf install gnome-menus
```

> ArcMenu Requires GMenu Package:

| Distro           | Package                                   |
| ---------------- | ----------------------------------------- |
| Debian / Ubuntu  | libgnome-menu-3-0, gir1.2-gmenu-3.0       |
| Fedora           | gnome-menus                               |
| Arch / Manjaro   | gnome-menus                               |
| OpenSUSE         | libgnome-menu-3-0, typelib-1_0-GMenu-3_0  |




## Requirement for Install fluent-gtk-theme

> run to install [sassc](https://packages.fedoraproject.org/pkgs/sassc/sassc/) at fedora

``` sh
sudo dnf install sassc
```
