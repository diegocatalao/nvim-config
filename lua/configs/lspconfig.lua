require("nvchad.configs.lspconfig").defaults()

local servers = {
  "lua_ls",
  "bashls",
  "pyright",
  "html",
  "cssls",
  "clangd",
  "rust_analyzer",
  "gopls",
  "zls",
  "asm_lsp",
  "dockerls",
  "yamlls",
  "jsonls",
  "cmake",
  "taplo",
}

vim.lsp.enable(servers)
