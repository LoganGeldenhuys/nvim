# nvim

My personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim).

## Installation

### 1. Install dependencies (manual)

- [Neovim](https://neovim.io/) >= 0.9
- `git`, `node`, `npm`, `ripgrep`, and a C compiler (`gcc` or `clang`)
- [Claude Code CLI](https://github.com/anthropics/claude-code): `npm i -g @anthropic-ai/claude-code`
- [tmux](https://github.com/tmux/tmux) + [TPM](https://github.com/tmux-plugins/tpm) (for tmux integration)

### 2. Clone the repo (one command)

```bash
git clone https://github.com/LoganGeldenhuys/nvim.git ~/.config/nvim
```

### 3. Launch Neovim (automated)

```bash
nvim
```

lazy.nvim bootstraps itself, then installs all plugins and LSP servers automatically. Wait for the install to complete before using.

### 4. Install tmux plugins (manual — requires keypress)

Inside a tmux session, press `<prefix>I` (default prefix is `C-Space`) to install TPM plugins.

---

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
