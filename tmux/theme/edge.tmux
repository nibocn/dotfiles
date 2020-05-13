#!/usr/bin/env bash

theme_option="@theme"
default_theme="edge"

background_option="@theme-background"
default_background="dark"

style_option="@theme-style"
default_style="default"

# dark default
bg_color="#30323a"
fg_color="#414550"
font_fg_color="black"

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
  background="$(get_tmux_option "$background_option" "$default_background")"
  style="$(get_tmux_option "$style_option" "$default_style")"
  if [[ $background == "dark" ]]; then
    font_fg_color="white"
    if [[ $style == "default" ]]; then
      bg_color="#30323a"
      fg_color="#414550"
    elif [[ $style == "aura" ]]; then
      bg_color="#2f323e"
      fg_color="#404555"
    elif [[ $style == "neon" ]]; then
      bg_color="#2f3242"
      fg_color="#3f455a"
    fi
  else
    font_fg_color="black"
    if [[ $style == "default" ]]; then
      bg_color="#eef1f4"
      fg_color="#dde2e7"
    fi
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

#+-------+
#+ Panes +
#+-------+
set "pane-border-style" "fg=$fg_color"
set "pane-active-border-style" "fg=cyan"
set "display-panes-colour" "blue"
set "display-panes-active-colour" "brightblack"

#+------------+
#+ Clock Mode +
#+------------+
setw "clock-mode-colour" "cyan"

# bell
setw "window-status-bell-style" "bg=$bg_color,fg=cyan"

#+----------+
#+ Messages +
#+---------+
set "message-style" "bg=$bg_color,fg=cyan"
set "message-command-style" "bg=$bg_color,fg=cyan"

#+--------+
#+ Status +
#+--------+

#+--- Bars ---+
set "status-left" "#{?client_prefix,#[fg=$bg_color]#[bg=magenta] #S #[fg=magenta]#[bg=$bg_color],#[fg=$bg_color,bg=green] #S #[fg=green,bg=$bg_color]}"

set "status-right" "#[fg=$fg_color,bg=$bg_color]#[fg=$font_fg_color,bg=$fg_color] %a %m-%d %H:%M "

#+--- Windows ---+
set "window-status-format" "#[fg=$bg_color,bg=$fg_color] #[fg=$font_fg_color,bg=$fg_color]#I #[fg=$font_fg_color,bg=$fg_color] #[fg=$font_fg_color,bg=$fg_color]#W #F #[fg=$fg_color,bg=$bg_color]"

set "window-status-current-format" "#[fg=$bg_color,bg=brightblue] #[fg=$fg_color,bg=brightblue]#I #[fg=$fg_color,bg=brightblue] #[fg=$fg_color,bg=brightblue]#W #F #[fg=brightblue,bg=$bg_color]"

set "window-status-separator" ""
