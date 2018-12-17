#!/usr/bin/env bash

ln -sf ~/.local/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.pip
ln -sf ~/.local/dotfiles/.pip/pip.conf ~/.pip/pip.conf

ln -sf ~/.local/dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/.vim
ln -sf ~/.local/dotfiles/vim/UltiSnips ~/.vim/UltiSnips
