#! /usr/bin/env bash

# 2019-05-04 SJS
# installs	- dev tools & libs
#		- R & RStudio
#		- Sublime Text 3
#		- Rednotebook, Todo, Calibre, Texlive
#
# 2019-05-13 SJS
# git and build-essential are already installed per default
# 2019-06-09 SJS
# sudo's removed, exfat support added, copying from usb stick added.


# variables
MY_USER="sschmidt"
MY_HOME="/home/$MY_USER"
USB_STICK="/media/$MY_USER/Transcend/lx"

# CRAN R repository
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  51716619E084DAB9
printf '#CRAN mirror\ndeb https://cran.rstudio.com/bin/linux/ubuntu eoan-cran35/\ndeb-src https://cran.rstudio.com/bin/linux/ubuntu eoan-cran35/\n' | sudo tee -a /etc/apt/sources.list.d/cran-mirror.list

# Sublime repository
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

# Rednotebook PPA
add-apt-repository ppa:rednotebook/stable -y

apt-get update && apt-get upgrade -y

# some development tools and libraries
apt-get install -y libssl-dev libxml2-dev libcurl4-openssl-dev libmariadbclient-dev libxt-dev libopenblas-dev exfat-fuse exfat-utils abcde cd-discid lame cdparanoia id3 id3v2 eyed3
apt-get install -y vim tree htop tmux zsh gdebi git apt-transport-https r-base mariadb-client sublime-text texlive-full calibre gnome-todo qbittorrent

# user environment
# eBooks
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Documents/* $MY_HOME/Documents/"

# Pictures
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Pictures/* $MY_HOME/Pictures/"

# R scripts
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Downloads/* $MY_HOME/Downloads/"

# git config
runuser $MY_USER -c  "git config --global user.name 'Stefan Schmidt'"
runuser $MY_USER -c  "git config --global user.email 'stefan7schmidt@gmx.net'"

# rstudio
cd $MY_HOME/Downloads/R/u18_d10/
gdebi -n rstudio-1.2.5033-amd64.deb
runuser $MY_USER -c "printf '\nexport QT_STYLE_OVERRIDE=gtk\n' | sudo tee -a ~/.profile"

runuser $MY_USER -c "cd $MY_HOME; mkdir -p wrk/studio src tmp"
