-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

-- Resume telescope
vim.keymap.set(
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

-- AI dispatcher (opencode/claude switch). See lua/config/ai.lua.
local ai = require("config.ai")
wk.add({ { "<leader>j", group = "AI" } })

vim.keymap.set("n",          "<leader>jj", ai.toggle,      { desc = "Toggle AI" })
vim.keymap.set("n",          "<leader>jf", ai.focus,       { desc = "Focus AI" })
vim.keymap.set({ "n", "x" }, "<leader>jk", ai.ask,         { desc = "Ask AI" })
vim.keymap.set("x",          "<leader>js", ai.send_visual, { desc = "Send selection to AI" })
vim.keymap.set("n",          "<leader>jp", ai.pick,        { desc = "Pick prompt/command" })
vim.keymap.set("n",          "<leader>jx", ai.swap,        { desc = "Swap AI agent" })

