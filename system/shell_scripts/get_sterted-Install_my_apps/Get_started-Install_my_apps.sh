#!/bin/bash

# NetFree
curl -sL https://netfree.link/dl/unix-ca.sh | sudo sh

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

# flatpak
flatpak install flathub \
  app.drey.Damask \
  md.obsidian.Obsidian \
  org.nickvision.tubeconverter \
  org.gnome.World.PikaBackup \
  io.gitlab.news_flash.NewsFlash \
  app.drey.Dialect \
  org.gnome.Extensions \
  org.gnome.Music \
  org.gnome.Papers \
  com.vixalien.sticky \
  io.bassi.Amberol \
  io.github.alainm23.planify \
  io.github.alescdb.mailviewer \
  com.github.jeromerobert.pdfarranger \
  org.gnome.gitlab.YaLTeR.VideoTrimmer \
  com.bitwarden.desktop \
  dev.bragefuglseth.Keypunch \
  io.github.diegoivan.pdf_metadata_editor \
  com.rafaelmardojai.Blanket \
  io.github.fizzyizzy05.binary \
  org.gnome.gitlab.cheywood.Pulp \
  io.github.flattool.Warehouse \
  com.belmoussaoui.Decoder \
  io.github.david_swift.Flashcards \
  io.github.zefr0x.hashes \
  com.belmoussaoui.Authenticator \
  io.github.bytezz.IPLookup \
  dev.geopjr.Collision \
  com.mattjakeman.ExtensionManager \
  com.konstantintutsch.Lock \
  io.github.ronniedroid.concessio \
  io.github.vmkspv.netsleuth \
  com.belmoussaoui.Obfuscate \
  dev.geopjr.Calligraphy \
  io.gitlab.liferooter.TextPieces \
  fr.romainvigier.MetadataCleaner \
  io.github.tfuxu.floodit \
  com.github.tchx84.Flatseal \
  -y

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
sed -i 's/^plugins=(git)$/plugins=(git copyfile copypath docker rust aws zoxide)/' ~/.zshrc

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc 
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code -y

# docker
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y # 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35
sudo systemctl enable --now docker
# sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
# docker run hello-world

# zed
curl -f https://zed.dev/install.sh | sh

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update

# cargo
cargo install \
  mdbook \
  yazi-fm \
  yazi-cli \
  binsider \
  genact \
  rm-improved \
  dua-cli \
  tre-command

# brave
curl -fsS https://dl.brave.com/install.sh | sh
# curl -fsSLO "https://dl.brave.com/install.sh{,.asc}" && gpg --keyserver hkps://keys.openpgp.org --recv-keys BF62821AFB16036A4ACABCCC87E072BD82960F4D && gpg --verify install.sh.asc

# jekyll
sudo dnf install \
  ruby \
  ruby-devel \
  openssl-devel \
  redhat-rpm-config \
  gcc-c++ \
  @development-tools \
  -y

echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

echo '# Install Ruby Gems to ~/gems' >> ~/.zshrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.zshrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

gem install jekyll bundler

# zoom
cd ~/Downloads
wget https://zoom.us/client/6.3.6.6315/zoom_x86_64.rpm
sudo dnf install zoom_x86_64.rpm
wget https://zoom.us/linux/download/pubkey?version=5-12-6
# rpm --import package-signing-key.pub
# Key fingerprint: 59C8 6188 E22A BB19 BD55 4047 7B04 A1B8 DD79 B481

# anki
wget https://github.com/ankitects/anki/releases/download/24.11/anki-24.11-linux-qt6.tar.zst
tar xaf anki-24.11-linux-qt6.tar.zst
cd anki-24.11-linux-qt6
sudo ./install.sh
cd

# google drive:
# nerd fonts
# kora icons
# bibata cursor
# .system directory
