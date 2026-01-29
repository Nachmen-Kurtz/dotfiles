#!/bin/usr/bash

# Starship
curl -sS https://starship.rs/install.sh | sh

# Tofu
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
chmod +x install-opentofu.sh
./install-opentofu.sh --install-method standalone
rm -f install-opentofu.sh

# Rust
# Golang
# yt-dlp
# tldr
# awscli
