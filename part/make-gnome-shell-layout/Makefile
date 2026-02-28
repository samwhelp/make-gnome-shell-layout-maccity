
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
	@echo '	$$ make layout'
	@echo
	@echo '	$$ make distro-ubuntu'
	@echo '	$$ make distro-debian'
	@echo '	$$ make distro-fedora'
	@echo '	$$ make distro-archlinux'
	@echo '	$$ make distro-voidlinux'
	@echo
.PHONY: help




layout:
	REF_MASTER_DISTRO=any ./make-gnome-shell-layout.sh
.PHONY: layout




distro-ubuntu:
	REF_MASTER_DISTRO=ubuntu ./make-gnome-shell-layout.sh
.PHONY: distro-ubuntu


distro-debian:
	REF_MASTER_DISTRO=debian ./make-gnome-shell-layout.sh
.PHONY: distro-debian


distro-fedora:
	REF_MASTER_DISTRO=fedora ./make-gnome-shell-layout.sh
.PHONY: distro-fedora


distro-archlinux:
	REF_MASTER_DISTRO=archlinux ./make-gnome-shell-layout.sh
.PHONY: distro-archlinux


distro-voidlinux:
	REF_MASTER_DISTRO=voidlinux ./make-gnome-shell-layout.sh
.PHONY: distro-voidlinux
