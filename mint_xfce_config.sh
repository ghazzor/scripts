#!/bin/bash

# dirs
mkdir -p $HOME/android

# move scripts and services
chmod 755 wgs
sudo cp wgs /usr/local/bin/wgs
sudo chown root:root /usr/local/bin/wgs

shellrc="$HOME/.zshrc"
shell_rc_lines=(
'export PATH=$HOME/.bin:$PATH'
'source $HOME/android/source'
'export MICRO_TRUECOLOR=1'
)

# Iterate over each line in the array
for line in "${shell_rc_lines[@]}"; do
  if ! grep -Fxq "$line" "$shellrc"; then
  echo "$line" >> "$shellrc"
fi
done

# Disable swap
sudo sed -i "s/\/swapfile/#\/swapfile/g" /etc/fstab

# configs
#sudo update-alternatives --config x-cursor-theme #to select default cursor theme systemwide
sudo update-alternatives --set x-cursor-theme /usr/share/icons/DMZ-White/cursor.theme # use DMZ-white as default
xfce4-mouse-settings # set cursor theme

xdg-mime default nemo.desktop inode/directory #set nemo as default
driver-manager # install drivers
