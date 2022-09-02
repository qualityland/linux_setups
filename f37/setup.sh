#! /usr/bin/env bash

# setup.sh
#
# 2022-09-02 SJS
# installs:
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, zsh, tmux, rednotebook) 
#		- LaTeX (texlive)




# Sublime repo
#rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
#dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo


dnf update -y
# development tools
dnf install -y binutils gcc make patch glibc-headers glibc-devel kernel-headers kernel-devel dkms vim gcc-c++ tmux zsh Lmod

# virtualization libs
dnf install -y libvirt bridge-utils virt-install virt-top libguestfs-tools virt-manager # qemu-kvm

# CD ripping
#dnf install -y abcde cd-discid lame cdparanoia id3v2 python3-eyed3 glyr

# development libs
dnf install -y openssl libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel util-linux-user powerline-fonts libgit2-devel rdma-core-devel libibverbs-utils pam-devel cairo-devel readline-devel sqlite-devel

# R and RStudio
dnf install -y R rstudio-desktop # python3-csvkit sublime-text

# desktop apps
dnf install -y rednotebook foliate f37-backgrounds-extras-gnome # gtksourceview3

# texlive
dnf install -y texlive-scheme-full


# musescore
#dnf copr enable jjames/MuseScore
#dnf install -y musescore

# MacBook Pro Wifi
# rpm fusion repo
#dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#dnf install -y akmods broadcom-wl
#akmods
