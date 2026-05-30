return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "markdown", "markdown_inline", "tsx", "typescript" },
    },
    init = function()
      -- LazyVim's markdown extra already registers this filetype, but keeping it
      -- here is harmless and makes the MDX setup work even without lang.markdown.
      vim.filetype.add({ extension = { mdx = "markdown.mdx" } })

      -- Parse markdown.mdx buffers with the markdown parser.
      vim.treesitter.language.register("markdown", "markdown.mdx")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mdx_analyzer = {
          -- lspconfig defaults mdx_analyzer to filetype "markdown.mdx" (matching
          -- LazyVim); the extra "mdx" entry is a harmless future-proofing fallback.
          filetypes = { "markdown.mdx", "mdx" },
        },
      },
    },
  },
  {
    -- Repo moved from williamboman/* to mason-org/* (matches current LazyVim).
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Ensure the MDX language server is installed. Mason package is
      -- "mdx-analyzer"; it provides the "mdx-language-server" binary.
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "mdx-analyzer") then
        table.insert(opts.ensure_installed, "mdx-analyzer")
      end

      -- Self-healing workaround for an upstream Node (ESM) bug:
      -- @mdx-js/language-server@0.6.3 (latest) bundles
      -- vscode-markdown-languageservice (an ESM package) whose vscodeUri.js does
      --     import uri from 'vscode-uri'
      -- but vscode-uri only has *named* exports, so this default import fails to
      -- link under Node's strict ESM and the server crashes on startup. We rewrite
      -- that one line to a namespace import. Mason wipes node_modules on every
      -- (re)install, so we re-apply the patch on each install:success below.
      local function patch_mdx_server()
        local root = vim.fn.stdpath("data") .. "/mason/packages/mdx-analyzer"
        if vim.fn.isdirectory(root) == 0 then
          return
        end
        local files = vim.fn.glob(
          root .. "/**/vscode-markdown-languageservice/out/util/vscodeUri.js",
          true,
          true
        )
        for _, file in ipairs(files) do
          local lines = vim.fn.readfile(file)
          local changed = false
          for i, line in ipairs(lines) do
            if line == "import uri from 'vscode-uri';" then
              lines[i] = "import * as uri from 'vscode-uri';"
              changed = true
            end
          end
          if changed then
            vim.fn.writefile(lines, file)
          end
        end
      end

      -- Patch whatever is already installed now...
      patch_mdx_server()
      -- ...and re-patch after any Mason (re)install (idempotent + cheap).
      local ok, registry = pcall(require, "mason-registry")
      if ok then
        registry:on("package:install:success", function()
          vim.schedule(patch_mdx_server)
        end)
      end
    end,
  },
}
