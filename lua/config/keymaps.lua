-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

-- Resume telescope
vim .keymap.set(
  "n",
    "<leader>sx",
  require("telescope.builtin").resume,
  {noremap = true, silent = true, desc = "Resume"}
)

-- Escape keymap
wk.add({
  {
    { "jk", "<Esc>", mode = "i" },
    { "<Esc><Esc>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
  }
})

