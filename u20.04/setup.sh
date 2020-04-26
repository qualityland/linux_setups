#! /usr/bin/env bash

# setup.sh
# installs an R development environment
# on an Ubuntu 20.04 (Focal Fossa) machine.

# 2020-04-26 SJS
# installs:
#       - dev tools & libs
#		- R & RStudio
#		- Sublime Text 3
#		- Rednotebook, Todo, Calibre, Texlive
#

# CRAN R repository
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  51716619E084DAB9
#printf '#CRAN mirror\ndeb https://cran.rstudio.com/bin/linux/ubuntu focal-cran40/\ndeb-src https://cran.rstudio.com/bin/linux/ubuntu focal-cran40/\n' | sudo tee -a /etc/apt/sources.list.d/cran-mirror.list

# Sublime repository
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
#echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

# Rednotebook PPA
#add-apt-repository ppa:rednotebook/stable -y

apt update && apt upgrade -y

# some development tools and libraries
apt install -y build-essential libssl-dev libxml2-dev libcurl4-openssl-dev libmariadbclient-dev libxt-dev libopenblas-dev exfat-fuse exfat-utils abcde cd-discid lame cdparanoia id3 id3v2 eyed3
apt install -y vim tree htop tmux zsh gdebi git apt-transport-https r-base mariadb-client texlive-full calibre gnome-todo qbittorrent # sublime-text

# rstudio
cd /tmp/
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5042-amd64.deb
gdebi -n rstudio-1.2.5042-amd64.deb

