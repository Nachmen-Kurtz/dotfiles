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

# Basic Pkg:
$INSTALL_CMD \
  i3 \
  i3status \
  polibar \
  dmenu \
  picom \
  rofi \
  borgbackup \
  btop \
  curl \
  emacs \
  fish \
  fwupd \
  git \
  keepassxc \
  less \
  man-db \
  nvim \
  stow \
  texinfo \
  tmux \
  unzip \
  vim \
  vivaldi \
  vlc \
  zip \
  podman \
  ufw

# Extra Pkg
$INSTALL_CMD \
  acpi \
  alacritty \
  asciinema \
  bat \
  bfs \
  binsider \
  blueman \
  bpytopbtop \
  celluloid \
  clapper \
  contour-terminal \
  duf \
  dusteza \
  fastfetch \
  fd \
  flatpak \
  fzf \
  gdugenact \
  gimpgitui \
  gpartedgpinggpodder \
  htop \
  imagemagick \
  jj \
  kitty \
  lazydockerlazygit \
  lsdlxappearance \
  meldmpv \
  nasmnavincdu \
  neovim \
  nmap \
  nu \
  nushell \
  qbittorrent \
  ripgrep \
  ripgreprsync \
  sd \
  sequelersqlitebrowser \
  sysproftcshtig \
  tldrtranslate-shell \
  tre \
  tree \
  tspinvirt-manager \
  wget \
  wireshark-cli \
  wireshark-qt \
  xclipzoxide \
  zsh \
  binsider \
  ffmpeg \
  7zip \
  jq \
  poppler \
  resvg \
  ImageMagick



# Fun ...
$INSTALL_CMD \
  cmatrix \
  genact \
  lolcat \
  cool-retro-term
