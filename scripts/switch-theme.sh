#!/usr/bin/env bash

BACKGROUND="$1"

if [[ $BACKGROUND == "light" ]]; then
  # Light Theme
  echo '切换主题配置...'
  # Kitty
  sed -i '' 's|^include ~/.config/kitty/tokyonight-theme/extras/kitty/tokyonight_night.conf|# include ~/.config/kitty/tokyonight-theme/extras/kitty/tokyonight_night.conf|g' ~/.config/kitty/kitty.conf
  sed -i '' 's|^# include ~/.config/kitty/tokyonight-theme/extras/kitty/tokyonight_day.conf|include ~/.config/kitty/tokyonight-theme/extras/kitty/tokyonight_day.conf|g' ~/.config/kitty/kitty.conf

  # Tmux
  sed -i '' 's/^set -g @theme-style "night"/# set -g @theme-style "night"/g' ~/.tmux.conf
  sed -i '' 's/^# set -g @theme-style "day"/set -g @theme-style "day"/g' ~/.tmux.conf

  # neovim
  sed -i '' 's/^export NVIM_TOKYONIGHT_VARIANT=night/# export NVIM_TOKYONIGHT_VARIANT=night/g' ~/.zshrc
  sed -i '' 's/^# export NVIM_TOKYONIGHT_VARIANT=day/export NVIM_TOKYONIGHT_VARIANT=day/g' ~/.zshrc


  # sed -i "s/^set/# set/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme \"edge\"/set -g @theme \"edge\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-background \"light\"/set -g @theme-background \"light\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-style \"default\"/set -g @theme-style \"default\"/g" ~/.tmux.conf

  # sed -i "s/# set -g @theme \"everforest\"/set -g @theme \"everforest\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-background \"light\"/set -g @theme-background \"light\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-style \"default\"/set -g @theme-style \"default\"/g" ~/.tmux.conf

  # Vim
  # sed -i "s/^let g:vimColorScheme/\" let g:vimColorScheme/g" ~/.local/dotfiles/vim/_machine_specific.vim
  # # sed -i "s/\" let g:vimColorScheme = 'Edge Light'/let g:vimColorScheme = 'Edge Light'/g" ~/.local/dotfiles/vim/_machine_specific.vim
  # sed -i "s/\" let g:vimColorScheme = 'Everforest Light'/let g:vimColorScheme = 'Everforest Light'/g" ~/.local/dotfiles/vim/_machine_specific.vim

  # 更新已打开的 tmux 相关窗口面板参数
  tmux list-panes -a -F '#{pane_id}' | while read pane_id; do
    tmux send-keys -t "$pane_id" 'export NVIM_TOKYONIGHT_VARIANT=day' C-m
  done

  echo '完成.'

elif [[ $BACKGROUND == "dark" ]]; then
  # Dark Theme
  echo '切换主题配置...'
  # Kitty
  sed -i '' 's|^include ~/.config/kitty/tokyonight-theme/extras/kitty/tokyonight_day.conf|# include ~/.config/kitty/tokyonight-theme/extras/kitty/tokyonight_day.conf|g' ~/.config/kitty/kitty.conf
  sed -i '' 's|^# include ~/.config/kitty/tokyonight-theme/extras/kitty/tokyonight_night.conf|include ~/.config/kitty/tokyonight-theme/extras/kitty/tokyonight_night.conf|g' ~/.config/kitty/kitty.conf
  # Tmux
  sed -i '' 's/^set -g @theme-style "day"/# set -g @theme-style "day"/g' ~/.tmux.conf
  sed -i '' 's/^# set -g @theme-style "night"/set -g @theme-style "night"/g' ~/.tmux.conf

  # neovim
  sed -i '' 's/^export NVIM_TOKYONIGHT_VARIANT=day/# export NVIM_TOKYONIGHT_VARIANT=day/g' ~/.zshrc
  sed -i '' 's/^# export NVIM_TOKYONIGHT_VARIANT=night/export NVIM_TOKYONIGHT_VARIANT=night/g' ~/.zshrc

  # sed -i "s/^set/# set/g" ~/.tmux.conf
  # sed -i "s/^set -g @theme-style \"night\"/# set -g @theme-style \"night\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-style \"day\"/set -g @theme-style \"day\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme \"edge\"/set -g @theme \"edge\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-background \"dark\"/set -g @theme-background \"dark\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-style \"neon\"/set -g @theme-style \"neon\"/g" ~/.tmux.conf

  # sed -i "s/# set -g @theme \"everforest\"/set -g @theme \"everforest\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-background \"dark\"/set -g @theme-background \"dark\"/g" ~/.tmux.conf
  # sed -i "s/# set -g @theme-style \"default\"/set -g @theme-style \"default\"/g" ~/.tmux.conf
  # Vim
  # sed -i "s/^let g:vimColorScheme/\" let g:vimColorScheme/g" ~/.local/dotfiles/vim/_machine_specific.vim
  # # sed -i "s/\" let g:vimColorScheme = 'Edge Dark Neon'/let g:vimColorScheme = 'Edge Dark Neon'/g" ~/.local/dotfiles/vim/_machine_specific.vim
  # sed -i "s/\" let g:vimColorScheme = 'Everforest Dark'/let g:vimColorScheme = 'Everforest Dark'/g" ~/.local/dotfiles/vim/_machine_specific.vim

  # 更新已打开的 tmux 相关窗口面板参数
  tmux list-panes -a -F '#{pane_id}' | while read pane_id; do
    tmux send-keys -t "$pane_id" 'export NVIM_TOKYONIGHT_VARIANT=night' C-m
  done

  echo '完成.'
else
  echo "参数错误，只能是 light | dark"
  exit 1
fi

tmux source-file ~/.tmux.conf \; display-message "Config reloaded..."
