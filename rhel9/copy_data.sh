#!/bin/bash

# copy_data.sh
#
# 2020-04-07 SJS
# copies content of USB drive to $HOME

# variables
MY_USER="sschmidt"
MY_HOME="/home/$MY_USER"
USB_STICK="/run/media/$MY_USER/Transcend/lx"


# Desktop
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Desktop/* $MY_HOME/Desktop/"
# eBooks
runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Documents/* $MY_HOME/Documents/"
# Pictures
#runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Pictures/* $MY_HOME/Pictures/"
# Music
#runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Music/* $MY_HOME/Music/"
# Hoerspiele
#runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Hoerspiel $MY_HOME/"
# R scripts
#runuser $MY_USER -c "cp -r --no-preserve=all $USB_STICK/Downloads/* $MY_HOME/Downloads/"
