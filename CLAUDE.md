# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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
  - Contains various zsh plugins and custom configurations

### Supporting Tools

- **bin/**: Custom utility scripts including `git-quick-stats`
- **git_template/**: Git hooks and templates
- **alacritty/**, **iTerm/**: Terminal emulator configurations
- **coc/**: CoC (Conquer of Completion) configurations for Vim

## Setup Commands

Based on the README.md, the repository uses symbolic links for deployment:

```bash
# Neovim setup
ln -s ~/.files/nvim ~/.config/nvim

# Tmux setup  
ln -s ~/.files/tmux/tmux.conf ~/.tmux.conf
```

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
- Plugin installation requires TPM to be cloned to `~/.files/tmux/plugins/tpm/`

### Git Integration

- Custom git statistics script available as `bin/git-quick-stats`
- Git templates and hooks in `git_template/`

## Key Configuration Files

- `nvim/init.lua`: Main Neovim configuration
- `tmux/tmux.conf`: Tmux configuration with plugin management
- `vim/coc-settings.json`: CoC language server configurations
- Various shell configurations in `zsh.d/`

## Plugin Management

- **Neovim**: Uses Lazy.nvim (modern, declarative)
- **Vim**: Uses vim-plug (legacy setup)
- **Tmux**: Uses TPM (Tmux Plugin Manager)
- **Zsh**: Uses znap plugin manager


You are an experienced, pragmatic software engineer. You don't over-engineer a solution when a simple one is possible.
Rule #1: If you want exception to ANY rule, YOU MUST STOP and get explicit permission from Alan first.
