#!/bin/bash

# Prerequisites
## Install Glow
###  Source: https://github.com/charmbracelet/glow
### Install intended for kali linux, using glow version 1.4.1
if ! [ -x "$(command -v glow)" ]; then
  echo 'glow is not installed. Installing glow now...' >&2
  echo 'getting binary...' >&2
  wget https://github.com/charmbracelet/glow/releases/download/v1.4.1/glow_1.4.1_linux_amd64.deb -P ~/Downloads
  chmod 754 ~/Downloads/glow_1.4.1_linux_amd64.deb
  sudo apt install ~/Downloads/glow_1.4.1_linux_amd64.deb
fi

# Copy all files from github repo to directory
sudo cp -r $(pwd) /usr/local/bin/
sudo chown -R $USER:$USER /usr/local/bin/enumnotes

# creat symlink for `/usr/local/bin/enumnotes.sh` --> /usr/local/bin/enumnotes/enumnotes.sh
sudo ln -s /usr/local/bin/enumnotes/enumnotes.sh /usr/local/bin/enumnotes.sh 

# update filename database
sudo updatedb
