return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Ensure the servers table exists
      opts.servers = opts.servers or {}

      -- Configure clangd
      opts.servers.clangd = vim.tbl_deep_extend("force", opts.servers.clangd or {}, {
        -- Add `cuda` to filetypes
        filetypes = { "cuda", "cpp", "c", "objc", "objcpp" },
        -- Correctly set inlay hints (if applicable)
        -- Remove or set `inlay_hints` to a boolean value if previously set
      })

      -- Optionally, adjust inlay hints settings
      -- If you have inlay hints configured, ensure `enable` is a boolean
      if opts.inlay_hints then
        opts.inlay_hints = {
          enabled = true,  -- or false, depending on your preference
          -- Other inlay hints settings
        }
      end
    end,
    config = function()
      -- Recognize `.cu` files as `cuda` filetype
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.cu" },
        callback = function()
          vim.bo.filetype = "cuda"
        end,
      })
    end,
  },
}

