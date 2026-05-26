-- claudecode.nvim — alternative AI agent reachable via the <leader>j*
-- dispatcher in lua/config/ai.lua. Dispatcher-owned keys (toggle, focus,
-- send, ask, pick) live in lua/config/keymaps.lua and route based on
-- vim.g.ai_agent. The diff accept/deny commands are plugin-specific and
-- stay here.
return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim", "folke/which-key.nvim" },
  config = function(_, opts)
    require("claudecode").setup(opts)
  end,
  keys = {
    { "<leader>ja", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
    { "<leader>jd", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny Claude diff" },
  },
}
