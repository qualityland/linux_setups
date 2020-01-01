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
# 2019-10-03 SJS installation sequence corrected.
# 2019-10-24 SJS exfat-utils fuse-exfat added.
# 2019-10-25 SJS enable PowerTools repo
# 2019-11-16 SJS copy current PDF files on Desktop. RStudio update.
# 2020-01-01 SJS RStudio updated and dnf replaced with yum.

# variables
MY_USER="sschmidt"
MY_HOME="/home/$MY_USER"
USB_STICK="/run/media/$MY_USER/Transcend/lx"


# PowerTools, epel & rpm fusion
yum config-manager --enable PowerTools
yum install -y epel-release
yum install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm

# sublime
#rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
#yum config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

yum update -y
yum install -y exfat-utils fuse-exfat
yum group install -y 'Development Tools'
yum install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
yum install -y tmux gnome-tweaks R vlc # mariadb zsh sublime-text

# texlive
#yum install -y texlive

# user environment
# Desktop
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Desktop/* $MY_HOME/Desktop/"
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

# rstudio
#wget https://download1.rstudio.org/desktop/fedora28/x86_64/rstudio-1.2.5033-x86_64.rpm
#yum install -y $MY_HOME/Downloads/R/f28_rhel8/rstudio-1.2.5033-x86_64.rpm
yum install -y https://download1.rstudio.org/desktop/fedora28/x86_64/rstudio-1.2.5033-x86_64.rpm

# not now...maybe later
#yum install -y focuswriter okular

