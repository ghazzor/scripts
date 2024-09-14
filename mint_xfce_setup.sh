#!/bin/bash

if [[ $EUID = 0 ]]; then
   echo "DO NOT RUN THIS WITH SUDO!"
   exit 1
fi

# basics
sudo apt update
sudo apt install nala -y
sudo nala intall wget curl git neofetch zstd -y

# install xanmod
wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -vo /usr/share/keyrings/xanmod-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list
sudo apt update
sudo nala install linux-xanmod-x64v4 -y

# some more packages
sudo nala upgrade -y
sudo nala install nemo build-essential zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# some xfce stuff
sudo add-apt-repository ppa:xubuntu-dev/extras -y
sudo apt update
sudo apt install xfce4-docklike-plugin xfce4-clipman-plugin -y

# extra packages
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo nala install sublime-text -y

# nuke stuff
packages_to_nuke=(
"libreoffice*"
transmission-gtk
thunderbird
rhythmbox
)

for bloat in "${packages_to_nuke[@]}"; do
        sudo apt-get remove --purge "$bloat" -y
done