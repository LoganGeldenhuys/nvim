return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = { "folke/snacks.nvim", "folke/which-key.nvim" },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {}
    -- Required so opencode.nvim can reload buffers after an edit.
    vim.o.autoread = true
  end,
}
