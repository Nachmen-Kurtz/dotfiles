#!/bin/bash

# dnf
sudo dnf check-update
sudo dnf upgrade -y

sudo dnf install \
  zsh \
  gpodder \
  fastfetch \
  vlc \
  epiphany \
  neovim python3-neovim \
  clapper \
  htop \
  wike \
  wireshark \
  nmap \
  gnome-tweaks \
  vim \
  wget \
  curl \
  -y
