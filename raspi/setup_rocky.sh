#!/bin/bash

# setup_rocky.sh
#
# 2022-09-24 SJS
# run with sudo or as root
# enables PowerTools & ELRepo repositories
# installs  - epel and rpmfusion repositories
#           - libs (to build common R packages)
#           - Tools (MySQL client, htop, zsh, tmux, vlc...)
#           - R

################################## base setup #################################

# change root password
passwd

# expand / file system
/bin/rootfs-expand

# install bash completion
dnf upgrade -y
dnf install -y bash-completion

# set hostname
hostnamectl set-hostname 'c82.example.com'

# set timezone
timedatectl set-timezone "Europe/Zurich"

# add admin user
useradd sschmidt
usermod -aG wheel sschmidt
passwd sschmidt


############################### install software ##############################S

# PowerTools, epel & rpm fusion
dnf config-manager --set-enabled powertools
dnf install -y epel-release
dnf install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm


#dnf update -y
dnf install -y exfat-utils fuse-exfat
dnf group install -y 'Development Tools'
dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel pam-devel rdma-core-devel libibverbs-utils
dnf install -y readline-devel sqlite-devel libffi-devel zeromq-devel harfbuzz-devel fribidi-devel libgit2-devel freetype-devel libpng-devel libtiff-devel
dnf install -y yum-utils tmux mariadb zsh
dnf install -y R


