

# make-gnome-shell-style




## Subject

* [Usage](#usage)
* [Option](#option)




## Usage


### Quick Start

> How to download [make-gnome-shell-style.sh](https://github.com/samwhelp/make-gnome-shell-layout-maccity/blob/main/part/make-gnome-shell-style/make-gnome-shell-style.sh) and run [it](https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh).


* run

``` sh
bash <(curl -L https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh)
```


* or run

``` sh
bash <(wget -q https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh -O - )
```


* or run

``` sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh || wget -q https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh -O - )"
```


* or run

``` sh
bash -c "$(wget -q https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh -O - || curl -fsSL https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh)"
```


### Basic

> default

``` sh
./make-gnome-shell-style.sh
```


> Option: [REF_MASTER_DISTRO](#option--ref_master_distro)

* execute local script

``` sh
REF_MASTER_DISTRO=archlinux ./make-gnome-shell-style.sh
```

* execute remote script

``` sh
REF_MASTER_DISTRO=archlinux bash <(curl -L https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh)
```


> Option: [REF_MASTER_STYLE](#option--ref_master_style)

* execute local script

``` sh
REF_MASTER_STYLE=jasper ./make-gnome-shell-style.sh
```

* execute remote script

``` sh
REF_MASTER_STYLE=jasper bash <(curl -L https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh)
```




## Option


### Option / REF_MASTER_DISTRO

| REF_MASTER_DISTRO   |
| ------------------- |
| `debian` (default)  |
| `ubuntu`            |
| `fedora`            |
| `archlinux`         |
| `voidlinux`         |

> We can use `REF_MASTER_DISTRO=any' to skip the step of installing required packages.


### Option / REF_MASTER_STYLE

| REF_MASTER_STYLE    |
| ------------------- |
| `fluent` (default)  |
| `colloid`           |
| `jasper`            |
| `graphite`          |
| `vimix`             |
| `orchis`            |
| `layan`             |
| `lavanda`           |
| `qogir`             |
