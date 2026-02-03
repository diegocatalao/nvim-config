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

vim.lsp.config('rust_analyzer', {
  cmd = { "rustup", "run", "1.88.0", "rust-analyzer" },
  root_markers = { 'Cargo.toml' },
})

vim.lsp.config('pyright', {
  root_markers = { 'pyproject.toml', 'pyrightconfig.json' },
  settings = {
    python = {
      pythonPath = vim.fn.trim(vim.fn.system('poetry env info -e 2>/dev/null')) or nil,
    },
  },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function()
    vim.lsp.enable('rust_analyzer')
  end,
})

vim.lsp.enable(servers)
