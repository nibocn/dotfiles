#!/usr/bin/env bash

ln -snf ~/.local/dotfiles/dircolors ~/.dircolors

ln -sf ~/.local/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.pip
ln -sf ~/.local/dotfiles/.pip/pip.conf ~/.pip/pip.conf

ln -sf ~/.local/dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/.vim
ln -snf ~/.local/dotfiles/vim/UltiSnips ~/.vim/UltiSnips
ln -sf ~/.local/dotfiles/vim/coc-settings.json ~/.vim/coc-settings.json

mkdir -p ~/.config/ranger
ln -sf ~/.local/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
