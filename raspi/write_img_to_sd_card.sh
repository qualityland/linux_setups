#! /usr/bin/bash

img=$1
log=/home/sschmidt/wrk/raspi/log/img_writing.log

echo "writing $img to SD card" | tee -a $log
umount /dev/mmcblk0p1
umount /dev/mmcblk0p3

echo "----- Overwriting Card with Zeroes -----" | tee -a $log
echo "start `date`" | tee -a $log
dd bs=4M if=/dev/zero of=/dev/mmcblk0 oflag=sync status=progress
echo "stop  `date`" | tee -a $log

echo "----- Writing Image to Card ------------" | tee -a $log
echo "start `date` $img" | tee -a $log
xzcat $img | dd bs=4M of=/dev/mmcblk0 oflag=sync status=progress
echo "stop  `date`" | tee -a $log

