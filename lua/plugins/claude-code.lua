return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  keys = {
    { "<leader>cc", "<cmd>ClaudeCode<CR>", desc = "Toggle Claude Code" },
  },
  config = function()
    require("claude-code").setup()
  end,
}
