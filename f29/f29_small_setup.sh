#! /usr/bin/env bash

# f28_setup.sh
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

# rpm fusion
#sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# sublime
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

sudo dnf update
sudo dnf install -y binutils gcc make patch glibc-headers glibc-devel kernel-headers kernel-devel dkms vim subversion gcc-c++ #libgomp tree git # already f29 WS default
sudo dnf install -y openssl-devel libcurl-devel libxml2-devel libjpeg-turbo-devel mariadb-devel
sudo dnf install -y python R python2-csvkit sublime-text tmux mariadb htop # f29-backgrounds-extras-gnome zsh gnome-todo focuswriter okular vlc

# rstudio
cd /home/schmis12/Downloads/R/
#wget https://download1.rstudio.org/rstudio-1.1.463-x86_64.rpm
sudo dnf install -y rstudio-1.1.463-x86_64.rpm

# texlive
#sudo dnf install -y texlive-scheme-full

# vagrant
#cd /etc/yum.repos.d/
#sudo wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
#sudo dnf update
#sudo dnf install VirtualBox-5.1
#sudo /usr/lib/virtualbox/vboxdrv.sh setup
#sudo usermod -a -G vboxusers schmis12
#cd /home/schmis12/Downloads/
#wget https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.rpm
