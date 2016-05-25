#! /bin/bash

# Create required directories
cd ~
mkdir .config
cd .config
mkdir nvim
cd nvim
mkdir autoload
cd ~

rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln  ~/Setup/dotfiles/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

rm ~/.zshrc
ln -s ~/Setup/dotfiles/.zshrc ~/.zshrc

rm ~/.config/nvim/autoload/plug.vim
ln -s ~/Setup/dotfiles/nvim/autoload/plug.vim ~/.config/nvim/autoload/plug.vim

rm ~/.config/nvim/init.vim
ln -s ~/Setup/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

rm ~/.tmux.conf
ln -s ~/Setup/dotfiles/.tmux.conf ~/.tmux.conf

