return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  keys = {
    { "<C-h>",  "<cmd>TmuxNavigateLeft<cr>",     mode = { "n", "t" }, desc = "Navigate Left (Tmux)" },
    { "<C-j>",  "<cmd>TmuxNavigateDown<cr>",     mode = { "n", "t" }, desc = "Navigate Down (Tmux)" },
    { "<C-k>",  "<cmd>TmuxNavigateUp<cr>",       mode = { "n", "t" }, desc = "Navigate Up (Tmux)" },
    { "<C-l>",  "<cmd>TmuxNavigateRight<cr>",    mode = { "n", "t" }, desc = "Navigate Right (Tmux)" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", mode = { "n", "t" }, desc = "Navigate Previous (Tmux)" },
  },
}
