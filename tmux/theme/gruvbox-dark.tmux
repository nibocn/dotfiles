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
set "status-style" "bg=black,fg=white"

#+-------+
#+ Panes +
#+-------+
set "pane-border-style" "bg=black,fg=white"
set "pane-active-border-style" "bg=black,fg=brightgreen"
set "display-panes-colour" "blue"
set "display-panes-active-colour" "brightblack"

#+------------+
#+ Clock Mode +
#+------------+
setw "clock-mode-colour" "cyan"

# bell
setw "window-status-bell-style" "bg=black,fg=cyan"

#+----------+
#+ Messages +
#+---------+
set "message-style" "bg=black,fg=cyan"
set "message-command-style" "bg=black,fg=cyan"

#+--------+
#+ Status +
#+--------+
#+--- Bars ---+
set "status-left" "#{?client_prefix,#[fg=black]#[bg=green] #S#[fg=green]#[bg=black],#[fg=black,bg=blue] #S#[fg=blue,bg=black]}"

set "status-right" "#[fg=brightblack,bg=black]#[fg=brightwhite,bg=brightblack] %a %m-%d %H:%M "

#+--- Windows ---+
set "window-status-format" "#[fg=black,bg=brightblack] #[fg=brightwhite,bg=brightblack]#I #[fg=brightwhite,bg=brightblack] #[fg=brightwhite,bg=brightblack]#W #F #[fg=brightblack,bg=black]"

set "window-status-current-format" "#[fg=black,bg=yellow] #[fg=black,bg=yellow]#I #[fg=black,bg=yellow] #[fg=black,bg=yellow]#W #F #[fg=yellow,bg=black]"

set "window-status-separator" ""
