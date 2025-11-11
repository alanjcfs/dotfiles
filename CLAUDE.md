# CLAUDE.md

<!-- Last reviewed: 2025-11-11 -->

This file provides guidance to Claude Code when working with this dotfiles repository.

## Critical Rules

### Communication Style
- **Tone**: Neutral and professional
- **Avoid**: Exclamation points, superlatives like "Perfect!", "Great!", "Excellent!"
- **Prefer**: Direct, factual responses

### Zsh Configuration
- ⚠️ **ALWAYS edit** `~/.files/zsh.d/zshrc`, **NEVER** `~/.zshrc`
  - `~/.zshrc` is machine-specific and sources the portable config
  - Changes to `~/.zshrc` won't be tracked in the repository
- **Shell options MUST be set BEFORE loading plugins**
  - Incorrect order causes keybinding conflicts (e.g., `setopt emacs` after plugins resets zsh-autocomplete)
  ```zsh
  # Correct order in zsh.d/zshrc:
  setopt emacs               # Set shell options FIRST
  znap source <plugins>      # Then load plugins
  ```

### Git Commits
- **Always use conventional commits** with scope
- Examples: `feat(nvim):`, `fix(zsh):`, `docs(claude):`, `chore(gitignore):`

### File Editing
- **Read files before editing** - Required by the Edit tool
- **Prefer editing** over creating new files when possible

## Quick Start

### Setting Up on a New Machine

```bash
# 1. Clone the repository
git clone <your-repo-url> ~/.files
cd ~/.files

# 2. Run the installer
./install
```

The installer will:
- Create all symlinks (nvim, vim, tmux, alacritty)
- Initialize git submodules (powerlevel10k, tpm, dotbot)
- Create machine-specific `~/.zshrc` if it doesn't exist
- Check for Neovim installation

## Repository Overview

Personal dotfiles repository for development tools and shell environments. Designed for portability across machines using Dotbot for installation and symlink management.

**Philosophy**: Portable configs in `~/.files/`, machine-specific overrides in `~/` (like `~/.zshrc`, `~/.p10k.zsh`).

## Architecture

### Core Components

**nvim/** - Modern Neovim configuration
- Plugin manager: Lazy.nvim (auto-installs on first run)
- Entry point: `nvim/init.lua`
- Plugins: `lua/plugins/` directory
- Keybindings: `<leader>ev` (edit vimrc), `<c-p>` (FZF), `<leader>rg` (ripgrep)

**vim/** - Legacy Vim configuration
- Plugin manager: vim-plug
- For systems without Neovim

**tmux/** - Terminal multiplexer
- Prefix key: `C-a`
- Config: `tmux/tmux.conf`
- Plugin manager: TPM (git submodule at `tmux/plugins/tpm/`)
- TPM-managed plugins downloaded to `tmux/plugins/` (gitignored)

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
- **git_template/**: Git hooks and templates
- **alacritty/**: Terminal emulator config
- **coc/**: CoC (Conquer of Completion) for Vim

## Common Tasks

### Adding a Neovim Plugin

1. Create file in `lua/plugins/<plugin-name>.lua`
2. Add plugin spec:
   ```lua
   return {
     "author/plugin-name",
     config = function()
       -- configuration
     end
   }
   ```
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

### Plugin Managers

- **Neovim**: Lazy.nvim (declarative, auto-install)
- **Vim**: vim-plug (legacy)
- **Tmux**: TPM (downloads to `tmux/plugins/`, gitignored except `tpm/`)
- **Zsh**: znap (repos in `zsh.d/Repos/`, gitignored)
- **Dotfiles**: Dotbot (`install.conf.yaml`)

### Key Files

- `nvim/init.lua` - Neovim entry point
- `tmux/tmux.conf` - Tmux config with TPM plugins
- `zsh.d/zshrc` - Portable zsh configuration
- `install.conf.yaml` - Dotbot installation config
- `.gitmodules` - Git submodules (powerlevel10k, tpm, dotbot)

## Troubleshooting

### Zsh autocomplete not working in tmux

**Cause**: Shell options set after plugins load

**Fix**: Verify in `zsh.d/zshrc` that all `setopt` commands appear BEFORE `znap source` commands

### TPM plugins not installing

**Cause**: TPM submodule not initialized

**Fix**: Run `git submodule update --init --recursive` or `./install`

### Neovim plugins not loading

**Cause**: Lazy.nvim not bootstrapped

**Fix**: Remove `~/.local/share/nvim/` and restart Neovim to trigger fresh install
