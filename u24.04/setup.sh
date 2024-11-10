#! /usr/bin/env bash

# setup.sh
# installs an R development environment
# on an Ubuntu 24.04 (Noble Numbat) machine.

# 2024-05-13 SJS
# installs:
#       - dev tools & libs
#       - R & RStudio
#

# CRAN R repository

# update indices
apt update && apt upgrade -y

# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: 298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'noble' to 'focal' or 'groovy' as needed
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# some development tools and libraries
apt install -y build-essential libssl-dev libxml2-dev libcurl4-openssl-dev libxt-dev libopenblas-dev libgdal-dev libgeos-dev libproj-dev 
# some libraries needed to install contributed R packages
apt install -y jags libzmq3-dev libnode-dev libfontconfig1-dev default-jre default-jdk libmagick++-dev cmake libglpk-dev libmpfr-dev libcairo2-dev libgsl-dev libharfbuzz-dev libfribidi-dev r-bioc-rbgl

# some tools
apt install -y vim tree htop tmux zsh gdebi git apt-transport-https r-base mariadb-client texlive-full calibre qbittorrent # sublime-text

# rstudio
#cd /tmp/
#wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2024.09.1-394-amd64.deb
#gdebi -n rstudio-2024.04.0-735-amd64.deb

