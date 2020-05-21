#!/bin/bash

########################################################################
# set up constants
########################################################################
IMGDIR="/home/pi/mnt/gdrive/"
CODEDIR="/home/pi/cytosmarter/"
usb="~/hub-ctrl.c/hub-ctrl"

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

# turn USB hub on
sudo ~/hub-ctrl.c/hub-ctrl -h 0 -P 2 -p 1

# wait for USB devices to boot
# sleep 15

# capture image
fswebcam -d v4l2:/dev/video0 --input 0 -p YUYV --delay 5 \
	-r 1600x1200 "$IMGDIR$(date +\%Y-\%m-\%d-\%k\%M).jpeg" \
	--set "Exposure, Auto"="Aperture Priority Mode" \
	--set "White Balance Temperature, Auto"="False" \
	--set "White Balance Temperature"="1%" \
	--set "Brightness"="0%" \
	--set "Gamma"="0%" \
	--set "Backlight Compensation"="0"

#	--set "Exposure, Auto"="Manual Mode" \
#	--set "Exposure (Absolute)"="100%" \
#	--set "White Balance Temperature, Auto"="True" \

# turn LED off
python "${CODEDIR}LED-off.py"

# turn USB hub off
# sudo ~/hub-ctrl.c/hub-ctrl -h 0 -P 2 -p 0

