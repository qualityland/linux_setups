#! /usr/bin/env bash

# f30_setup.sh
#
# 2019-04-27 SJS
# installs	- rpmfusion repositories
#		- Sublime Text 3
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc, gnote, rednotebook) 
#		- LaTeX (texlive)
#		- sschmidt: create RStudio directory and .gitconfig


# rpm fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# sublime
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

sudo dnf update
sudo dnf install -y binutils gcc make patch glibc-headers glibc-devel kernel-headers kernel-devel dkms vim subversion gcc-c++
sudo dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
sudo dnf install -y R vlc sublime-text tmux htop zsh gnome-todo python3-csvkit python3-pygame f30-backgrounds-extras-gnome gnome-tweaks qbittorrent gnote rednotebook # mariadb focuswriter okular

# rstudio
cd /home/sschmidt/Downloads/R/
#wget https://download1.rstudio.org/rstudio-1.1.463-x86_64.rpm
sudo dnf install -y rstudio-1.1.463-x86_64.rpm

# texlive
#sudo dnf install -y texlive-scheme-full

# user environment
runuser sschmidt -c "mkdir -p /home/sschmidt/wrk/studio /home/sschmidt/Documents/eBooks"
# eBooks
cd /run/media/sschmidt/KINGSTON/Documents/
runuser sschmidt -c "cp -r * /home/sschmidt/Documents/eBooks"
# R scripts
cd /run/media/sschmidt/KINGSTON/Downloads/
runuser sschmidt -c "cp -r cd_keys.txt R /home/sschmidt/Downloads/"
# git config
runuser sschmidt -c "git config --global user.name 'Stefan Schmidt'"
runuser sschmidt -c "git config --global user.email 'stefan7schmidt@gmx.net'"




