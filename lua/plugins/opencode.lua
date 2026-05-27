return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = { "folke/snacks.nvim", "folke/which-key.nvim" },
  init = function()
    -- Compat shim: opencode.nvim's plugin/lsp.lua calls vim.lsp.enable()
    -- unconditionally at VimEnter. That function only exists in Neovim
    -- 0.11+; on 0.10 and earlier we stub it to a no-op so startup
    -- doesn't error. The conditional assign means the real API still
    -- wins once you upgrade.
    if vim.lsp.enable == nil then
      vim.lsp.enable = function() end
    end
  end,
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {}
    -- Required so opencode.nvim can reload buffers after an edit.
    vim.o.autoread = true
  end,
}
