#! /usr/bin/env bash

# rhel8_setup.sh
#
# 2019-05-05 SJS
# installs	- epel, rpmfusion and sublime repositories
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc...)
#
# 2019-05-12 SJS:
# epel not yet available for EL8.
# 2019-05-15 SJS:
# removed packages that are part of workstation installation.


# epel & rpm fusion
#sudo yum install -y epel-release
#sudo yum install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm

# sublime
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

sudo yum update
sudo yum install -y kernel-devel patch # already in rhel8 workstation: gcc glibc-headers glibc-devel kernel-headers gcc-c++ tree git subversion
sudo yum install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
sudo yum install -y tmux mariadb zsh sublime-text # R htop vlc gnome-todo focuswriter okular

# rstudio
#cd /home/sschmidt/Downloads/R/
#wget https://download1.rstudio.org/rstudio-1.1.463-x86_64.rpm
#sudo yum install -y rstudio-1.1.463-x86_64.rpm

# texlive
#sudo dnf install -y texlive-scheme-full

