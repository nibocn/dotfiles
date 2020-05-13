#!/usr/bin/env bash

bg_color="#3c474d"
fg_color="#586268"

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
setw "clock-mode-colour" "blue"

# bell
# set-window-option -g window-status-bell-style bg=black,fg=cyan

#+----------+
#+ Messages +
#+---------+
set "message-style" "bg=$bg_color, fg=blue"
set "message-command-style" "bg=$bg_color, fg=blue"

#+--------+
#+ Status +
#+--------+
#+--- Bars ---+
set "status-left" "#{?client_prefix,#[fg=$bg_color]#[bg=magenta] #S #[fg=magenta]#[bg=$bg_color],#[fg=$bg_color,bg=green] #S #[fg=green,bg=$bg_color]}"

set "status-right" "#[fg=$fg_color,bg=$bg_color]#[fg=white,bg=$fg_color] %a %m-%d %H:%M "

# #+--- Windows ---+
set "window-status-format" "#[fg=$bg_color,bg=$fg_color] #[fg=white,bg=$fg_color]#I #[fg=white,bg=$fg_color] #[fg=white,bg=$fg_color]#W #F #[fg=$fg_color,bg=$bg_color]"
set "window-status-current-format" "#[fg=$bg_color,bg=blue] #[fg=$bg_color,bg=blue]#I #[fg=$bg_color,bg=blue,nobold] #[fg=$bg_color,bg=blue]#W #F #[fg=blue,bg=$bg_color]"
# set -g window-status-separator ""
