#! /usr/bin/env bash

# setup.sh
#
# 2023-04-08 SJS
# installs:
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, zsh, tmux, rednotebook) 
#		- LaTeX (texlive)
#               - PostgreSQL & pgAdmin4




# Sublime repo
#rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
#dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo


dnf update -y
# development tools
dnf install -y binutils gcc make patch glibc-headers glibc-devel kernel-headers kernel-devel dkms vim gcc-c++ tmux zsh Lmod

# virtualization libs
dnf install -y libvirt bridge-utils virt-install virt-top libguestfs-tools virt-manager # qemu-kvm

# CD ripping
#dnf install -y abcde cd-discid lame cdparanoia id3v2 python3-eyed3 glyr

# development libs
dnf install -y cairo-devel freetype-devel fribidi-devel mariadb-devel openssl pam-devel powerline-fonts rdma-core-devel readline-devel sqlite-devel util-linux-user
dnf install -y libcurl-devel libgit2-devel libibverbs-utils libtiff-devel libjpeg-turbo-devel  libxml2-devel 

# R and RStudio
dnf install -y R rstudio-desktop # python3-csvkit sublime-text

# desktop apps
dnf install -y rednotebook foliate f38-backgrounds-extras-gnome # gtksourceview3

# texlive
dnf install -y texlive-scheme-full

# postgresql
dnf install -y postgresql-server postgresql-contrib postgis postgresql-plpython3
postgresql-setup --initdb --unit postgresql
systemctl enable postgresql

# pgAdmin4 (PostgreSQL Admin Tool)
dnf install -y https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-fedora-repo-2-1.noarch.rpm
# edit /etc/yum.repos.d/pgadmin4.repo
# replace line:
# baseurl=https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/fedora/fedora-$releasever-$basearch
# with:
# baseurl=https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/fedora/fedora-37-$basearch
dnf install -y pgadmin4-desktop
# edit /var/lib/pgsql/data/pg_hba.conf
# replace line:
# vhost    all             all             127.0.0.1/32            ident
# with:
# host    all             all             127.0.0.1/32            md5
systemctl start postgresql

# musescore
#dnf copr enable jjames/MuseScore
#dnf install -y musescore

# MacBook Pro Wifi
# rpm fusion repo
#dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#dnf install -y akmods broadcom-wl
#akmods
