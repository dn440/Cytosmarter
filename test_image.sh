#!/bin/bash

########################################################################
# set up constants
########################################################################
IMGDIR="/home/pi/Pictures/"
CODEDIR="/home/pi/cytosmarter/"

########################################################################
# example code
########################################################################
# save to a home/pi folder
# ffmpeg -framerate 2.5 -f v4l2 -i /dev/video0 -vframes 1 "$IMGDIR$(date +\%Y-\%m-\%d-\%k\%M).jpeg"
# save to a USB drive mounted folder
# ffmpeg -framerate 2.5 -f v4l2 -i /dev/video0 -vframes 1 "/mnt/usb/$(date +\%Y-\%m-\%d-\%k\%M).jpeg"
# save to /boot so that the images are accessible from SD card adapter
# ffmpeg -framerate 2.5 -f v4l2 -i /dev/video0 -pix_fmt uyvy422 -vsync 2 -frames:v 1 "/boot/cytosmarter/$(date +\%Y-\%m-\%d-\%k\%M).jpeg"

########################################################################
# capture sequence
########################################################################
# turn LED on
python "${CODEDIR}LED-on.py"

# wait for light adjustment 
# sleep 2

# capture image
fswebcam -d /dev/video0 -p YUYV -r 1600x1200 "${IMGDIR}test_$(date +\%Y-\%m-\%d-\%k\%M).jpeg"

# turn LED off
python "${CODEDIR}LED-off.py"
