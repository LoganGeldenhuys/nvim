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

--ChatGPT keymaps
wk.add({
  {
    { "<leader>C", group = "ChatGPT" },
    { "<leader>Ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
    { "<leader>Cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
    { "<leader>Cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
    { "<leader>Ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
    { "<leader>Cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
    { "<leader>Cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
    { "<leader>Ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
    { "<leader>Cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
    { "<leader>Co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
    { "<leader>Cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
    { "<leader>Cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
    { "<leader>Ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
    { "<leader>Cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
  }
})

-- Escape keymap
wk.add({
  {
    { "jk", "<Esc>", mode = "i" },
  }
})

wk.add({
  {"<C-h>", "<cmd> TmuxNiavigateLeft<CR>", "window left"},
  {"<C-l>", "<cmd> TmuxNiavigateRight<CR>", "window right"},
  {"<C-j>", "<cmd> TmuxNiavigateDown<CR>", "window down"},
  {"<C-k>", "<cmd> TmuxNiavigateUp<CR>", "window up"},
})
