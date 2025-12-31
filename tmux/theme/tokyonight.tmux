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
    fg_color="#4f97f5"
    bg2_color="#a8aecb"
    fg2_color="#5981b5"
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

#+------------+
#+ Clock Mode +
#+------------+
setw "clock-mode-colour" "cyan"

# bell
setw "window-status-bell-style" "bg=$bg_color,fg=cyan"

#+----------+
#+ Messages +
#+---------+
tmux_set "message-style" "bg=$bg2_color,fg=$fg_color"
tmux_set "message-command-style" "bg=$bg2_color,fg=$fg_color"


#+-------+
#+ Panes +
#+-------+
tmux_set "pane-border-style" "fg=$fg2_color"
tmux_set "pane-active-border-style" "fg=$fg_color"

#+--- Bars ---+
tmux_set "status-left" "#{?client_prefix,#[fg=$bg_color]#[bg=magenta] #S #[fg=magenta]#[bg=$bg_color],#[fg=$bg_color]#[bg=$fg_color]#[bold] #S #[fg=$fg_color]#[bg=$bg_color]}"
tmux_set "status-right" "#{?pane_in_mode,#[fg=cyan]#[bg=$bg_color]#[fg=$bg_color]#[bg=cyan] Copy #[fg=$bg_color]#[bg=cyan],}#[fg=$bg2_color,bg=$bg_color]#[fg=$fg_color,bg=$bg2_color] %a %m-%d %H:%M "

#+--- Windows ---+
tmux_set "window-status-format" "#[fg=$bg_color,bg=$bg2_color] #[fg=LightSlateGray,bg=$bg2_color]#I #[fg=LightSlateGray,bg=$bg2_color] #[fg=LightSlateGray,bg=$bg2_color]#W #F #[fg=$bg2_color,bg=$bg_color]"
tmux_set "window-status-current-format" "#[fg=$bg_color,bg=$bg2_color]#[fg=$fg_color,bg=$bg2_color,bold] #I  #W #F #[fg=$bg2_color,bg=$bg_color]"
tmux_set "window-status-separator" ""
