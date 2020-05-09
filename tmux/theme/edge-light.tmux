#!/usr/bin/env bash

bg_color="#eef1f4"
fg_color="#dee2e6"

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
set "pane-border-style" "fg=black"
set "pane-active-border-style" "fg=cyan"
set "display-panes-colour" "blue"
set "display-panes-active-colour" "brightblack"

#+------------+
#+ Clock Mode +
#+------------+
setw "clock-mode-colour" "black"

# bell
setw "window-status-bell-style" "bg=white,fg=cyan"

#+----------+
#+ Messages +
#+---------+
set "message-style" "bg=$bg_color,fg=cyan"
set "message-command-style" "bg=$bg_color,fg=cyan"

#+--------+
#+ Status +
#+--------+
#+--- Bars ---+
set "status-left" "#{?client_prefix,#[fg=white]#[bg=yellow] #S#[fg=yellow]#[bg=$bg_color],#[fg=white,bg=brightgreen] #S#[fg=brightgreen,bg=$bg_color]}"

set "status-right" "#[fg=$fg_color,bg=$bg_color]#[fg=black,bg=$fg_color] %a %m-%d %H:%M "

#+--- Windows ---+
set "window-status-format" "#[fg=$bg_color,bg=$fg_color] #[fg=black,bg=$fg_color]#I #[fg=black,bg=$fg_color] #[fg=black,bg=$fg_color]#W #F #[fg=$fg_color,bg=$bg_color]"

set "window-status-current-format" "#[fg=white,bg=brightblue] #[fg=white,bg=brightblue]#I #[fg=white,bg=brightblue] #[fg=white,bg=brightblue]#W #F #[fg=brightblue,bg=white]"

set "window-status-separator" ""
