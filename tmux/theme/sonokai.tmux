#!/usr/bin/env bash

style_option="@theme-style"
default_style="atlantis"

# shusia
bg_color="#343136"
fg_color="#49464e"

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

tmux_set() {
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
  local style
  style="$(get_tmux_option "$style_option" "$default_style")"
  if [[ $style == "shusia" ]]; then
    bg_color="#343136"
    fg_color="#49464e"
  elif [[ $style == "andromeda" ]]; then
    bg_color="#2f323e"
    fg_color="#404555"
  elif [[ $style == "atlantis" ]]; then
    bg_color="#303541"
    fg_color="#434c5b"
  elif [[ $style == "maia" ]]; then
    bg_color="#2e383e"
    fg_color="#424b53"
  fi
}

diff_custom

#+---------+
#+ Options +
#+---------+
tmux_set "status" "on"

#+--------+
#+ Status +
#+--------+
#+--- Layout ---+
tmux_set "status-justify" "left"

#+--- Colors ---+
tmux_set "status-style" "bg=$bg_color, fg=$fg_color"

#+-------+
#+ Panes +
#+-------+
tmux_set "pane-border-style" "fg=$fg_color"
tmux_set "pane-active-border-style" "fg=blue"
tmux_set "display-panes-colour" "blue"
tmux_set "display-panes-active-colour" "brightblack"

#+------------+
#+ Clock Mode +
#+------------+
setw "clock-mode-colour" "cyan"

# bell
setw "window-status-bell-style" "bg=$bg_color,fg=cyan"

#+----------+
#+ Messages +
#+---------+
tmux_set "message-style" "bg=$bg_color,fg=cyan"
tmux_set "message-command-style" "bg=$bg_color,fg=cyan"

#+--------+
#+ Status +
#+--------+
#+--- Bars ---+
tmux_set "status-left" "#{?client_prefix,#[fg=black]#[bg=magenta] #S #[fg=magenta]#[bg=$bg_color],#[fg=black]#[bg=green] #S #[fg=green]#[bg=$bg_color]}"

tmux_set "status-right" "#{?pane_in_mode,#[fg=blue]#[bg=$bg_color]#[fg=black]#[bg=blue] Copy #[fg=$bg_color]#[bg=blue],}#[fg=$fg_color,bg=$bg_color]#[fg=white,bg=$fg_color] %a %m-%d %H:%M "

#+--- Windows ---+
tmux_set "window-status-format" "#[fg=$bg_color,bg=$fg_color] #[fg=white,bg=$fg_color]#I #[fg=white,bg=$fg_color] #[fg=white,bg=$fg_color]#W #F #[fg=$fg_color,bg=$bg_color]"

tmux_set "window-status-current-format" "#[fg=$bg_color,bg=cyan] #[fg=black,bg=cyan]#I #[fg=black,bg=cyan] #[fg=black,bg=cyan]#W #F #[fg=cyan,bg=$bg_color]"
tmux_set "window-status-separator" ""
