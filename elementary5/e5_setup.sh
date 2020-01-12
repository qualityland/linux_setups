#! /usr/bin/env bash

# 2020-01-12 SJS
# Setup for elementary OS 5
# installs	- dev tools & libs
#		- R
#		- RStudio
#



# some development tools and libraries
sudo apt-get install -y vim tree htop git build-essential
sudo apt-get install -y libssl-dev libxml2-dev libcurl4-openssl-dev libmariadbclient-dev libxt-dev
sudo apt-get install -y mariadb-client #texlive-full

# R (from CRAN mirror)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  51716619E084DAB9
printf '#CRAN mirror\ndeb https://cran.rstudio.com/bin/linux/ubuntu bionic-cran35/\ndeb-src https://cran.rstudio.com/bin/linux/ubuntu bionic-cran35/\n' | sudo tee -a /etc/apt/sources.list.d/cran-mirror.list
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y libopenblas-dev r-base

# RStudio
cd ~/Downloads/R/
#wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5033-amd64.deb
sudo apt-get install -y gdebi
sudo gdebi -n rstudio-1.2.5033-amd64.deb
#printf '\nexport QT_STYLE_OVERRIDE=gtk\n' | sudo tee -a ~/.profile

