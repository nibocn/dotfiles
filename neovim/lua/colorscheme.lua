local colorscheme = "everforest"

-- vim.g['everforest_disable_italic_comment'] = 1
-- vim.g['everforest_enable_italic'] = 0

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. "没有找到！")
  return
end

