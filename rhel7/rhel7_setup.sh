#! /usr/bin/env bash

# rhel7_setup.sh
#
# 2019-05-14 SJS
# has to be run as root or sudo.
#
# installs	- epel, rpmfusion and sublime repositories
#		- R & RStudio
#		- python3
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc...) 
#
# 2019-11-16 SJS RStudio updated and copy PDFs to desktop.

# variables
MY_USER="sschmidt"
MY_HOME="/home/$MY_USER"
USB_STICK="/run/media/$MY_USER/Transcend/lx"

# add epel & rpm fusion repo
yum install -y epel-release
yum install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm

# add sublime repo
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
yum-config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# install packages
yum update -y
yum install -y gcc patch glibc-headers glibc-devel kernel-headers kernel-devel dkms gcc-c++ tree git # subversion
yum install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
yum install -y exfat-utils fuse-exfat R tmux mariadb htop zsh vlc sublime-text # rednotebook focuswriter okular

# texlive
yum install -y texlive


# python3
yum groupinstall -y "development tools"
yum install -y libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel postgresql-devel

cd /usr/src
wget http://python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
tar xf Python-3.7.3.tar.xz
cd Python-3.7.3
./configure --enable-optimizations
make altinstall

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
# Directories
#runuser $MY_USER -c "cd $MY_HOME; mkdir -p wrk/studio src tmp"
# zsh
#runuser $MY_USER -c "chsh -s $(which zsh)"

# git config
#runuser sschmidt -c "git config --global user.name 'Stefan Schmidt'"
#runuser sschmidt -c "git config --global user.email 'stefan7schmidt@gmx.net'"
#runuser sschmidt -c "git config credential.helper store"


# rstudio
#wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.5001-x86_64.rpm
yum install -y $MY_HOME/Downloads/R/rhel7/rstudio-1.2.5019-x86_64.rpm

