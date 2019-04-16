#! /usr/bin/env bash

# f29_setup.sh
#
# 2018-05-01 SJS
# installs	- rpmfusion repositories
#		- Sublime Text 3
#		- R & RStudio
#		- libs (to build common R packages)
#		- Tools (MySQL client, htop, zsh, tmux, vlc...) 
#		- LaTeX (texlive)
# 2018-05-05 SJS
# - added tmux, mariadb-devel
# 2018-05-20 SJS
# - added libjpeg-turbo-devel, zsh, htop
# 2018-07-16 SJS
# - rstudio version updated; gnome-todo & focuswriter added.
# 2018-09-02 SJS
# - updated for Fedora 29
# 2019-02-08 SJS
# - python2 removed
# 2019-03-05 SJS
# - python3-csvkit added


# rpm fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# sublime
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

sudo dnf update
sudo dnf install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms vim tree git subversion gcc-c++
sudo dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
sudo dnf install -y R vlc sublime-text tmux htop zsh gnome-todo python3-csvkit #f29-backgrounds-extras-gnome mariadb focuswriter okular

# rstudio
cd /home/schmis12/Downloads/R/
#wget https://download1.rstudio.org/rstudio-1.1.463-x86_64.rpm
sudo dnf install -y rstudio-1.1.463-x86_64.rpm

# texlive
#sudo dnf install -y texlive-scheme-full


