#! /bin/bash

# ZSH
rm ~/.zshrc
ln -s ~/Setup/dotfiles/zsh/.zshrc ~/.zshrc

# Neovim
mkdir -p ~/.config/nvim/
ln -s ~/Setup/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# hush macoS login
touch ~/.hushlogin
