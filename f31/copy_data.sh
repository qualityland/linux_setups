#! /usr/bin/env bash

# copy_data.sh
#
# 2020-01-31 SJS
# copies the following data to $HOME
#		- Desktop
#		- Documents
#		- Pictures
#		- Music
#		- Hoerspiele
#		- R Scripts
#       - Backups
#       - abcd config file
#

# variables
MY_USER="sschmidt"
MY_HOME="/home/$MY_USER"
USB_STICK="/run/media/$MY_USER/Transcend/lx"
#USB_STICK="/run/media/$MY_USER/KINGSTON/lx"

#dnf install -y  exfat-utils fuse-exfat

# Desktop
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Desktop/* $MY_HOME/Desktop/"

# eBooks
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Documents/* $MY_HOME/Documents/"

# Pictures
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Pictures/* $MY_HOME/Pictures/"

# Music
#runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Music/* $MY_HOME/Music/"

# Hoerspiele
#runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Hoerspiel $MY_HOME/"

# R scripts
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Downloads/* $MY_HOME/Downloads/"

# Backups
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Backups $MY_HOME/"

# abcde (a better CD extractor) config file
#runuser $MY_USER -c "cp --no-preserve=all ../.abcde.conf $MY_HOME/"


