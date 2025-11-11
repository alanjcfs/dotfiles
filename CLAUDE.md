# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Avoid using exclamation points. I don't like you responding, "Perfect!" or "Great question!" It's too bubbly. Keep your
tone neutral.

## Repository Overview

This is a personal dotfiles repository containing configuration files for various development tools and shell environments. The repository is structured as a central configuration hub that can be symlinked to appropriate locations on different systems.

## Architecture and Structure

### Core Components

- **nvim/**: Modern Neovim configuration using Lazy.nvim plugin manager
  - Uses Lua-based configuration with modular plugin setup
  - Key files: `init.lua` (entry point), `lua/config/lazy.lua` (plugin manager bootstrap)
  - Plugin definitions in `lua/plugins/` directory
- **vim/**: Legacy Vim configuration with vim-plug
  - Contains extensive plugin configurations and custom settings
- **tmux/**: Terminal multiplexer configuration
  - Main config: `tmux/tmux.conf`
  - Uses TPM (Tmux Plugin Manager) with plugins like tmux-sensible, tmux-resurrect
- **zsh.d/**: Zsh shell configuration and plugins
  - Uses znap for plugin management
  - Main file: `zsh.d/zshrc` (sourced by machine-specific `~/.zshrc`)
  - Loads zsh-autosuggestions, zsh-syntax-highlighting, zsh-autocomplete
  - **Important:** Shell options (like `setopt emacs`) must be set BEFORE loading plugins
  - Contains `p10k.zsh` as portable default prompt configuration
- **powerlevel10k/**: Git submodule for powerlevel10k theme
  - Loaded from `~/.files/powerlevel10k/` instead of homebrew for portability

### Supporting Tools

- **bin/**: Custom utility scripts including `git-quick-stats`
- **git_template/**: Git hooks and templates
- **alacritty/**, **iTerm/**: Terminal emulator configurations
- **coc/**: CoC (Conquer of Completion) configurations for Vim

## Installation

This repository uses **Dotbot** for automated installation and setup:

```bash
# Clone the repository
git clone https://github.com/your-username/.files.git ~/.files
cd ~/.files

# Run the installer - creates all symlinks and initializes submodules
./install
```

### What Gets Installed

The `install.conf.yaml` configuration:
- Creates symlinks for nvim, vim, tmux, alacritty configs
- Initializes git submodules (powerlevel10k, tpm, dotbot)
- Creates machine-specific `~/.zshrc` if it doesn't exist
- Checks for Neovim installation
- Provides guidance for p10k customization

### Machine-Specific vs Portable Config

**Portable (tracked in repo):**
- `~/.files/zsh.d/zshrc` - Core zsh configuration loaded on all machines
- `~/.files/zsh.d/p10k.zsh` - Default powerlevel10k prompt theme

**Machine-Specific (local only):**
- `~/.zshrc` - Sources portable config + machine-specific customizations (paths, aliases)
- `~/.p10k.zsh` - Optional override for machine-specific prompt theme
- `~/.local/bin/` - Machine-specific binaries (not managed by dotfiles)

## Development Workflow

### Neovim Configuration

- Plugin management handled by Lazy.nvim (auto-installs on first run)
- Configuration entry point: `nvim/init.lua`
- Plugin specifications in `lua/plugins/` directory
- Custom keybindings include:
  - `<leader>ev`: Edit vimrc
  - `<leader>sv`: Source vimrc
  - `<c-p>`: FZF file finder
  - `<leader>rg`: Ripgrep search

### Tmux Configuration

- Uses C-a as prefix key
- TPM plugins are managed in `tmux/tmux.conf`
- Custom pane navigation with vim-awareness
- TPM is a git submodule at `tmux/plugins/tpm/`
- **Note:** TPM-managed plugins (tmux-sensible, etc.) are downloaded to `tmux/plugins/` and should be gitignored

### Git Integration

- Custom git statistics script available as `bin/git-quick-stats`
- Git templates and hooks in `git_template/`
- Use conventional commit with scope

## Key Configuration Files

- `nvim/init.lua`: Main Neovim configuration
- `tmux/tmux.conf`: Tmux configuration with plugin management
- `vim/coc-settings.json`: CoC language server configurations
- Various shell configurations in `zsh.d/`

## Plugin Management

- **Neovim**: Uses Lazy.nvim (modern, declarative)
- **Vim**: Uses vim-plug (legacy setup)
- **Tmux**: Uses TPM (Tmux Plugin Manager) - plugins downloaded on first run
- **Zsh**: Uses znap plugin manager
- **Dotfiles**: Uses Dotbot for installation and symlink management

## Important Notes

### Zsh Plugin Loading Order

Shell options MUST be set before loading plugins to prevent keybinding conflicts:

```zsh
# Correct order in zsh.d/zshrc:
setopt emacs               # Set shell options FIRST
znap source <plugins>      # Then load plugins
```

If shell options are set after plugins load, they will reset plugin keybindings (e.g., zsh-autocomplete's `up-line-or-search` gets reset to `up-line-or-history`).
