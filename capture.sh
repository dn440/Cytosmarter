#!/bin/bash
# save to a home/pi folder
# ffmpeg -framerate 2.5 -f v4l2 -i /dev/video0 -vframes 1 "/home/pi/cytosmarter/$(date +\%Y-\%m-\%d-\%k\%M).jpeg"
# save to a USB drive mounted folder
# ffmpeg -framerate 2.5 -f v4l2 -i /dev/video0 -vframes 1 "/mnt/usb/$(date +\%Y-\%m-\%d-\%k\%M).jpeg"
# save to /boot so that the images are accessible from SD card adapter
# ffmpeg -framerate 2.5 -f v4l2 -i /dev/video0 -pix_fmt uyvy422 -vsync 2 -frames:v 1 "/boot/cytosmarter/$(date +\%Y-\%m-\%d-\%k\%M).jpeg"

python /home/pi/LED-on.py
# sudo hub-ctrl -h 0 -P 2 -p 1
sleep 15
fswebcam -d /dev/video0 -p YUYV -r 1600x1200 "/home/pi/cytosmarter/$(date +\%Y-\%m-\%d-\%k\%M).jpeg"
python /home/pi/LED-off.py
# sudo hub-ctrl -h 0 -P 2 -p 0
