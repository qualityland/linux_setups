#! /usr/bin/env bash

# 2018-01-11 SJS
# installs	- dev tools & libs
#		- R
#		- RStudio
#		- Sublime Text 3
# 2018-02-09 SJS
# - R source switched to Ubuntu (CRAN not yet available)
# 2018-03-29 SJS
# - updated RStudio version
# 2018-05-06 SJS
# - updated RStudio version
# 2018-05-16 SJS
# - added tmux, zsh, libmariadbclient-dev
# 2018-08-03 SJS
# - install R from CRAN server
# - updated RStudio version
# 2018-11-01 SJS
# - install R from Ubuntu repos
# - updated RStudio version to v1.1.463

# some development tools and libraries
sudo apt-get install -y vim tree htop git subversion build-essential tmux zsh				# cmd line tools
sudo apt-get install -y libssl-dev libxml2-dev libcurl4-openssl-dev libmariadbclient-dev libxt-dev	# dev libraries
sudo apt-get install -y mariadb-client texlive-full calibre						# software

# R (from Canonical repository)
#sudo apt-get update && sudo apt-get upgrade -y
#sudo apt-get install -y libopenblas-dev r-base

# R (from CRAN mirror)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  51716619E084DAB9
printf '#CRAN mirror\ndeb https://cran.rstudio.com/bin/linux/ubuntu bionic-cran35/\ndeb-src https://cran.rstudio.com/bin/linux/ubuntu bionic-cran35/\n' | sudo tee -a /etc/apt/sources.list.d/cran-mirror.list
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y libopenblas-dev r-base

# RStudio
cd ~/Downloads/R/
#wget https://download1.rstudio.org/rstudio-xenial-1.1.463-amd64.deb
sudo apt-get install -y gdebi
sudo gdebi -n rstudio-xenial-1.1.463-amd64.deb
printf '\nexport QT_STYLE_OVERRIDE=gtk\n' | sudo tee -a ~/.profile

# Sublime Text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text
