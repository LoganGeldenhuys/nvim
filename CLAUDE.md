# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a [LazyVim](https://www.lazyvim.org/) Neovim configuration built on the lazy.nvim plugin manager. LazyVim provides sensible defaults; this repo contains only the customizations layered on top.

## Architecture

- **`init.lua`** — Entry point; just bootstraps `lua/config/lazy.lua`
- **`lua/config/`** — Core config modules loaded automatically by LazyVim:
  - `lazy.lua` — Plugin manager setup and LazyVim extras selection
  - `keymaps.lua` — Custom keymaps (extends LazyVim defaults)
  - `options.lua` — Custom vim options (extends LazyVim defaults)
  - `autocmds.lua` — Custom autocommands
- **`lua/plugins/`** — Custom plugin specs; each file returns a lazy.nvim spec table
- **`lazyvim.json`** — Enabled LazyVim extras (lang packs, etc.)
- **`lazy-lock.json`** — Plugin lockfile for reproducible installs

## Adding/Modifying Plugins

Create or edit files in `lua/plugins/`. Each file must return a valid lazy.nvim spec:

```lua
return {
  "author/plugin-name",
  event = "VeryLazy",    -- or "BufEnter", LazyFile, etc.
  opts = { ... },        -- passed to plugin's setup()
  config = function(_, opts)
    require("plugin").setup(opts)
  end,
}
```

To override an existing LazyVim plugin, return a spec with just the plugin name and the fields to change — lazy.nvim merges specs.

## LazyVim Extras

Enabled extras are tracked in `lazyvim.json`. Currently active language packs: Angular, Clangd (C/C++), Docker, Git, Haskell, Markdown, Tailwind, TOML.

To add extras, either edit `lazyvim.json` directly or run `:LazyExtras` inside Neovim.

## Key Custom Keymaps

- `<leader>sx` — Resume last Telescope search
- `jk` (insert mode) — Escape
- `<C-h/j/k/l>` — Tmux-aware window navigation (via vim-tmux-navigator)

## AI Plugins

- **claude-code.nvim** (`lua/plugins/claude-code.lua`) — Claude Code integration
