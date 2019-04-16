#! /usr/bin/env bash

# f30_setup.sh
# Setup a Fedora 30 Workstation
#
# 2019-03-05 SJS
# adds:	        - rpmfusion repository
#               - Sublime Text 3 repository
# installs:     - R & RStudio
#               - libs (to build common R packages)
#               - Tools (MySQL client, htop, zsh, tmux, vlc...) 
#               - LaTeX (texlive)
#
# 2019-04-16 SJS added qBitttorent, Gnome Tweaks, Pygame

# rpm fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# sublime
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

sudo dnf update
sudo dnf install -y binutils gcc make patch glibc-headers glibc-devel kernel-headers kernel-devel dkms vim subversion gcc-c++
sudo dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
sudo dnf install -y R vlc sublime-text tmux htop zsh gnome-todo python3-csvkit f30-backgrounds-extras-gnome qbittorrent gnome-tweaks python3-pygame # mariadb focuswriter okular

# rstudio
cd /home/sschmidt/Downloads/R/
#wget https://download1.rstudio.org/rstudio-1.1.463-x86_64.rpm
sudo dnf install -y rstudio-1.1.463-x86_64.rpm

# texlive
#sudo dnf install -y texlive-scheme-full


