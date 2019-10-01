#!/bin/bash

# rhel8_ws_setup.sh
#
# 2019-09-25 SJS
# installs	- epel, rpmfusion and sublime repositories
#		    - libs (to build common R packages)
#		    - Tools (MySQL client, htop, zsh, tmux, vlc...)
#		    - R & RStudio not yet installable
#		    - user env cannot be copied (lacking exfat support)
#


# variables
MY_USER="sschmidt"
MY_HOME="/home/$MY_USER"
USB_STICK="/run/media/$MY_USER/KINGSTON/lx"


# epel & rpm fusion
#dnf install -y epel-release
#dnf install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm

# sublime
#rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
#dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

dnf update
#dnf install -y kernel-devel patch
#dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
#dnf install -y tmux mariadb zsh sublime-text gnome-tweaks R vlc

# still not installable:
#dnf install -y exfat-utils fuse-exfat
# rstudio
#wget https://download1.rstudio.org/desktop/fedora28/x86_64/rstudio-1.2.5001-x86_64.rpm
#dnf install -y $MY_HOME/Downloads/R/f28_rhel8/rstudio-1.2.5001-x86_64.rpm

# texlive
#dnf install -y texlive

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

# not now...maybe later
#dnf install -y focuswriter okular

