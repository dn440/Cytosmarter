#!/bin/bash
 cd ~
 mkdir -p mnt/gdrive
 rclone mount gdrive: $HOME/mnt/gdrive
