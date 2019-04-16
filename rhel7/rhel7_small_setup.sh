	#! /usr/bin/env bash

# rhel7_small_setup.sh
#
# 2018-05-01 SJS
# installs	- epel, rpmfusion and sublime repositories
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc...) 
# 2018-05-05 SJS
# - added tmux, mariadb-devel
# 2018-05-20 SJS
# - added libjpeg-turbo-devel, zsh, htop
# 2018-07-16 SJS
# - rstudio version updated; gnome-todo & focuswriter added.
# 2018-09-02 SJS
# - updated for Fedora 29.
# 2018-12-22 SJS
# - updated for CentOS 7.
# 2019-01-03 SJS
# - epel, rpm fusion and sublime repos added.

# epel & rpm fusion
sudo yum install -y epel-release
sudo yum install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm

# sublime
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo yum-config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

sudo yum update
sudo yum install -y gcc patch glibc-headers glibc-devel kernel-headers kernel-devel dkms subversion gcc-c++ tree git
sudo yum install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
sudo yum install -y R tmux mariadb htop zsh vlc sublime-text # python2-csvkit gnome-todo focuswriter okular

# rstudio
cd /home/schmis12/Downloads/R/
#wget https://download1.rstudio.org/rstudio-1.1.463-x86_64.rpm
sudo yum install -y rstudio-1.1.463-x86_64.rpm

# texlive
#sudo dnf install -y texlive-scheme-full

