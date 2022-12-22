#!/bin/bash

# Prerequisites
## Install Glow
###  Source: https://github.com/charmbracelet/glow
### Install Instructions: https://snapcraft.io/install/glow/debian
if ! [ -x "$(command -v glow)" ]; then
  echo 'Error: glow is not installed.' >&2
  sudo apt update
  sudo apt install snapd
  sudo snap install core
  sudo snap install glow
fi

# Copy all files from github repo to directory
sudo cp -r $(pwd) /usr/local/bin/

# creat symlink for `/usr/local/bin/enumnotes.sh` --> /usr/local/bin/enumnotes/enumnotes.sh
sudo ln -s /usr/local/bin/enumnotes/enumnotes.sh /usr/local/bin/enumnotes.sh 