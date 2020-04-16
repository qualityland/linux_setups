#!/bin/bash

# rhel8_ws_setup.sh
#
# 2020-04-07 SJS
# enables PowerTools repo
# installs  - epel and rpmfusion repositories
#           - libs (to build common R packages)
#           - Tools (MySQL client, htop, zsh, tmux, vlc...)
#           - R & RStudio

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

# rstudio
yum install -y https://download1.rstudio.org/desktop/fedora28/x86_64/rstudio-1.2.5042-x86_64.rpm

# not now...maybe later
#yum install -y focuswriter okular
