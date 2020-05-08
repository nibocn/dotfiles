#!/usr/bin/env bash

theme_option="@theme"
default_theme="edge"

background_option="@theme-background"
default_background="dark"

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
  background="$(get_tmux_option "$background_option" "$default_background")"
  file="$CURRENT_DIR/theme/$theme-$background.conf"

  if [[ -f "$file" ]]; then
    tmux source-file "$file"
  else
    echo "Error! Theme not found"
  fi

}
main
