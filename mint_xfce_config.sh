#!/bin/bash

# dirs
mkdir -p $HOME/android

# configs
#sudo update-alternatives --config x-cursor-theme #to select default cursor theme systemwide
sudo update-alternatives --set x-cursor-theme /usr/share/icons/DMZ-White/cursor.theme # use DMZ-white as default
xfce4-mouse-settings # set cursor theme

xdg-mime default nemo.desktop inode/directory #set nemo as default
driver-manager # install drivers