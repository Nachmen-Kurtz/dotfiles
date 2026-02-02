#!/usr/bin/sh

detect_package_manager() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID

    case $DISTRO in
    arch | manjaro | endeavouros | garuda)
      PKG_MANAGER="pacman"
      INSTALL_CMD="pacman -S --noconfirm"
      UPDATE_CMD="pacman -Syu --noconfirm"
      ;;
    fedora | rhel | centos | rocky | alma)
      PKG_MANAGER="dnf"
      INSTALL_CMD="dnf install -y"
      UPDATE_CMD="dnf update -y"
      ;;
    debian | ubuntu | pop | mint | elementary)
      PKG_MANAGER="apt"
      INSTALL_CMD="apt install -y"
      UPDATE_CMD="apt update && apt upgrade -y"
      ;;
    alpine)
      PKG_MANAGER="apk"
      INSTALL_CMD="apk add"
      UPDATE_CMD="apk update && apk upgrade"
      ;;
    void)
      PKG_MANAGER="xbps"
      INSTALL_CMD="xbps-install -Sy"
      UPDATE_CMD="xbps-install -Su"
      ;;
    opensuse* | sles)
      PKG_MANAGER="zypper"
      INSTALL_CMD="zypper install -y"
      UPDATE_CMD="zypper update -y"
      ;;
    *)
      echo "Unsupported distribution: $DISTRO"
      return 1
      ;;
    esac
  elif command -v pacman >/dev/null 2>&1; then
    PKG_MANAGER="pacman"
    INSTALL_CMD="pacman -S --noconfirm"
    UPDATE_CMD="pacman -Syu --noconfirm"
  elif command -v dnf >/dev/null 2>&1; then
    PKG_MANAGER="dnf"
    INSTALL_CMD="dnf install -y"
    UPDATE_CMD="dnf update -y"
  elif command -v apt >/dev/null 2>&1; then
    PKG_MANAGER="apt"
    INSTALL_CMD="apt install -y"
    UPDATE_CMD="apt update && apt upgrade -y"
  elif command -v apk >/dev/null 2>&1; then
    PKG_MANAGER="apk"
    INSTALL_CMD="apk add"
    UPDATE_CMD="apk update && apk upgrade"
  elif command -v xbps-install >/dev/null 2>&1; then
    PKG_MANAGER="xbps"
    INSTALL_CMD="xbps-install -Sy"
    UPDATE_CMD="xbps-install -Su"
  else
    echo "No supported package manager found"
    return 1
  fi

  echo "Identified: $PKG_MANAGER"
  return 0
}

detect_package_manager

if [ "$(id -u)" -ne 0 ]; then
  echo "The script needs to be run with root privileges (sudo)"
  exit 1
fi

echo "Package Manager:        $PKG_MANAGER"
echo "Installation command:   $INSTALL_CMD"
#
#
#    # Basic Pkg:
#   zip \
# zip \
#   unzip \
#   less \
#   vlc \
#   nvim \
#   btop \
#   emacs \
#   borgbackup \
#   git \
#   fish \
#   man-db \
#   fwupd \
#   curl \
#   stow \
#   tmux \
#   keepassxc \
# stow \
#  git \
# vim \
# curl \
#
#
#    # Extra Pkg:
#
# ripgrep\
# tmux \
# fd \
# bat \
# btop \
# tree \
# tmux \
# neovim \
# wget \
# eza \
#
#   bat \
#   eza \
#   lazygit \
#   ripgrep \
#   imagemagick \
#   qbittorrent \
#   acpi \
#   blueman \
#   lxappearance \
#   virt-manager \
#   asciinema \
#   duf \
#   nmap \
#   kitty \
#   gpodder \
#   podman \
#   fastfetch \
#   zsh \
#   sqlitebrowser \
#   translate-shell \
#   wireshark-cli \
#   wireshark-qt \
#   ncdu \
#   clapper \
#   tig \
#   celluloid \
#   gitui \
#   zoxide \
#   fzf \
#   lsd \
#   fd \
#   htop \
#   mpv \
#   texinfo \
#   flatpak \
#   dua-cli \
#   genact \
#   nushell \
#   rsync \
#   vivaldi
#   zsh \
#   vlc \
#   neovim \
#   clapper \
#   htop \
#   zoxide \
#   duf \
#     bat
#     binsider
#     dust
#     dua
#     eza
#     gping
#     jj
#     navi
#     nu
#     rip
#     sd
#     tspin
#     tre
#     zoxide
#
#
#
#   # Fun ...
#
#     genact
#   cmatrix
#
#
#
# xclip
#  contour-terminal
#  sway
#  hyprland
#  waybar
#  fish
#  mpv
#  emacs
#  lsd
#  bfs
#  wl-clipboard
#  gimp
#  tcsh
#  ddgr
#  gparted
#  tldr
#  gdu
#  lazydocker
#  lazygit
#  keepassxc
#  meld
#  sysprof
#  d-spy
#  nasm
#  libvirt
#  virt-manager
#  libvirt
#  btop
#  vivaldi-stable-7.0.3495.2
#  bpytop
#  lolcat
#  cool-retro-term.x86_64
#  bat
#  fd-find
#  wike
#  sequeler
#  sqlitebrowser
#  alacritty
#  htop
#  fish
#  clapper
#  zoxide
#  duf
#  zox
