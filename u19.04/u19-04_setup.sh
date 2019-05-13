#! /usr/bin/env bash

# 2019-05-04 SJS
# installs	- dev tools & libs
#		- R & RStudio
#		- Sublime Text 3
#		- Rednotebook, Todo, Calibre, Texlive
#
# 2019-05-13 SJS
# git and build-essential are already installed per default

# CRAN R repository
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  51716619E084DAB9
printf '#CRAN mirror\ndeb https://cran.rstudio.com/bin/linux/ubuntu disco-cran35/\ndeb-src https://cran.rstudio.com/bin/linux/ubuntu disco-cran35/\n' | sudo tee -a /etc/apt/sources.list.d/cran-mirror.list

# Sublime repository
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Rednotebook PPA
sudo add-apt-repository ppa:rednotebook/stable -y

sudo apt-get update && sudo apt-get upgrade -y

# some development tools and libraries
sudo apt-get install -y libssl-dev libxml2-dev libcurl4-openssl-dev libmariadbclient-dev libxt-dev libopenblas-dev python3-pygame python3-csvkit #git build-essential
sudo apt-get install -y vim tree htop tmux zsh gdebi apt-transport-https r-base mariadb-client sublime-text texlive-full calibre gnome-todo qbittorrent

# RStudio
cd ~/Downloads/R/
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.1335-amd64.deb
sudo gdebi -n rstudio-1.2.1335-amd64.deb
printf '\nexport QT_STYLE_OVERRIDE=gtk\n' | sudo tee -a ~/.profile

# git config
runuser sschmidt -c "git config --global user.name 'Stefan Schmidt'"
runuser sschmidt -c "git config --global user.email 'stefan7schmidt@gmx.net'"

