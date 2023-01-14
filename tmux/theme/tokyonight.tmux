#!/usr/bin/env bash

# TokyoNight colors for Tmux
theme_option="@theme"
default_theme="tokyonight"

# background_option="@theme-background"
# default_background="dark"

style_option="@theme-style"
default_style="storm"

# dark default
bg_color="#1f2335"
fg_color="#7aa2f7"
bg2_color="#3b4261"
fg2_color="#3b4261"
# font_fg_color="black"

get_tmux_option() {
  local option_name="$1"
  local default_value="$2"

  local option_value
  option_value="$(tmux show-option -gqv "$option_name")"

  if [[ -z "$option_value" ]]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}
set() {
  local option=$1
  local value=$2

  tmux set-option -gq "$option" "$value"
}

setw() {
  local option=$1
  local value=$2

  tmux set-window-option -gq "$option" "$value"
}

diff_custom() {
  local background
  local style
  style="$(get_tmux_option "$style_option" "$default_style")"
  if [[ $style == "storm" ]]; then
    bg_color="#1f2335"
    fg_color="#7aa2f7"
  elif [[ $style == "night" ]]; then
    bg_color="#16161e"
    fg_color="#7aa2f7"
  elif [[ $style == "moon" ]]; then
    bg_color="#1e2030"
    fg_color="#82aaff"
  elif [[ $style == "day" ]]; then
    bg_color="#e9e9ec"
    fg_color="#2e7de9"
    bg2_color="#a8aecb"
    fg2_color="#2e7de9"
  fi
}

diff_custom

#+---------+
#+ Options +
#+---------+
set "status" "on"

#+--------+
#+ Status +
#+--------+
#+--- Layout ---+
set "status-justify" "left"

#+--- Colors ---+
set "status-style" "bg=$bg_color, fg=$fg_color"

#+----------+
#+ Messages +
#+---------+
set "message-style" "bg=$bg2_color,fg=$fg_color"
set "message-command-style" "bg=$bg2_color,fg=$fg_color"


set "pane-border-style" "fg=$fg2_color"
set "pane-active-border-style" "fg=$fg_color"

#+--- Bars ---+
set "status-left" "#{?client_prefix,#[fg=$bg_color]#[bg=magenta] #S #[fg=magenta]#[bg=$bg_color],#[fg=$bg_color,bg=$fg_color,bold] #S #[fg=$fg_color,bg=$bg_color]}"
set "status-right" "#{?pane_in_mode,#[fg=cyan]#[bg=$bg_color]#[fg=$bg_color]#[bg=cyan] Copy #[fg=$bg_color]#[bg=cyan],}#[fg=$bg2_color,bg=$bg_color]#[fg=$fg_color,bg=$bg2_color] %a %m-%d %H:%M "

#+--- Windows ---+
set "window-status-format" "#[fg=$bg_color,bg=$bg_color]#[fg=default,bg=$bg_color] #I  #W #F #[fg=$bg_color,bg=$bg_color]"
set "window-status-current-format" "#[fg=$bg_color,bg=$bg2_color]#[fg=$fg_color,bg=$bg2_color,bold] #I  #W #F #[fg=$bg2_color,bg=$bg_color]"
set "window-status-separator" ""
