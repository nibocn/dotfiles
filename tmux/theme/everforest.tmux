#!/usr/bin/env bash

theme_option="@theme"
default_theme="everforest"

background_option="@theme-background"
default_background="dark"

style_option="@theme-style"
default_style="default"

# dark default
bg_color="#374247"
fg_color="#4a555b"


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
    if [[ $style == "default" ]]; then
      bg_color="#374247"
      fg_color="#4a555b"
    elif [[ $style == "soft" ]]; then
      bg_color="#3c474d"
      fg_color="#505a60"
    elif [[ $style == "hard" ]]; then
      bg_color="#323c41"
      fg_color="#445055"
    fi
  else
    if [[ $style == "default" ]]; then
      bg_color="#f2efdc"
      fg_color="#e4e1cd"
    elif [[ $style == "soft" ]]; then
      bg_color="#eeead6"
      fg_color="#e0ddcb"
    elif [[ $style == "hard" ]]; then
      bg_color="#f7f4e2"
      fg_color="#e9e7d4"
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
set "status-style" "bg=$bg_color,fg=$fg_color"

#+-------+
#+ Panes +
#+-------+
set "pane-border-style" "fg=$fg_color"
set "pane-active-border-style" "fg=cyan"
set "display-panes-colour" "green"
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
set "status-left" "#{?client_prefix,#[fg=black]#[bg=magenta] #S #[fg=magenta]#[bg=$bg_color],#[fg=black,bg=green] #S #[fg=green,bg=$bg_color]}"

set "status-right" "#{?pane_in_mode,#[fg=cyan]#[bg=$bg_color]#[fg=black]#[bg=cyan] Copy #[fg=$bg_color]#[bg=cyan],}#[fg=$fg_color,bg=$bg_color]#[fg=LightSlateGray,bg=$fg_color] %a %m-%d %H:%M "

#+--- Windows ---+
set "window-status-format" "#[fg=$bg_color,bg=$fg_color] #[fg=LightSlateGray,bg=$fg_color]#I #[fg=LightSlateGray,bg=$fg_color] #[fg=LightSlateGray,bg=$fg_color]#W #F #[fg=$fg_color,bg=$bg_color]"

set "window-status-current-format" "#[fg=$bg_color,bg=DarkGray] #[fg=black,bg=DarkGray]#I #[fg=black,bg=DarkGray] #[fg=black,bg=DarkGray]#W #F #[fg=DarkGray,bg=$bg_color]"

set "window-status-separator" ""

