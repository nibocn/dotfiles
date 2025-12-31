#!/usr/bin/env bash

theme_option="@theme"
default_theme="gruvbox"

background_option="@theme-background"
default_background="dark"

style_option="@theme-style"
default_style="default"

# dark default
bg_color="#32302f"
fg_color="#5a524d"


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
  local background
  local style
  background="$(get_tmux_option "$background_option" "$default_background")"
  style="$(get_tmux_option "$style_option" "$default_style")"
  if [[ $background == "dark" ]]; then
    if [[ $style == "default" ]]; then
      bg_color="#32302f"
      fg_color="#5a524d"
    elif [[ $style == "soft" ]]; then
      bg_color="#3c3836"
      fg_color="#665c55"
    elif [[ $style == "hard" ]]; then
      bg_color="#282828"
      fg_color="#504945"
    fi
  else
    if [[ $style == "default" ]]; then
      bg_color="#f2e5be"
      fg_color="#e5d5af"
    elif [[ $style == "soft" ]]; then
      bg_color="#ebdbb4"
      fg_color="#dac9a7"
    elif [[ $style == "hard" ]]; then
      bg_color="#f3eac9"
      fg_color="#eee0b9"
    fi

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
tmux_set "status-style" "bg=$bg_color,fg=$fg_color"

#+-------+
#+ Panes +
#+-------+
tmux_set "pane-border-style" "fg=$fg_color"
tmux_set "pane-active-border-style" "fg=cyan"
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
tmux_set "status-left" "#{?client_prefix,#[fg=black]#[bg=green] #S #[fg=green]#[bg=$bg_color],#[fg=black]#[bg=blue] #S #[fg=blue]#[bg=$bg_color]}"

tmux_set "status-right" "#{?pane_in_mode,#[fg=cyan]#[bg=$bg_color]#[fg=black]#[bg=cyan] Copy #[fg=$bg_color]#[bg=cyan],}#[fg=$fg_color,bg=$bg_color]#[fg=white,bg=$fg_color] %a %m-%d %H:%M "

#+--- Windows ---+
tmux_set "window-status-format" "#[fg=$bg_color,bg=$fg_color] #[fg=white,bg=$fg_color]#I #[fg=white,bg=$fg_color] #[fg=white,bg=$fg_color]#W #F #[fg=$fg_color,bg=$bg_color]"

tmux_set "window-status-current-format" "#[fg=$bg_color,bg=yellow] #[fg=black,bg=yellow]#I #[fg=black,bg=yellow] #[fg=black,bg=yellow]#W #F #[fg=yellow,bg=$bg_color]"

tmux_set "window-status-separator" ""
