#!/bin/bash

# rhel8_ws_setup.sh
#
# 2020-04-07 SJS
# run with sudo or as root
# enables PowerTools & ELRepo repositories
# installs  - epel and rpmfusion repositories
#           - libs (to build common R packages)
#           - Tools (MySQL client, htop, zsh, tmux, vlc...)
#           - R & RStudio

# variables
#MY_USER="sschmidt"
#MY_HOME="/home/$MY_USER"
#MY_SRC="/home/$MY_USER/src"


# PowerTools, epel & rpm fusion
dnf config-manager --enable PowerTools
dnf install -y epel-release
dnf install -y https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm

# ELRepo
#dnf install -y https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
#rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

# ELRepo main line kernel (kernel-ml)
#dnf --enablerepo=elrepo-kernel install kernel-ml
#dnf --enablerepo=elrepo-kernel --allowerasing install kernel-ml-{devel,headers,tools}

# remove ELRepo kernel
#dnf --allowerasing install kernel-{devel,headers,tools}
#dnf remove kernel-ml


# sublime
#rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
#yum config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

#dnf update -y
dnf install -y exfat-utils fuse-exfat
dnf group install -y 'Development Tools'
dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel pam-devel rdma-core-devel libibverbs-utils
dnf install -y yum-utils tmux vlc R mariadb zsh # gnome-tweaks sublime-text

# texlive
#yum install -y texlive

# build R from source
#yum-builddep R -y
#runuser $MY_USER -c "mkdir $MY_SRC"
#runuser $MY_USER -c "cd $MY_SRC; wget https://cran.rstudio.com/src/base/R-4/R-4.0.0.tar.gz"
#runuser $MY_USER -c "cd $MY_SRC; tar xvzf R-4.0.0.tar.gz"
#runuser $MY_USER -c "cd $MY_SRC/R-4.0.0/; ./configure --prefix=/opt/R/4.0.0 --enable-R-shlib --with-blas --with-lapack"
#runuser $MY_USER -c "cd $MY_SRC/R-4.0.0/; make"


# rstudio
dnf install -y https://download1.rstudio.org/desktop/centos8/x86_64/rstudio-1.4.1106-x86_64.rpm

# not now...maybe later
#yum install -y focuswriter okular
