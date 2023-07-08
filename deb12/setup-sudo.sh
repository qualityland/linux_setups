#! /usr/bin/env bash

# setup-sudo.sh
# installs an R development environment
# on a Debian 12 machine.

# 2023-07-08 SJS
# removes:
#	- legacy firefox
#	- LibreOffice
# installs:
#	- flatpak
#	- media codecs
#       - dev tools & libs
#	- R & RStudio
#


# flatpak
apt install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# remove libreoffice & legacy firefox
apt remove -y libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk3 libreoffice-help-common
apt remove -y libreoffice-help-en-us libreoffice-impress libreoffice-math libreoffice-style-colibre libreoffice-style-elementary libreoffice-writer
# sudo apt remove firefox-esr
# replace with mozillas firefox flatpak or chrome


# R
# as non-root run:
# gpg --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7'
# gpg --armor --export '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' | sudo tee /etc/apt/trusted.gpg.d/cran_debian_key.asc
# sudo add-apt-repository "deb http://cloud.r-project.org/bin/linux/debian bookworm-cran40/"


# some development tools and libraries
apt install -y make cmake build-essential wget curl llvm vim tree htop tmux zsh gdebi apt-transport-https
apt install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev tk-dev libxmlsec1-dev liblzma-dev


# CRAN R repository
# libraries needed for contributed R packages
apt install -y libcurl4-openssl-dev libxt-dev libopenblas-dev
apt install -y jags libzmq3-dev libnode-dev libfontconfig-dev default-jre default-jdk libmagick++-dev libglpk-dev libmpfr-dev r-bioc-rbgl libcairo2-dev libharfbuzz-dev libfribidi-dev
apt install -y  r-base

# rstudio
cd /tmp/
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2023.06.1-524-amd64.deb
gdebi -n rstudio-2023.06.1-524-amd64.deb

