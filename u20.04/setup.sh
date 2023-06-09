#! /usr/bin/env bash

# setup.sh
# installs an R development environment
# on an Ubuntu 20.04 (Focal Fossa) machine.

# 2020-04-26 SJS
# installs:
#       - dev tools & libs
#       - R & RStudio
#       - Sublime Text 3
#       - Rednotebook, Todo, Calibre, Texlive
#

# CRAN R repository


# update indices
apt update && apt upgrade -y

# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: 298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"





# Sublime repository
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
#echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

# Rednotebook PPA
#add-apt-repository ppa:rednotebook/stable -y



# some development tools and libraries
apt install -y build-essential libssl-dev libxml2-dev libcurl4-openssl-dev libxt-dev libopenblas-dev
# some libraries needed to install contributed R packages
apt install -y jags libzmq3-dev libnode-dev libfontconfig1-dev default-jre default-jdk libmagick++-dev cmake libglpk-dev libmpfr-dev libcairo2-dev libgsl-dev
#apt install -y exfat-fuse exfat-utils abcde cd-discid lame cdparanoia id3 id3v2 eyed3
apt install -y vim tree htop tmux zsh gdebi git apt-transport-https r-base mariadb-client texlive-full calibre qbittorrent # sublime-text

# rstudio
cd /tmp/
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-2021.09.0-351-amd64.deb
gdebi -n rstudio-2021.09.0-351-amd64.deb

