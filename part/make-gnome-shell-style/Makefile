
default: help
.PHONY: default

help:
	@echo 'Usage:'
	@echo '	$$ make [action]'
	@echo
	@echo 'Example:'
	@echo '	$$ make'
	@echo '	$$ make help'
	@echo
	@echo '	$$ make style-default'
	@echo
	@echo '	$$ make style-jasper'
	@echo '	$$ make style-fluent'
	@echo '	$$ make style-colloid'
	@echo '	$$ make style-vimix'
	@echo '	$$ make style-orchis'
	@echo '	$$ make style-layan'
	@echo '	$$ make style-lavanda'
	@echo '	$$ make style-qogir'
	@echo
.PHONY: help




style-default:
	./make-gnome-shell-style.sh
.PHONY: style-default




style-jasper:
	REF_MASTER_STYLE=jasper ./make-gnome-shell-style.sh
.PHONY: style-jasper


style-fluent:
	REF_MASTER_STYLE=fluent ./make-gnome-shell-style.sh
.PHONY: style-fluent


style-colloid:
	REF_MASTER_STYLE=colloid ./make-gnome-shell-style.sh
.PHONY: style-colloid


style-vimix:
	REF_MASTER_STYLE=vimix ./make-gnome-shell-style.sh
.PHONY: style-vimix


style-orchis:
	REF_MASTER_STYLE=orchis ./make-gnome-shell-style.sh
.PHONY: style-orchis


style-layan:
	REF_MASTER_STYLE=layan ./make-gnome-shell-style.sh
.PHONY: style-layan


style-lavanda:
	REF_MASTER_STYLE=lavanda ./make-gnome-shell-style.sh
.PHONY: style-orchis


style-qogir:
	REF_MASTER_STYLE=qogir ./make-gnome-shell-style.sh
.PHONY: style-orchis




distro-ubuntu:
	REF_MASTER_DISTRO=ubuntu ./make-gnome-shell-style.sh
.PHONY: distro-ubuntu


distro-debian:
	REF_MASTER_DISTRO=debian ./make-gnome-shell-style.sh
.PHONY: distro-debian


distro-fedora:
	REF_MASTER_DISTRO=fedora ./make-gnome-shell-style.sh
.PHONY: distro-fedora


distro-archlinux:
	REF_MASTER_DISTRO=archlinux ./make-gnome-shell-style.sh
.PHONY: distro-archlinux


distro-voidlinux:
	REF_MASTER_DISTRO=voidlinux ./make-gnome-shell-style.sh
.PHONY: distro-voidlinux




distro-ubuntu-style-jasper:
	REF_MASTER_DISTRO=ubuntu REF_MASTER_STYLE=jasper ./make-gnome-shell-style.sh
.PHONY: distro-ubuntu-style-jasper


distro-debian-style-jasper:
	REF_MASTER_DISTRO=debian REF_MASTER_STYLE=jasper ./make-gnome-shell-style.sh
.PHONY: distro-debian-style-jasper


distro-fedora-style-jasper:
	REF_MASTER_DISTRO=fedora REF_MASTER_STYLE=jasper ./make-gnome-shell-style.sh
.PHONY: distro-fedora-style-jasper


distro-archlinux-style-jasper:
	REF_MASTER_DISTRO=archlinux REF_MASTER_STYLE=jasper ./make-gnome-shell-style.sh
.PHONY: distro-archlinux-style-jasper


distro-voidlinux-style-jasper:
	REF_MASTER_DISTRO=voidlinux REF_MASTER_STYLE=jasper ./make-gnome-shell-style.sh
.PHONY: distro-voidlinux-style-jasper
