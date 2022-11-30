local wezterm = require 'wezterm';

return {
  -- 禁用检查更新
  check_for_updates = false,
  -- front_end = "OpenGL",
  font = wezterm.font_with_fallback({
    "mononoki Nerd Font + ",
    "mononoki Nerd Font + ",
  }),
  font_size = 12.0,
  -- 当只有一个 tab 页签时隐藏
  hide_tab_bar_if_only_one_tab = true,
  -- 隐藏 window 窗体相关关闭、最小化等按钮，并可调整大小
  window_decorations = "RESIZE",
  color_scheme = 'everforest-dark',
  -- color_scheme = 'everforest-light',

  keys = {
    -- 解决 tmux ctrl+q 要按两次才能生效生效的问题
    { mods = "CTRL", key = "q", action=wezterm.action{ SendString="\x11" } },
  },

  color_schemes = {
    ["everforest-light"] = {
      foreground = "#5c6a72",
      background = "#fdf6e3",
      cursor_bg = "#5c6a72",
      cursor_fg = "#81b28b",
      selection_bg = "#7697aa",
      selection_fg = "#333d42",

      ansi = {"#333d42", "#f85552", "#8da101", "#dfa000", "#3a94c5", "#d699b6", "#829181", "#acb3bd"},
      brights = {"#c2c4bf", "#f85552", "#8da101", "#dfa000", "#3a94c5", "#d699b6", "#829181", "#acb3bd"},
    },
    ["everforest-light-hard"] = {
      foreground = "#5c6a72",
      background = "#fff9e8",
      cursor_bg = "#5c6a72",
      cursor_fg = "#81b28b",
      selection_bg = "#7697aa",
      selection_fg = "#333d42",

      ansi = {"#333d42", "#f85552", "#8da101", "#dfa000", "#3a94c5", "#d699b6", "#829181", "#acb3bd"},
      brights = {"#c2c4bf", "#f85552", "#8da101", "#dfa000", "#3a94c5", "#d699b6", "#829181", "#acb3bd"},
    },
    ["everforest-light-soft"] = {
      foreground = "#5c6a72",
      background = "#f8f0dc",
      cursor_bg = "#5c6a72",
      cursor_fg = "#81b28b",
      selection_bg = "#7697aa",
      selection_fg = "#333d42",

      ansi = {"#333d42", "#f85552", "#8da101", "#dfa000", "#3a94c5", "#d699b6", "#829181", "#acb3bd"},
      brights = {"#c2c4bf", "#f85552", "#8da101", "#dfa000", "#3a94c5", "#d699b6", "#829181", "#acb3bd"},
    },
    ["everforest-dark"] = {
      foreground = "#d3c6aa",
      background = "#2f383e",
      cursor_bg = "#d3c6aa",
      cursor_fg = "#2b2d3a",
      selection_bg = "#d3c6aa",
      selection_fg = "#627183",

      ansi = {"#2f383e", "#e67e80", "#a7c080", "#dbbc7f", "#7fbbb3", "#d699b6", "#9da9a0", "#acb3bd"},
      brights = {"#627183", "#e67e80", "#a7c080", "#dbbc7f", "#7fbbb3", "#d699b6", "#9da9a0", "#acb3bd"},
    },
    ["everforest-dark-hard"] = {
      foreground = "#d3c6aa",
      background = "#2b3339",
      cursor_bg = "#d3c6aa",
      cursor_fg = "#2b2d3a",
      selection_bg = "#d3c6aa",
      selection_fg = "#627183",

      ansi = {"#2f383e", "#e67e80", "#a7c080", "#dbbc7f", "#7fbbb3", "#d699b6", "#9da9a0", "#acb3bd"},
      brights = {"#627183", "#e67e80", "#a7c080", "#dbbc7f", "#7fbbb3", "#d699b6", "#9da9a0", "#acb3bd"},
    },
    ["everforest-dark-soft"] = {
      foreground = "#d3c6aa",
      background = "#323d43",
      cursor_bg = "#d3c6aa",
      cursor_fg = "#2b2d3a",
      selection_bg = "#d3c6aa",
      selection_fg = "#627183",

      ansi = {"#2f383e", "#e67e80", "#a7c080", "#dbbc7f", "#7fbbb3", "#d699b6", "#9da9a0", "#acb3bd"},
      brights = {"#627183", "#e67e80", "#a7c080", "#dbbc7f", "#7fbbb3", "#d699b6", "#9da9a0", "#acb3bd"},
    },
    ["edge-dark"] = {
      foreground = "#c5cdd9",
      background = "#2c2e34",
      cursor_bg = "#c5cdd9",
      cursor_fg = "#2c2e34",
      selection_bg = "#c5cdd9",
      selection_fg = "#627183",

      ansi = {"#3e4249", "#ec7279", "#a0c980", "#deb974", "#6cb6eb", "#d38aea", "#5dbbc1", "#c5cdd9"},
      brights = {"#616976", "#ec7279", "#a0c980", "#deb974", "#6cb6eb", "#d38aea", "#5dbbc1", "#c5cdd9"},
    },
    ["edge-dark-aura"] = {
      foreground = "#c5cdd9",
      background = "#2b2d37",
      cursor_bg = "#c5cdd9",
      cursor_fg = "#2b2d37",
      selection_bg = "#c5cdd9",
      selection_fg = "#627183",

      ansi = {"#363a49", "#ec7279", "#a0c980", "#deb974", "#6cb6eb", "#d38aea", "#5dbbc1", "#c5cdd9"},
      brights = {"#656c87", "#ec7279", "#a0c980", "#deb974", "#6cb6eb", "#d38aea", "#5dbbc1", "#c5cdd9"},
    },
    ["edge-dark-neon"] = {
      foreground = "#c5cdd9",
      background = "#2b2d3a",
      cursor_bg = "#c5cdd9",
      cursor_fg = "#2b2d3a",
      selection_bg = "#c5cdd9",
      selection_fg = "#627183",

      ansi = {"#363a4e", "#ec7279", "#a0c980", "#deb974", "#6cb6eb", "#d38aea", "#5dbbc1", "#c5cdd9"},
      brights = {"#627183", "#ec7279", "#a0c980", "#deb974", "#6cb6eb", "#d38aea", "#5dbbc1", "#c5cdd9"},
    },
    ["edge-dark-light"] = {
      foreground = "#4b505b",
      background = "#fafafa",
      cursor_bg = "#4b505b",
      cursor_fg = "#fafafa",
      selection_bg = "#c5cdd9",
      selection_fg = "#627183",

      ansi = {"#4b505b", "#d05858", "#608e32", "#deb974", "#6cb6eb", "#b05ccc", "#3a8b84", "#bac0b3"},
      brights = {"#727478", "#d05858", "#608e32", "#deb974", "#6cb6eb", "#b05ccc", "#3a8b84", "#dadada"},
    },
    ["gruvbox-dark"] = {
      foreground = "#ebdbb2",
      background = "#282828",
      cursor_bg = "#ebdbb2",
      cursor_fg = "#282828",
      selection_bg = "#ebdbb2",
      selection_fg = "#928374",

      ansi = {"#282828", "#ce332d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984"},
      brights = {"#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2"},
    },
    ["gruvbox-dark-hard"] = {
      foreground = "#ebdbb2",
      background = "#1d2021",
      cursor_bg = "#ebdbb2",
      cursor_fg = "#1d2021",
      selection_bg = "#ebdbb2",
      selection_fg = "#928374",

      ansi = {"#1d2021", "#ce332d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984"},
      brights = {"#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2"},
    },
    ["gruvbox-dark-soft"] = {
      foreground = "#ebdbb2",
      background = "#32302f",
      cursor_bg = "#ebdbb2",
      cursor_fg = "#32302f",
      selection_bg = "#ebdbb2",
      selection_fg = "#928374",

      ansi = {"#32302f", "#ce332d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984"},
      brights = {"#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2"},
    },
    ["gruvbox-light"] = {
      foreground = "#3c3836",
      background = "#fbf1c7",
      cursor_bg = "#3c3836",
      cursor_fg = "#fbf1c7",
      selection_bg = "#3c3836",
      selection_fg = "#c7b7a8",

      ansi = {"#fbf1c7", "#ce332d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#7c6f64"},
      brights = {"#928374", "#9d0006", "#79740e", "#b57614", "#076678", "#8f3f71", "#427b58", "#3c3836"},
    },
    ["gruvbox-light-hard"] = {
      foreground = "#3c3836",
      background = "#f9f5d7",
      cursor_bg = "#3c3836",
      cursor_fg = "#f9f5d7",
      selection_bg = "#3c3836",
      selection_fg = "#c7b7a8",

      ansi = {"#f9f5d7", "#ce332d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#7c6f64"},
      brights = {"#928374", "#9d0006", "#79740e", "#b57614", "#076678", "#8f3f71", "#427b58", "#3c3836"},
    },
    ["gruvbox-light-soft"] = {
      foreground = "#3c3836",
      background = "#f2e5bc",
      cursor_bg = "#3c3836",
      cursor_fg = "#f2e5bc",
      selection_bg = "#3c3836",
      selection_fg = "#c7b7a8",

      ansi = {"#f2e5bc", "#ce332d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#7c6f64"},
      brights = {"#928374", "#9d0006", "#79740e", "#b57614", "#076678", "#8f3f71", "#427b58", "#3c3836"},
    },
  },
}
