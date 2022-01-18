#!/usr/bin/env bash

BACKGROUND="$1"

if [[ $BACKGROUND == "light" ]]; then
  # Light Theme
  # Tmux
  sed -i "s/^set/# set/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme \"edge\"/set -g @theme \"edge\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-background \"light\"/set -g @theme-background \"light\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-style \"default\"/set -g @theme-style \"default\"/g" ~/.tmux.conf

  sed -i "s/# set -g @theme \"everforest\"/set -g @theme \"everforest\"/g" ~/.tmux.conf
  sed -i "s/# set -g @theme-background \"light\"/set -g @theme-background \"light\"/g" ~/.tmux.conf
  sed -i "s/# set -g @theme-style \"default\"/set -g @theme-style \"default\"/g" ~/.tmux.conf
  # Vim
  sed -i "s/^let g:vimColorScheme/\" let g:vimColorScheme/g" ~/.local/dotfiles/vim/_machine_specific.vim
  # sed -i "s/\" let g:vimColorScheme = 'Edge Light'/let g:vimColorScheme = 'Edge Light'/g" ~/.local/dotfiles/vim/_machine_specific.vim
  sed -i "s/\" let g:vimColorScheme = 'Everforest Light'/let g:vimColorScheme = 'Everforest Light'/g" ~/.local/dotfiles/vim/_machine_specific.vim
elif [[ $BACKGROUND == "dark" ]]; then
  # Dark Theme
  # Tmux
  sed -i "s/^set/# set/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme \"edge\"/set -g @theme \"edge\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-background \"dark\"/set -g @theme-background \"dark\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-style \"neon\"/set -g @theme-style \"neon\"/g" ~/.tmux.conf

  sed -i "s/# set -g @theme \"everforest\"/set -g @theme \"everforest\"/g" ~/.tmux.conf
  sed -i "s/# set -g @theme-background \"dark\"/set -g @theme-background \"dark\"/g" ~/.tmux.conf
  sed -i "s/# set -g @theme-style \"default\"/set -g @theme-style \"default\"/g" ~/.tmux.conf
  # Vim
  sed -i "s/^let g:vimColorScheme/\" let g:vimColorScheme/g" ~/.local/dotfiles/vim/_machine_specific.vim
  # sed -i "s/\" let g:vimColorScheme = 'Edge Dark Neon'/let g:vimColorScheme = 'Edge Dark Neon'/g" ~/.local/dotfiles/vim/_machine_specific.vim
  sed -i "s/\" let g:vimColorScheme = 'Everforest Dark'/let g:vimColorScheme = 'Everforest Dark'/g" ~/.local/dotfiles/vim/_machine_specific.vim
else
  echo "参数错误，只能是 light | dark"
  exit 1
fi

tmux source-file ~/.tmux.conf \; display-message "Config reloaded..."
