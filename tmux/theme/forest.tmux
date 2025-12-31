#!/usr/bin/env bash

bg_color="#3c474d"
fg_color="#586268"

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
tmux_set "pane-active-border-style" "fg=cyan"
tmux_set "display-panes-colour" "blue"
tmux_set "display-panes-active-colour" "brightblack"

#+------------+
#+ Clock Mode +
#+------------+
setw "clock-mode-colour" "blue"

# bell
# set-window-option -g window-status-bell-style bg=black,fg=cyan

#+----------+
#+ Messages +
#+---------+
tmux_set "message-style" "bg=$bg_color, fg=blue"
tmux_set "message-command-style" "bg=$bg_color, fg=blue"

#+--------+
#+ Status +
#+--------+
#+--- Bars ---+
tmux_set "status-left" "#{?client_prefix,#[fg=$bg_color]#[bg=magenta] #S #[fg=magenta]#[bg=$bg_color],#[fg=$bg_color]#[bg=green] #S #[fg=green]#[bg=$bg_color]}"

tmux_set "status-right" "#{?pane_in_mode,#[fg=yellow]#[bg=$bg_color]#[fg=$bg_color]#[bg=yellow] Copy #[fg=$bg_color]#[bg=yellow],}#[fg=$fg_color,bg=$bg_color]#[fg=white,bg=$fg_color] %a %m-%d %H:%M "

# #+--- Windows ---+
tmux_set "window-status-format" "#[fg=$bg_color,bg=$fg_color] #[fg=white,bg=$fg_color]#I #[fg=white,bg=$fg_color] #[fg=white,bg=$fg_color]#W #F #[fg=$fg_color,bg=$bg_color]"
tmux_set "window-status-current-format" "#[fg=$bg_color,bg=blue] #[fg=$bg_color,bg=blue]#I #[fg=$bg_color,bg=blue,nobold] #[fg=$bg_color,bg=blue]#W #F #[fg=blue,bg=$bg_color]"
# tmux_set -g window-status-separator ""
