#! /usr/bin/env bash

# f33_setup.sh
#
# 2020-10-07 SJS
# installs:
#       - rpmfusion repositories (free & nonfree)
#		- Sublime Text 3
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc, gnote, rednotebook) 
#		- LaTeX (texlive)
#		- sschmidt: create RStudio directory and .gitconfig
#


# rpm fusion
#dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# sublime
#rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
#dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo


dnf update -y
dnf install -y binutils gcc make patch glibc-headers glibc-devel kernel-headers kernel-devel dkms vim gcc-c++ libvirt qemu-kvm
#dnf install -y abcde cd-discid lame cdparanoia id3v2 python3-eyed3 glyr
dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel util-linux-user powerline-fonts
dnf install -y R rstudio-desktop # python3-csvkit sublime-text zsh htop
dnf install -y tmux rednotebook f33-backgrounds-extras-gnome # gtksourceview3
#dnf install -y gnome-todo gnome-tweaks qbittorrent gnote


# rstudio
#dnf install -y https://download1.rstudio.org/desktop/centos8/x86_64/rstudio-1.3.1093-x86_64.rpm


# texlive
#dnf install -y texlive-scheme-full


# install musescore
#dnf copr enable jjames/MuseScore
#dnf install -y musescore

