#!/bin/bash

# Update the repos
apt update
apt upgrade

# Install neovim
apt -y install neovim

# Link the ~/.vimrc to ~/.config/nvim/init.vim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


