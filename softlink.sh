#!/usr/bin/env bash

ln -snf ~/.local/dotfiles/dircolors ~/.dircolors

ln -sf ~/.local/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.pip
ln -sf ~/.local/dotfiles/pip.conf ~/.pip/pip.conf

mkdir -p ~/.vim
ln -snf ~/.local/dotfiles/vim/UltiSnips ~/.vim/UltiSnips
ln -snf ~/.local/dotfiles/vim/snippets ~/.vim/snippets
ln -sf ~/.local/dotfiles/vim/coc-settings.json ~/.vim/coc-settings.json

mkdir -p ~/.config/nvim
ln -snf ~/.local/dotfiles/vim/UltiSnips ~/.config/nvim/UltiSnips
ln -snf ~/.local/dotfiles/vim/snippets ~/.config/nvim/snippets
ln -sf ~/.local/dotfiles/vim/coc-settings.json ~/.config/nvim/coc-settings.json

mkdir -p ~/.config/ranger
ln -sf ~/.local/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf

ln -sf ~/.local/dotfiles/yabai/yabairc ~/.yabairc
ln -sf ~/.local/dotfiles/yabai/skhdrc ~/.skhdrc
