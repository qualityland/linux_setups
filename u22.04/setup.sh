#! /usr/bin/env bash

# setup.sh
# installs an R development environment
# on an Ubuntu 22.04 (Jammy Jellyfish) machine.

# 2022-03-12 SJS
# installs:
#       - dev tools & libs
#       - R & RStudio
#       - Obsidian
#       - Rednotebook, Todo, Calibre, Texlive
#

# CRAN R repository

# update indices
apt update -qq
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# Rednotebook PPA
#add-apt-repository ppa:rednotebook/stable -y



# some development tools and libraries
apt install -y build-essential libssl-dev libxml2-dev libcurl4-openssl-dev libxt-dev libopenblas-dev

# some libraries needed to install contributed R packages
apt install -y jags libzmq3-dev libnode-dev libfontconfig-dev default-jre default-jdk libmagick++-dev cmake libglpk-dev libmpfr-dev libcairo2-dev libgsl-dev r-bioc-rbgl libharfbuzz-dev libfribidi-dev
#apt install -y exfat-fuse exfat-utils abcde cd-discid lame cdparanoia id3 id3v2 eyed3
apt install -y vim tree htop tmux zsh gdebi git apt-transport-https r-base mariadb-client texlive-full calibre qbittorrent rednotebook texstudio

# rstudio
cd /tmp/
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2022.12.0-353-amd64.deb
gdebi -n rstudio-2022.12.0-353-amd64.deb

# obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.1.9/obsidian_1.1.9_amd64.deb
gdebi -n obsidian_1.1.9_amd64.deb
