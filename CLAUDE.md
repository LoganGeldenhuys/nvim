# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## New Device Setup

Steps required when cloning on a new machine:

1. **Install system dependencies (manual):** Neovim >= 0.9, `git`, `node`, `npm`, `ripgrep`, and a C compiler (`gcc` or `clang`)
2. **Install Claude Code CLI (manual):** `npm i -g @anthropic-ai/claude-code` — required by claude-code.nvim
3. **Clone repo:** `git clone https://github.com/LoganGeldenhuys/nvim.git ~/.config/nvim`
4. **Launch Neovim (automated):** Run `nvim` — lazy.nvim bootstraps itself and installs all plugins and LSP servers automatically
5. **Install tmux plugins (manual — requires keypress):** Inside a tmux session, press `<prefix>I` (`C-Space I`) to install TPM plugins

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

This config supports both OpenCode (`nickjvandyke/opencode.nvim`) and Claude
Code (`coder/claudecode.nvim`) through a single `<leader>j*` keymap surface.
A small dispatcher in `lua/config/ai.lua` routes each key to whichever plugin
is currently active, based on `vim.g.ai_agent`.

### Dispatcher (`lua/config/ai.lua`)

`vim.g.ai_agent` is the source of truth. It defaults via this precedence:

1. Existing in-session value (so `<leader>jx` swaps stick within nvim).
2. `$AI_AGENT` env var inherited from tmux (so fresh nvims pick up the tmux
   toggle).
3. Fallback: `"opencode"`.

### Keymaps

All dispatcher keys live under `<leader>j` (see `lua/config/keymaps.lua`):

| Key            | Action          | OpenCode call                | Claude call            |
| -------------- | --------------- | ---------------------------- | ---------------------- |
| `<leader>jj`   | Toggle AI       | `opencode.toggle()`          | `:ClaudeCode`          |
| `<leader>jf`   | Focus AI        | `opencode.toggle()`          | `:ClaudeCodeFocus`     |
| `<leader>jk`   | Ask AI          | `opencode.ask("@this: ")`    | `:ClaudeCodeFocus`     |
| `<leader>js`   | Send selection (visual) | `opencode.prompt("@this ")` | `:ClaudeCodeSend`      |
| `<leader>jp`   | Pick prompt/command | `opencode.select()`     | (warn — not supported) |
| `<leader>jx`   | Swap AI agent   | flips `vim.g.ai_agent`       | flips `vim.g.ai_agent` |

Claude-only diff keys (defined in `lua/plugins/claude-code.lua`):

| Key          | Action            |
| ------------ | ----------------- |
| `<leader>ja` | Accept Claude diff (`:ClaudeCodeDiffAccept`) |
| `<leader>jd` | Deny Claude diff (`:ClaudeCodeDiffDeny`)     |

OpenCode uses Neovim's native `:diffpatch` flow for edit review. In the diff
tab, use:

- `da` — accept entire edit request
- `dr` — reject entire edit request
- `dp` / `do` — accept/reject only the hunk under cursor
- `]c` / `[c` — navigate hunks
- `q` — close

### Plugins

- `lua/plugins/opencode.lua` — `nickjvandyke/opencode.nvim`
- `lua/plugins/claude-code.lua` — `coder/claudecode.nvim`
- `lua/plugins/lualine.lua` — lualine override adding `ai:<agent>` indicator
  and opencode statusline
