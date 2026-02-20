#!/usr/bin/env bash


DEFAULT_MASTER_DISTRO="debian"
REF_MASTER_DISTRO="${REF_MASTER_DISTRO:=$DEFAULT_MASTER_DISTRO}"

echo "REF_MASTER_DISTRO=${REF_MASTER_DISTRO}"


##
## ## Test
##
## run
##
## ``` sh
## bash <(curl -L https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/test.sh)
## ```
##
## run
##
## ``` sh
## REF_MASTER_DISTRO=ubuntu bash <(curl -L https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-maccity/refs/heads/main/test.sh)
## ```
##
