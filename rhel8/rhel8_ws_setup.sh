#!/bin/bash

# rhel8_ws_setup.sh
#
# 2019-05-05 SJS
# installs	- epel, rpmfusion and sublime repositories
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc...)
#
# 2019-09-24 SJS:
# epel and rpmfusion activated.

# variables
MY_USER="sschmidt"
MY_HOME="/home/$MY_USER"
USB_STICK="/run/media/$MY_USER/Transcend/lx"


# epel & rpm fusion
dnf install -y epel-release
dnf install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm

# sublime
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

dnf update
dnf install -y kernel-devel patch
dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
dnf install -y tmux mariadb zsh sublime-text gnome-tweaks

# still not installable:
#dnf install -y R vlc exfat-utils fuse-exfat
# rstudio
#cd /home/sschmidt/Downloads/R/
#wget https://download1.rstudio.org/rstudio-1.1.463-x86_64.rpm
#sudo yum install -y rstudio-1.1.463-x86_64.rpm

# texlive
dnf install -y texlive

# user environment
# eBooks
#runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Documents/* $MY_HOME/Documents/"
# Pictures
#runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Pictures/* $MY_HOME/Pictures/"
# R scripts
#runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Downloads/* $MY_HOME/Downloads/"
# Dirwctories
#runuser $MY_USER -c "cd $MY_HOME; mkdir -p wrk/studio src tmp"

# not now...maybe later
#dnf install -y focuswriter okular

