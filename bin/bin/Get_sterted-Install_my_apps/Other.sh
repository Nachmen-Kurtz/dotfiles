# oh-my-zsh
---
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
# sed -i 's/^plugins=(git)$/plugins=(git copyfile copypath docker rust aws zoxide)/' ~/.zshrc

# vscode
---
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc 
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code -y

# docker
---
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
---
curl -f https://zed.dev/install.sh | sh



# brave
---
curl -fsS https://dl.brave.com/install.sh | sh
# curl -fsSLO "https://dl.brave.com/install.sh{,.asc}" && gpg --keyserver hkps://keys.openpgp.org --recv-keys BF62821AFB16036A4ACABCCC87E072BD82960F4D && gpg --verify install.sh.asc

# jekyll
---
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
--
cd ~/Downloads
wget https://zoom.us/client/6.3.6.6315/zoom_x86_64.rpm
sudo dnf install zoom_x86_64.rpm
wget https://zoom.us/linux/download/pubkey?version=5-12-6
# rpm --import package-signing-key.pub
# Key fingerprint: 59C8 6188 E22A BB19 BD55 4047 7B04 A1B8 DD79 B481

# anki
--
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
