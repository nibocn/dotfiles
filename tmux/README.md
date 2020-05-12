# Tmux
## 主题
> 目前有 4 类大的主题：edge、gruvbox、sonokai、forest，这 4 类主题需要配合相应的终端（iTerm2、alacritty）主题进行使用。

可以在 `~/.tmux.conf` 文件中定义 `@theme`、`@theme-background`、`@theme-style`  3 个变量进行主题的相应切换，如：

```conf
# set -g @theme "gruvbox"
# set -g @theme-background "dark"
# set -g @theme-style "default"
# set -g @theme-style "soft"
# set -g @theme-style "hard"

# set -g @theme-background "light"
# set -g @theme-style "default"
# set -g @theme-style "soft"
# set -g @theme-style "hard"

# set -g @theme "forest"

# set -g @theme "edge"
# set -g @theme-background "dark"
# set -g @theme-style "default"
# set -g @theme-style "neon"
# set -g @theme-style "aura"

# set -g @theme-background "light"
# set -g @theme-style "default"

set -g @theme "sonokai"
# set -g @theme-style "shusia"
# set -g @theme-style "andromeda"
set -g @theme-style "atlantis"
# set -g @theme-style "maia"

source ~/.local/dotfiles/tmux/tmux.conf
```

## 致谢

- [Gruvbox Material](https://github.com/sainnhe/gruvbox-material)
- [Forest Night](https://github.com/sainnhe/forest-night)
- [Sonokai](https://github.com/sainnhe/sonokai)
- [Edge](https://github.com/sainnhe/edge)

  _感谢 @sainnhe  提供了这么多丰富和优秀的主题_


- [Tmux theme](https://github.com/dweidner/tmux-theme)
- [Tmux Onedark Theme](https://github.com/odedlaz/tmux-onedark-theme)

  _感谢这两个项目从中学到了一些关于 tmux 主题的定义和优化_

