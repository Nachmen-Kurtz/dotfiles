#!/bin/bash

# dnf
sudo dnf check-update
sudo dnf upgrade -y

sudo dnf install \
  zsh \
  gpodder \
  fastfetch \
  vlc \
  geary \
  zoxide \
  gnome-backgrounds-extras.noarch \
  epiphany \
  kiwix-desktop.x86_64 \
  duf \
  neovim python3-neovim \
  clapper \
  htop \
  wike \
  bat \
  wireshark \
  nmap \
  gnome-tweaks \
  vim \
  draw.io \
  wget \
  curl \
  -y

