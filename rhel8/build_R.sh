#!/bin/bash

# build_R.sh
#
# 2020-04-27 SJS
# builds R from source

# variables
MY_USER="sschmidt"
R_VERSION="4.0.0"
SRC="/home/$MY_USER/src"

#sudo yum builddep R -y
cd $SRC
wget https://cran.rstudio.com/src/base/R-4/R-$R_VERSION.tar.gz
tar xvzf R-$R_VERSION.tar.gz
cd R-$R_VERSION/
./configure --prefix=/opt/R/$R_VERSION --enable-R-shlib --with-blas --with-lapack
echo "R-$R_VERSION (make -j 5)" >> ../compile-time.txt
date >> ../compile-time.txt; make -j 5; date >> ../compile-time.txt 

