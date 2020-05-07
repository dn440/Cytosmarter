#!/bin/bash

python /home/pi/cytosmarter/LED-on.py
# run with minimal settings
# camorama -m -d=/dev/video0

# run with specific settings
# camorama -x 320 -y 240 -d=/dev/video0
camorama -x 352 -y 288 -d=/dev/video0
