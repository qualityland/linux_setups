#! /usr/bin/env bash

# rhel7_server_setup.sh
#
# 2019-07-18 SJS
# has to be run as root or sudo.
#
# installs	- epel and rpmfusion repositories
#		- python3
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc...) 


# variables
MY_USER="sschmidt"
MY_HOME="/home/$MY_USER"

# add epel & rpm fusion repo
yum install -y epel-release
yum install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm

# install packages
yum update -y
yum install -y gcc patch glibc-headers glibc-devel kernel-headers kernel-devel dkms gcc-c++ tree git
yum install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
yum install -y exfat-utils fuse-exfat R tmux mariadb htop zsh

# python3
yum groupinstall -y "development tools"
yum install -y libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel postgresql-devel

cd /usr/src
wget http://python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz
tar xf Python-3.7.4.tar.xz
cd Python-3.7.4
./configure --enable-optimizations
make altinstall

# user environment
# Dirwctories
runuser $MY_USER -c "cd $MY_HOME; mkdir wrk src tmp"

