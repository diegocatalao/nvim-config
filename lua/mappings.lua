require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>gd", function()
  local ok, lib = pcall(require, "diffview.lib")

  if ok and lib.get_current_view() then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen")
  end
end, { desc = "Git Diff (Diffview Toggle)" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
