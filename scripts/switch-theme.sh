#!/usr/bin/env bash

BACKGROUND="$1"

# 定义发送通知的函数 (macOS 原生)
function send_notification() {
    local title="$1"
    local message="$2"
    osascript -e "display notification \"${message}\" with title \"${title}\" sound name \"default\""
}

if [[ $BACKGROUND == "light" ]]; then
  # Light Theme
  echo '切换主题配置...'
  # Kitty
  # sed -i '' 's|^include ~/.config/kitty/kitty-tokyo-theme/themes/tokyo_night_night.conf|# include ~/.config/kitty/kitty-tokyo-theme/themes/tokyo_night_night.conf|g' ~/.config/kitty/kitty.conf
  # sed -i '' 's|^# include ~/.config/kitty/kitty-tokyo-theme/themes/tokyo_night_day.conf|include ~/.config/kitty/kitty-tokyo-theme/themes/tokyo_night_day.conf|g' ~/.config/kitty/kitty.conf

  sed -i '' 's|^include ~/.config/kitty/kitty-themes/themes/gruvbox-dark.conf|# include ~/.config/kitty/kitty-themes/themes/gruvbox-dark.conf|g' ~/.config/kitty/kitty.conf
  sed -i '' 's|^# include ~/.config/kitty/kitty-themes/themes/gruvbox-light.conf|include ~/.config/kitty/kitty-themes/themes/gruvbox-light.conf|g' ~/.config/kitty/kitty.conf
  # 让 Kitty 自动重载配置 (发送 USR1 信号给所有 kitty 进程)
  kill -SIGUSR1 $(pgrep -a kitty | awk '{print $1}') 2>/dev/null

  # neovim
  # 发送给 Neovim 的指令：切换到亮色
  # NVIM_CMD="<Esc>:lua vim.cmd('colorscheme tokyonight-day')<CR>"
  # sed -i '' 's/^export NVIM_TOKYONIGHT_VARIANT=night/# export NVIM_TOKYONIGHT_VARIANT=night/g' ~/.zshrc
  # sed -i '' 's/^# export NVIM_TOKYONIGHT_VARIANT=light/export NVIM_TOKYONIGHT_VARIANT=light/g' ~/.zshrc
  # echo "day" > /tmp/nvim_variant

  NVIM_CMD="<Esc>:set background=light<CR>"
  # sed -i '' 's/^export NVIM_GRUVBOX_VARIANT=dark/# export NVIM_GRUVBOX_VARIANT=dark/g' ~/.zshrc
  # sed -i '' 's/^# export NVIM_GRUVBOX_VARIANT=light/export NVIM_GRUVBOX_VARIANT=light/g' ~/.zshrc
  sed -i '' 's/^export NVIM_BG=dark/# export NVIM_BG=dark/g' ~/.zshrc
  sed -i '' 's/^# export NVIM_BG=light/export NVIM_BG=light/g' ~/.zshrc
  echo "light" > /tmp/nvim_variant

  # zellij
  # cp ~/.config/zellij/layouts/template_light.kdl ~/.config/zellij/layouts/default.kdl
  # sed -i '' 's/theme ".*"/theme "pencil-light"/' ~/.config/zellij/config.kdl

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
  # tmux list-panes -a -F '#{pane_id}' | while read pane_id; do
  #   tmux send-keys -t "$pane_id" 'export NVIM_TOKYONIGHT_VARIANT=day' C-m
  # done

  # 查找并遍历所有活跃的 Neovim Sockets
  # macOS 的临时目录在 $TMPDIR，通常是 /var/folders/...
  # 我们查找名为 nvim.*.0 的 socket 文件
  find "${TMPDIR:-/tmp}/nvim.richard" -name "nvim.*.0" -type s 2>/dev/null | while read -r socket; do
      # 使用 --remote-send 发送按键序列
      # 2>/dev/null 屏蔽掉可能因为 socket 刚关闭导致的报错
      nvim --server "$socket" --remote-send "$NVIM_CMD" 2>/dev/null &
  done

  # Tmux
  # sed -i '' 's/^set -g @theme-style "night"/# set -g @theme-style "night"/g' ~/.tmux.conf
  # sed -i '' 's/^# set -g @theme-style "day"/set -g @theme-style "day"/g' ~/.tmux.conf

  sed -i '' 's/^set -g @theme-background "dark"/# set -g @theme-background "dark"/g' ~/.tmux.conf
  sed -i '' 's/^# set -g @theme-background "light"/set -g @theme-background "light"/g' ~/.tmux.conf
  tmux source-file ~/.tmux.conf \; display-message "Config reloaded..."

  echo '完成.'
  # 发送系统通知
  send_notification "主题切换完成" "已切换到 Light 模式 ☀️"

elif [[ $BACKGROUND == "dark" ]]; then
  # Dark Theme
  echo '切换主题配置...'
  # Kitty
  # sed -i '' 's|^include ~/.config/kitty/kitty-tokyo-theme/themes/tokyo_night_day.conf|# include ~/.config/kitty/kitty-tokyo-theme/themes/tokyo_night_day.conf|g' ~/.config/kitty/kitty.conf
  # sed -i '' 's|^# include ~/.config/kitty/kitty-tokyo-theme/themes/tokyo_night_night.conf|include ~/.config/kitty/kitty-tokyo-theme/themes/tokyo_night_night.conf|g' ~/.config/kitty/kitty.conf

  sed -i '' 's|^include ~/.config/kitty/kitty-themes/themes/gruvbox-light.conf|# include ~/.config/kitty/kitty-themes/themes/gruvbox-light.conf|g' ~/.config/kitty/kitty.conf
  sed -i '' 's|^# include ~/.config/kitty/kitty-themes/themes/gruvbox-dark.conf|include ~/.config/kitty/kitty-themes/themes/gruvbox-dark.conf|g' ~/.config/kitty/kitty.conf

  # 让 Kitty 自动重载配置
  kill -SIGUSR1 $(pgrep -a kitty | awk '{print $1}') 2>/dev/null

  # neovim
  # 发送给 Neovim 的指令：切换到暗色
  # NVIM_CMD="<Esc>:lua vim.cmd('colorscheme tokyonight-night')<CR>"
  # sed -i '' 's/^export NVIM_TOKYONIGHT_VARIANT=day/# export NVIM_TOKYONIGHT_VARIANT=day/g' ~/.zshrc
  # sed -i '' 's/^# export NVIM_TOKYONIGHT_VARIANT=night/export NVIM_TOKYONIGHT_VARIANT=night/g' ~/.zshrc
  # echo "night" > /tmp/nvim_variant

  NVIM_CMD="<Esc>:set background=dark<CR>"
  # sed -i '' 's/^export NVIM_GRUVBOX_VARIANT=light/# export NVIM_GRUVBOX_VARIANT=light/g' ~/.zshrc
  # sed -i '' 's/^# export NVIM_GRUVBOX_VARIANT=dark/export NVIM_GRUVBOX_VARIANT=dark/g' ~/.zshrc
  sed -i '' 's/^export NVIM_BG=light/# export NVIM_BG=light/g' ~/.zshrc
  sed -i '' 's/^# export NVIM_BG=dark/export NVIM_BG=dark/g' ~/.zshrc
  echo "dark" > /tmp/nvim_variant

  # zellij
  # cp ~/.config/zellij/layouts/template_dark.kdl ~/.config/zellij/layouts/default.kdl
  # sed -i '' 's/theme ".*"/theme "tokyo-night"/' ~/.config/zellij/config.kdl

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

  # # 更新已打开的 tmux 相关窗口面板参数
  # tmux list-panes -a -F '#{pane_id}' | while read pane_id; do
  #   tmux send-keys -t "$pane_id" 'export NVIM_TOKYONIGHT_VARIANT=night' C-m
  # done

  # 查找并遍历所有活跃的 Neovim Sockets
  # macOS 的临时目录在 $TMPDIR，通常是 /var/folders/...
  # 我们查找名为 nvim.*.0 的 socket 文件
  find "${TMPDIR:-/tmp}/nvim.richard" -name "nvim.*.0" -type s 2>/dev/null | while read -r socket; do
      # 使用 --remote-send 发送按键序列
      # 2>/dev/null 屏蔽掉可能因为 socket 刚关闭导致的报错
      nvim --server "$socket" --remote-send "$NVIM_CMD" 2>/dev/null &
  done

  # Tmux
  # sed -i '' 's/^set -g @theme-style "day"/# set -g @theme-style "day"/g' ~/.tmux.conf
  # sed -i '' 's/^# set -g @theme-style "night"/set -g @theme-style "night"/g' ~/.tmux.conf

  sed -i '' 's/^set -g @theme-background "light"/# set -g @theme-background "light"/g' ~/.tmux.conf
  sed -i '' 's/^# set -g @theme-background "dark"/set -g @theme-background "dark"/g' ~/.tmux.conf

  tmux source-file ~/.tmux.conf \; display-message "Config reloaded..."

  echo '完成.'
  # 发送系统通知
  send_notification "主题切换完成" "已切换到 Dark 模式 🌙"
else
  echo "参数错误，只能是 light | dark"
  exit 1
fi

