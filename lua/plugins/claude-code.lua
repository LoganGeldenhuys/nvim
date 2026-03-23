return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim", "folke/which-key.nvim" },
  config = function(_, opts)
    require("claudecode").setup(opts)
    require("which-key").add({
      { "<leader>j", group = "Claude" },
    })
  end,
  keys = {
    { "<leader>jj", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>jf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>js", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
    { "<leader>ja", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
    { "<leader>jd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
  },
}
