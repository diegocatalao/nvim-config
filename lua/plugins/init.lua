return {
  { import = "nvchad.blink.lazyspec" },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
    },
  },
  -- i just want this to select one or more lines
  -- good for lazy minds like myself
  {
    "mg979/vim-visual-multi",
    event = "BufReadPost",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
      }
    end,
  },
  --
  -- gitgraph to see the branches like gitkraken
  -- nice to visualize the connections between feat, dev and main
  -- i just like to see the git history in a visual way
  {
    "isakbm/gitgraph.nvim",
    dependencies = { "sindrets/diffview.nvim" },
    keys = {
      {
        "<leader>gl",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "Git graph",
      },
    },
    opts = {
      symbols = {
        merge_commit = "M",
        commit = "*",
      },
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
    },
  },
  --
  -- gitsigns to see the author and commit in the current line
  -- i like to see who wrote the shit in the code
  -- blame is always nice to have
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup {
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 300,
          virt_text_pos = "eol",
        },
        current_line_blame_formatter = "<author>, <author_time:%d/%m/%Y> - <summary>",
      }
    end,
  },
  --
  -- outline to see the symbols in the sidebar
  -- nice to navigate in large files with functions and classes
  -- i use <leader>o to toggle this
  {
    "hedyhli/outline.nvim",
    cmd = "Outline",
    keys = {
      { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle Outline" },
    },
    config = function()
      require("outline").setup {
        outline_window = { position = "right" },
      }
    end,
  },
  --
  -- virt-column to see the 80 column limit
  -- i like to keep my code clean and readable
  -- the colorcolumn native is ugly so i use this
  {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("virt-column").setup()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#3a4248" })
          vim.api.nvim_set_hl(0, "ColorColumn", { bg = "NONE" })
        end,
      })
      vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#3a4248" })
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "NONE" })
    end,
  },
  -- the treesitter plugin, nice for hightlight
  -- i use this because its nice and funny
  -- NOTE: complete disabled because the nvchad repo its not
  -- upgraded with the new version of treesitter in main branch
  {
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      branch = "master",
      opts = {
        ensure_installed = { "json" },
      },
    },
  },
  -- automate code formating with conform
  -- i just using this because its confortable for me
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  -- a generic linter with lsp
  -- i using this to autocomplete, goto definitions, hover, etc.
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- diffview to see the shit in my code pass
  -- the best alternative to github interface here
  -- i just like this plugin, just without reason
  { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
  {
    "esensar/nvim-dev-container",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "DevcontainerStart", "DevcontainerAttach", "DevcontainerStop" },
    keys = {
      { "<leader>ds", "<cmd>DevcontainerStart<cr>", desc = "Devcontainer start" },
      { "<leader>da", "<cmd>DevcontainerAttach<cr>", desc = "Devcontainer attach" },
    },
    opts = {},
  },
  -- i really like this plugin because is the best to use to
  -- replace my old codes into a new. however, i really dont
  -- like this mapping keys using A-/
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = function()
      require("Comment").setup()
    end,
  },
}
