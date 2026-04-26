#! /bin/bash

# sourse: https://github.com/LazyVim/LazyVim#-getting-started

# Make a backup of your current Neovim files:  
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Clone the starter
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Remove the .git folder, so you can add it to your own repo later
rm -rf ~/.config/nvim/.git

# Start Neovim!
nvim


