#! /usr/bin/env bash

# rhel7_setup.sh
#
# 2019-05-14 SJS
# installs	- epel, rpmfusion and sublime repositories
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc...) 

# add epel & rpm fusion repo
sudo yum install -y epel-release
sudo yum install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm

# add sublime repo
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo yum-config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# install packages
sudo yum update
sudo yum install -y gcc patch glibc-headers glibc-devel kernel-headers kernel-devel dkms gcc-c++ tree git # subversion
sudo yum install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
sudo yum install -y R tmux mariadb htop zsh vlc sublime-text # rednotebook focuswriter okular

# rstudio
cd ~/Downloads/
wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.1335-x86_64.rpm
sudo yum install -y rstudio-1.2.1335-x86_64.rpm

# texlive
sudo dnf install -y texlive-scheme-full


# python3
yum groupinstall -y "development tools"
yum install -y libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel postgresql-devel

cd /usr/src
wget http://python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
tar xf Python-3.7.3.tar.xz
cd Python-3.7.3
./configure --enable-optimizations
make altinstall
