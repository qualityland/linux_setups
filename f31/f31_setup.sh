#! /usr/bin/env bash

# f31_setup.sh
#
# 2019-09-23 SJS
# installs:
#       - rpmfusion repositories (free & nonfree)
#		- Sublime Text 3
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc, gnote, rednotebook) 
#		- LaTeX (texlive)
#		- sschmidt: create RStudio directory and .gitconfig
#
# 2019-11-09 SJS added gtksourceview3 (dependency for rednotebook)
# 2019-11-16 SJS copy current PDF files on Desktop
# 2020-01-01 SJS RStudio updated
# 2020-01-31 SJS moved copying of user data to separate script (copy_data.sh)


# rpm fusion
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# sublime
#rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
#dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo


dnf update -y
#dnf install -y  exfat-utils fuse-exfat
dnf install -y binutils gcc make patch glibc-headers glibc-devel kernel-headers kernel-devel dkms vim gcc-c++ abcde cd-discid lame cdparanoia id3v2 python3-eyed3 glyr
dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel util-linux-user powerline-fonts
dnf install -y R vlc sublime-text tmux python3-csvkit # zsh htop
#dnf install -y rednotebook gtksourceview3 # dependency for rednotebook
#dnf install -y gnome-todo f31-backgrounds-extras-gnome gnome-tweaks qbittorrent gnote


# rstudio
#wget https://download1.rstudio.org/desktop/fedora28/x86_64/rstudio-1.2.5033-x86_64.rpm
dnf install -y https://download1.rstudio.org/desktop/fedora28/x86_64/rstudio-1.2.5033-x86_64.rpm


# texlive
#dnf install -y texlive-scheme-full


# install musescore
#dnf copr enable jjames/MuseScore
#dnf install -y musescore

