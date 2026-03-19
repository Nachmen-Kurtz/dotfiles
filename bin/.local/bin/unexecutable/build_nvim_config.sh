#!/bin/bash

mkdir -p ~/.config/nvim/after/plugin/ ~/.config/nvim/lua/config &&
touch ~/.config/nvim/lua/config/lazy.lua &&
touch ~/.config/nvim/init.lua &&
echo "require('config.lazy')" >> ~/.config/nvim/init.lua
