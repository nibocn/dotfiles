# Gruvbox Terminal.app — 块状光标对比度优化版 (v3)

仅修改 macOS Terminal.app 描述文件的 `CursorColor`，不改 Vim/Neovim、光标形状或 Gruvbox ANSI 色板。原有背景、默认字体色、选区及其他配置不变。

- Gruvbox Dark: `#458588` (Gruvbox 中蓝)，默认文字 `#EBDBB2`，背景 `#282828`
- Gruvbox Light: `#928374` (Gruvbox 中灰棕)，默认文字 `#3C3836`，背景 `#FBF1C7`

这次不采用亮奶油色/深黑色作为块状光标，因为 Terminal.app 里被光标覆盖的字符可能保持原本的语法高亮色，导致两者无法分辨。使用中间亮度的光标，在背景和默认文字之间取得更均衡的对比。但不能保证所有语法高亮色都与光标有高对比度。

## 已安装并使用自动切换脚本：推荐直接修改现有 Profile

1. 打开 Terminal.app -> 设置 -> 描述文件 -> Gruvbox Dark -> 文字 -> 光标 -> 颜色，改为 `#458588`。
2. 在 Gruvbox Light 中改为 `#928374`。
3. 保持原 Profile 名称不变。原 `switch-theme.sh` 按名称切换，不必修改。

## 若需要重新导入文件

通过 Terminal.app -> 设置 -> 描述文件 -> 导入 两个 `.terminal` 文件。内部名称仍是 `Gruvbox Dark` / `Gruvbox Light`。

注意：若已有同名主题，直接导入可能产生重复项或被 macOS 重命名。请备份后替换旧 Profile，或优先采用上面的手工改色方案。

原始 Gruvbox 色板：https://github.com/morhetz/gruvbox
