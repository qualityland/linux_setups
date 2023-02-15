#!/bin/bash

# setup.sh
#
# 2022-11-23 SJS
# run with sudo or as root
# installs  - epel and CRB repositories
#           - libs (to build common R packages)
#           - Tools (MySQL client, htop, zsh, tmux, vlc...)
#           - R & RStudio

# epel & rpm fusion
dnf update
dnf install -y epel-release
sudo dnf config-manager --set-enabled crb
#dnf install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-9.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-9.noarch.rpm

# sublime
#rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
#yum config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

dnf update -y
dnf group install -y 'Development Tools'
dnf install -y libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel pam-devel rdma-core-devel libibverbs-utils readline-devel sqlite-devel libffi-devel
dnf install -y zeromq-devel harfbuzz-devel fribidi-devel freetype-devel libpng-devel libtiff-devel libjpeg-turbo-devel
dnf install -y yum-utils tmux zsh R Lmod # foliate vlc mariadb gnome-tweaks sublime-text

# texlive
#yum install -y texlive

# rstudio
dnf install -y https://s3.amazonaws.com/rstudio-ide-build/electron/rhel9/x86_64/rstudio-2022.12.1-364-x86_64.rpm
