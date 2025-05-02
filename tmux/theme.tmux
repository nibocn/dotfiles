#!/usr/bin/env bash

theme_option="@theme"
default_theme="tokyonight"

# background_option="@theme-background"
# default_background="dark"

style_option="@theme-style"
default_style="night"

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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

main() {
  local theme
  local background
  local file

  theme="$(get_tmux_option "$theme_option" "$default_theme")"
  file="$CURRENT_DIR/theme/$theme.tmux"

  if [[ -f "$file" ]]; then
    tmux run-shell "$file"
  else
    echo "Error! Theme not found"
  fi

}
main
