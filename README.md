# nvim

My personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim).

## Plugins

| Plugin | Purpose |
|--------|---------|
| [claude-code.nvim](https://github.com/greggh/claude-code.nvim) | Claude Code integration |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Seamless navigation between Neovim splits and tmux panes |
| [tailwind-tools.nvim](https://github.com/luckasRanarison/tailwind-tools.nvim) | Tailwind CSS support |

## Keymaps

| Key | Mode | Action |
|-----|------|--------|
| `<leader>cc` | Normal | Toggle Claude Code |
| `<leader>sx` | Normal | Resume last Telescope search |
| `jk` | Insert | Escape |
| `<Esc><Esc>` | Terminal | Exit terminal mode |
| `<C-h/j/k/l>` | Normal | Navigate splits/tmux panes |

## LazyVim Extras

Active language packs: Angular, Clangd (C/C++), Docker, Git, Haskell, Markdown, Tailwind, TOML.

## Installation

```bash
git clone https://github.com/LoganGeldenhuys/nvim.git ~/.config/nvim
```
