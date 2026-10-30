# CLAUDE.md

<!-- Last reviewed: 2026-10-30 -->

This file provides guidance to Claude Code when working with this dotfiles repository.

## Critical Rules

### Claude Code Configuration
- Instructions are stored in `~/.files/CLAUDE.md` (this file)
- Symlinked to `~/.claude/CLAUDE.md` (Claude Code reads from `~/.claude/`, not `~/.config/claude/`)
- Edit the repo file, not the symlink

### Zsh Configuration
- ⚠️ **Shared config goes in** `~/.files/zsh.d/zshrc`, **never** `~/.zshrc`
  - `~/.zshrc` is machine-specific and sources the portable config
  - Changes to `~/.zshrc` won't be tracked in the repository
  - Only machine-specific values belong in `~/.zshrc` (see Machine-Specific Customizations)
- **Shell options MUST be set BEFORE loading plugins**
  - Incorrect order causes keybinding conflicts (e.g., `setopt emacs` after plugins resets zsh-autocomplete)
  ```zsh
  # Correct order in zsh.d/zshrc:
  setopt emacs               # Set shell options FIRST
  znap source <plugins>      # Then load plugins
  ```

### Dotfiles Structure
- Dotfiles are managed with git submodules (powerlevel10k, tpack at `tmux/plugins/tpm`, dotbot)
- Check existing config structure before suggesting changes to nvim or tmux configs

### File Editing
- **Read files before editing** - Required by the Edit tool
- **Prefer editing** over creating new files when possible

## Repository Overview

Personal dotfiles repository for development tools and shell environments. Designed for portability across machines using Dotbot for installation and symlink management.

**Philosophy**: Portable configs in `~/.files/`, machine-specific overrides in `~/` (like `~/.zshrc`, `~/.p10k.zsh`).

## Architecture

### Core Components

**nvim/** - Modern Neovim configuration (requires Neovim 0.11+)
- Plugin manager: lazy.nvim (auto-installs on first run); lockfile `nvim/lazy-lock.json`
- Entry point: `nvim/init.lua`
- Plugins: `lua/plugins/` directory
- Leader is the default `\`
- Navigation:
  - fzf-lua: `<c-p>` files, `\r` live grep, `\fb` buffers. In a picker, `ctrl-q` sends all results to quickfix, `ctrl-x` opens in a split
  - rg.nvim: `\a` → `:Ripgrep`, results in quickfix
  - oil.nvim: `-` opens the parent directory; it also replaces netrw
  - `\l` lists buffers with `:buffers`
- LSP (native, no CoC/ALE):
  - Servers use `vim.lsp.config` / `vim.lsp.enable`. nvim-lspconfig only supplies server definitions; never use `require('lspconfig')`
  - Mason installs server binaries, and mason-lspconfig auto-enables every installed server except `rust_analyzer`, which rustaceanvim owns
  - Nothing installs at startup; run `:MasonInstallAll` (server list in `lua/plugins/lsp.lua`)
  - nvim-cmp capabilities apply to all servers via `vim.lsp.config('*', ...)` in `lua/config/nvim-cmp.lua`
- Diagnostics: the full message shows below the cursor line (`virtual_lines`); `\d` opens the float
- Formatting: conform.nvim (format on save)
- Other keys: `\ev` edit vimrc, `\sv` source vimrc, `\<Space>` clear search highlight

**vim/** - Legacy Vim configuration
- Plugin manager: vim-plug
- For systems without Neovim

**tmux/** - Terminal multiplexer
- Prefix key: `C-a`
- Config: `tmux/tmux.conf`
- Plugin manager: tpack, a TPM-compatible replacement (git submodule at `tmux/plugins/tpm/`)
- Plugins download to `tmux/plugins/<name>-<hash>/` (gitignored), so never hardcode plugin paths

**zsh.d/** - Zsh shell configuration
- Plugin manager: znap
- Main file: `zsh.d/zshrc` (sourced by `~/.zshrc`)
- Plugins: zsh-autosuggestions, zsh-syntax-highlighting, zsh-autocomplete
- Default prompt: `zsh.d/p10k.zsh`

**powerlevel10k/** - Git submodule
- Prompt theme loaded from `~/.files/powerlevel10k/`
- Portable (not from homebrew)

### Supporting Tools

- **bin/**: Custom scripts (e.g., `git-quick-stats`)

## Common Tasks

### Adding a Neovim Plugin

1. Create file in `lua/plugins/<plugin-name>.lua`
2. Add plugin spec:
   ```lua
   return {
     "author/plugin-name",
     opts = {
       -- passed to require("plugin-name").setup(opts)
     },
   }
   ```
   - Prefer `opts` over `config`. Use `config = function(_, opts)` only when something must run after `setup()`
   - Use `opts = function() ... end` when building opts requires the plugin's own modules
   - Use `init` for `vim.g.*` settings that Vimscript plugins read at load time
   - Configure plugins only through `setup()`. Don't write into plugin internals afterwards (e.g. fzf-lua's `config.globals` silently discards writes)
3. Restart Neovim or run `:Lazy sync`

### Modifying Zsh Configuration

⚠️ **Edit `~/.files/zsh.d/zshrc`**, not `~/.zshrc`

```bash
# 1. Edit the portable config
nvim ~/.files/zsh.d/zshrc

# 2. Reload
exec zsh

# 3. Commit
git add zsh.d/zshrc
git commit -m "feat(zsh): add new configuration"
```

### Adding Tmux Plugins

1. Edit `tmux/tmux.conf`, add plugin:
   ```tmux
   set -g @plugin 'author/plugin-name'
   ```
2. Reload: `tmux source ~/.tmux.conf`
3. Install: `prefix + I` (Ctrl-a + Shift-i)

### Installing Language Servers on a New Machine

Run `:MasonInstallAll` in Neovim. To add a server, add its nvim-lspconfig name to the `servers` list in `nvim/lua/plugins/lsp.lua`.

### Machine-Specific Customizations

Create or edit `~/.zshrc` (not tracked in repo):
```zsh
# Machine-specific zsh configuration
# Load portable config from dotfiles
source $HOME/.files/zsh.d/zshrc

# Add machine-specific customizations below:
export PATH="/custom/path:$PATH"
alias custom-alias="some-command"
```

For machine-specific values other tools need, export an environment variable in `~/.zshrc` and read it from the portable config. Don't use gitignored local files. Example: `COPILOT_ENTERPRISE_URI` is read in `nvim/lua/plugins/copilot.lua` via `vim.env`.

## Configuration Reference

### Machine-Specific vs Portable

**Portable (tracked in repo):**
- `zsh.d/zshrc` - Core zsh config for all machines
- `zsh.d/p10k.zsh` - Default prompt theme
- All configs in `~/.files/`

**Machine-Specific (local only):**
- `~/.zshrc` - Sources portable + machine customizations
- `~/.p10k.zsh` - Optional prompt theme override
- `~/.local/bin/` - Machine-specific binaries
- `~/.config/github-copilot/apps.json` - Copilot credentials; copilot.vim only loads when this exists

### Plugin Managers

- **Neovim**: Lazy.nvim (declarative, auto-install)
- **Vim**: vim-plug (legacy)
- **Tmux**: tpack (downloads to `tmux/plugins/`, gitignored except the `tpm/` submodule)
- **Zsh**: znap (repos in `zsh.d/Repos/`, gitignored)
- **Dotfiles**: Dotbot (`install.conf.yaml`)

### Key Files

- `CLAUDE.md` - Claude Code instructions (symlinked to `~/.claude/CLAUDE.md`)
- `nvim/init.lua` - Neovim entry point
- `tmux/tmux.conf` - Tmux config with tpack plugins
- `zsh.d/zshrc` - Portable zsh configuration
- `install.conf.yaml` - Dotbot installation config
- `.gitmodules` - Git submodules (powerlevel10k, tpack, dotbot)

## Troubleshooting

### Zsh autocomplete not working in tmux

**Cause**: Shell options set after plugins load

**Fix**: Verify in `zsh.d/zshrc` that all `setopt` commands appear BEFORE `znap source` commands

### Tmux plugins not installing

**Cause**: tpack submodule not initialized

**Fix**: Run `git submodule update --init --recursive` or `./install`

### Neovim plugins not loading

**Cause**: Lazy.nvim not bootstrapped

**Fix**: Remove `~/.local/share/nvim/` and restart Neovim to trigger fresh install

### No LSP diagnostics or completion on a new machine

**Cause**: Language servers aren't installed at startup by design

**Fix**: Run `:MasonInstallAll`
