#! /usr/bin/env bash

# f31_setup.sh
#
# 2019-09-23 SJS
# installs	- rpmfusion repositories
#		- Sublime Text 3
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc, gnote, rednotebook) 
#		- LaTeX (texlive)
#		- sschmidt: create RStudio directory and .gitconfig
#


# variables
MY_USER="sschmidt"
MY_HOME="/home/$MY_USER"
USB_STICK="/run/media/$MY_USER/Transcend/lx"

# rpm fusion
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# sublime
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

dnf update -y
dnf install -y binutils gcc make patch glibc-headers glibc-devel kernel-headers kernel-devel dkms vim gcc-c++ abcde cd-discid lame cdparanoia id3v2 python3-eyed3 glyr
dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel exfat-utils fuse-exfat util-linux-user powerline-fonts
dnf install -y R vlc sublime-text tmux htop zsh python3-csvkit gnome-todo f31-backgrounds-extras-gnome gnome-tweaks qbittorrent gnote rednotebook

# install musescore
dnf copr enable jjames/MuseScore
dnf install musescore

# user environment
# eBooks
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Documents/* $MY_HOME/Documents/"
# Pictures
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Pictures/* $MY_HOME/Pictures/"
# Music
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Music/* $MY_HOME/Music/"
# Hoerspiele
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Hoerspiel $MY_HOME/"
# R scripts
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Downloads/* $MY_HOME/Downloads/"
# Backups
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Backups $MY_HOME/"
# Directories
#runuser $MY_USER -c "cd $MY_HOME; mkdir -p wrk/studio src tmp"
# zsh
#runuser $MY_USER -c "chsh -s $(which zsh)"

# git config
#runuser sschmidt -c "git config --global user.name 'Stefan Schmidt'"
#runuser sschmidt -c "git config --global user.email 'stefan7schmidt@gmx.net'"
#runuser sschmidt -c "git config credential.helper store"


# rstudio
#wget https://download1.rstudio.org/desktop/fedora28/x86_64/rstudio-1.2.5001-x86_64.rpm
dnf install -y $MY_HOME/Downloads/R/f28_rhel8/rstudio-1.2.5001-x86_64.rpm

# texlive
dnf install -y texlive-scheme-full

# configuration files
# abcde (a better CD extractor)
runuser $MY_USER -c "cp --no-preserve=all ../.abcde.conf $MY_HOME/"


