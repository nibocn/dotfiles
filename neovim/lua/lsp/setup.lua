local status, mason = pcall(require, 'mason')
if not status then
  vim.notify('没有找到 mason')
  return
end

mason.setup()

local status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status then
  vim.notify('没有找到 mason-lspconfig')
  return
end

mason_lspconfig.setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "sumneko_lua",
    "tsserver",
    "tailwindcss",
    "bashls",
    "cssls",
    "dockerls",
    "emmet_ls",
    "html",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "taplo",
    "yamlls",
    "gopls",
  },
})

local status, lspconfig = pcall(require, 'lspconfig')
if not status then
  vim.notify('没有找到 lspconfig')
  return
end

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local servers = {
  sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  -- bashls = require("lsp.config.bash"),
  pyright = require("lsp.config.pyright"),
  html = require("lsp.config.html"),
  cssls = require("lsp.config.css"),
  emmet_ls = require("lsp.config.emmet"),
  jsonls = require("lsp.config.json"),
  tsserver = require("lsp.config.typescript"),
  -- yamlls = require("lsp.config.yamlls"),
  -- dockerls = require("lsp.config.docker"),
  -- tailwindcss = require("lsp.config.tailwindcss"),
  rust_analyzer = require("lsp.config.rust"),
  -- taplo = require("lsp.config.taplo"), -- toml
  gopls = require("lsp.config.gopls"),
  -- -- remark_ls = require("lsp.config.markdown"),
  -- clangd = require("lsp.config.clangd"),
  -- cmake = require("lsp.config.cmake"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end
