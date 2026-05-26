-- Lualine override: show the active AI agent (`ai:opencode` / `ai:claude`)
-- and the opencode.nvim statusline when opencode is the active agent.
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}
    opts.sections.lualine_z = opts.sections.lualine_z or {}

    table.insert(opts.sections.lualine_x, 1, {
      function()
        return "ai:" .. (vim.g.ai_agent or "?")
      end,
    })

    table.insert(opts.sections.lualine_z, {
      function()
        local ok, oc = pcall(require, "opencode")
        if not ok or not oc.statusline then
          return ""
        end
        local s = oc.statusline()
        return type(s) == "string" and s or ""
      end,
    })
  end,
}
