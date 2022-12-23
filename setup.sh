#!/bin/bash

# Prerequisites
## Install Glow
###  Source: https://github.com/charmbracelet/glow
### Install Instructions: https://snapcraft.io/install/glow/debian
if ! [ -x "$(command -v glow)" ]; then
  echo 'glow is not installed. Installing glow now...' >&2
  sudo apt update
  sudo apt install snapd
  sudo service snapd start
  sudo snap install core
  sudo snap install glow
fi

# Copy all files from github repo to directory
sudo cp -r $(pwd) /usr/local/bin/

# creat symlink for `/usr/local/bin/enumnotes.sh` --> /usr/local/bin/enumnotes/enumnotes.sh
sudo ln -s /usr/local/bin/enumnotes/enumnotes.sh /usr/local/bin/enumnotes.sh 

sudo updatedb
