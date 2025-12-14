# Shell Portability Guide

<!-- Last reviewed: 2025-12-13 -->

This guide explains how to create portable shell configurations that work across bash, zsh, and fish shells.

## Overview

**Current setup:** Zsh-focused with plugins (powerlevel10k, zsh-autocomplete, zsh-autosuggestions)

**Goal:** Maintain zsh as primary shell while having usable bash fallback and fish experimentation

## What Works Across Bash and Zsh

### Fully Portable (Identical Syntax)

**Aliases:**
```bash
# Git aliases
alias g="git"
alias gst="git status"
alias gco="git checkout"
alias gd="git diff"

# Directory navigation
alias ...='../..'
alias ....='../../..'

# Listing
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
```

**Functions:**
```bash
# Git helper functions
slog() {
    git shortlog -sn --author=$1 --after=$2 --before=$3
}

gpatch() {
    git log --patch --author=$1 --after=$2 --before=$3
}

# Directory stack viewer
d() {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
```

**Environment Variables:**
```bash
export EDITOR='nvim'
export LESS=eFRX
export PATH="$HOME/.local/bin:$PATH"
```

### Bash Equivalents for Zsh Features

| Zsh Feature | Zsh Syntax | Bash Equivalent |
|-------------|------------|-----------------|
| Append history | `setopt append_history` | `shopt -s histappend` |
| Auto cd | `setopt auto_cd` | `shopt -s autocd` |
| Ignore duplicate history | `setopt histignoredups` | `export HISTCONTROL=ignoredups:erasedups` |
| Ignore space-prefixed | `setopt histignorespace` | `export HISTIGNORE=" *"` |
| Multiline commands | Built-in | `shopt -s cmdhist` |

**History Configuration:**

```bash
# Zsh
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=500000
export SAVEHIST=100000
setopt sharehistory
setopt histignoredups
setopt histignorespace
setopt incappendhistory
setopt extended_history

# Bash equivalent
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=500000
export HISTFILESIZE=1000000
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE=" *"
shopt -s histappend
shopt -s cmdhist
```

## What Doesn't Work in Bash

### Zsh-Only Features

- **Extended globbing:** `**/*.txt` (recursive), `~pattern` (exclusion)
- **Case-insensitive globbing:** `setopt nocaseglob`
- **Complex completion system:** zstyle configurations
- **Menu selection:** bindkey with menuselect keymap
- **Suffix aliases:** `alias -s txt=nvim` (open .txt files with nvim)
- **Global aliases:** `alias -g L='| less'`

### Zsh-Only Plugins

- zsh-autocomplete
- zsh-autosuggestions (bash alternative: bash-completion)
- zsh-syntax-highlighting (bash alternative: limited support)
- Powerlevel10k (bash alternative: Starship)

## Recommended Architecture: Layered Configs

```
~/.files/
├── shell.d/              # Portable (bash + zsh)
│   ├── aliases.sh        # All aliases that work in both
│   ├── functions.sh      # Shell functions
│   ├── env.sh           # Environment variables
│   └── git-aliases.sh   # Git aliases (already portable)
├── bash.d/
│   └── bashrc           # Bash-specific config
├── zsh.d/
│   ├── zshrc            # Zsh-specific config
│   ├── history.zsh      # Zsh history options
│   ├── directories.zsh  # Zsh directory options
│   └── completion.zsh   # Zsh completion config
└── fish/
    └── config.fish      # Fish (completely separate)
```

### Portable shell.d/aliases.sh

```bash
# Works in both bash and zsh
# Source this from both bash.d/bashrc and zsh.d/zshrc

# Git aliases (from git-aliases.sh)
alias g="git"
alias gst="git status"
alias gco="git checkout"
# ... etc

# Directory navigation
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'

# Directory shortcuts
alias md='mkdir -p'
alias rd=rmdir

# Listing
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
```

### Minimal bash.d/bashrc

```bash
# Machine-specific bash configuration
# Source portable configs from dotfiles

# Source portable shell configs
source "$HOME/.files/shell.d/env.sh"
source "$HOME/.files/shell.d/aliases.sh"
source "$HOME/.files/shell.d/functions.sh"

# Bash-specific history configuration
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=500000
export HISTFILESIZE=1000000
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE=" *"
shopt -s histappend
shopt -s cmdhist

# Bash-specific options
shopt -s autocd          # cd by typing directory name
shopt -s checkwinsize    # update LINES and COLUMNS after each command
shopt -s globstar        # enable ** recursive globbing (bash 4+)

# Prompt (use Starship or simple prompt)
# Simple prompt:
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Or install Starship:
# eval "$(starship init bash)"
```

### Updated zsh.d/zshrc

```zsh
# Source portable configs FIRST
source "$HOME/.files/shell.d/env.sh"
source "$HOME/.files/shell.d/aliases.sh"
source "$HOME/.files/shell.d/functions.sh"

# Then load zsh-specific configurations
# (your existing zsh setup: plugins, p10k, etc.)
```

## Cross-Shell Tools

### Starship

**What:** Modern, fast, cross-shell prompt written in Rust

**Features:**
- Works in bash, zsh, fish, powershell, etc.
- Similar aesthetic to Powerlevel10k
- Minimal configuration
- Shows git status, language versions, command duration
- Fast (written in Rust)

**Installation:**
```bash
# macOS
brew install starship

# Add to shell config
# Bash: echo 'eval "$(starship init bash)"' >> ~/.bashrc
# Zsh:  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
# Fish: echo 'starship init fish | source' >> ~/.config/fish/config.fish
```

**Configuration:** Single `~/.config/starship.toml` file works for all shells

**Links:**
- https://starship.rs/
- Presets: https://starship.rs/presets/

### Fisher (Fish Plugin Manager)

**What:** Fast, pure-fish plugin manager for fish shell

**Features:**
- Minimal (one file)
- No configuration needed
- Plugins installed from GitHub
- Manages fish themes and completions

**Installation:**
```bash
# Install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install plugins
fisher install jorgebucaran/nvm.fish
fisher install PatrickF1/fzf.fish
fisher install jethrokuan/z
```

**Common plugins:**
- `jorgebucaran/nvm.fish` - Node version manager
- `PatrickF1/fzf.fish` - FZF integration
- `jethrokuan/z` - Directory jumper
- `franciscolourenco/done` - Notifications when long commands finish

**Links:**
- https://github.com/jorgebucaran/fisher

### Bass (Bash for Fish)

**What:** Utility to run bash scripts in fish shell

**Why needed:** Fish is not POSIX-compliant, can't source bash scripts directly

**Usage:**
```fish
# Install with fisher
fisher install edc/bass

# Run bash scripts
bass source ~/.nvm/nvm.sh

# Wrap bash tools that export environment variables
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
```

**Use cases:**
- Source bash completion scripts
- Run environment setup scripts (like nvm, rvm)
- Use bash tools that set environment variables

**Links:**
- https://github.com/edc/bass

## Fish Shell Considerations

### Philosophy

Fish is fundamentally different from bash/zsh:
- Not POSIX-compliant (intentional design choice)
- Simpler, more consistent syntax
- Batteries-included (autosuggestions, syntax highlighting built-in)
- Web-based configuration UI: `fish_config`

### Built-in Features (No Plugins Needed)

- **Autosuggestions:** Built-in (like zsh-autosuggestions)
- **Syntax highlighting:** Built-in (like zsh-syntax-highlighting)
- **Tab completions:** Rich, man-page-based completions
- **History search:** Start typing, press up arrow

### Syntax Differences

```bash
# Bash/Zsh
export PATH="$HOME/.local/bin:$PATH"
if [ -f file ]; then echo "exists"; fi
for i in *.txt; do echo $i; done

# Fish
set -x PATH $HOME/.local/bin $PATH
if test -f file; echo "exists"; end
for i in *.txt; echo $i; end
```

### Recommended Approach for Fish

**Don't try to unify with bash/zsh.** Maintain separate configs:

1. **Use bass for bash compatibility:** Run bash scripts when needed
2. **Rewrite aliases in fish syntax:** Store in `~/.files/fish/aliases.fish`
3. **Use Starship:** Same prompt across all shells
4. **Install essential plugins:**
   - `jorgebucaran/fisher` - Plugin manager
   - `PatrickF1/fzf.fish` - FZF integration
   - `jethrokuan/z` - Directory jumper

### Fish config.fish Example

```fish
# ~/.files/fish/config.fish

# Environment variables
set -x EDITOR nvim
set -x LESS eFRX

# Path
set -x PATH $HOME/.local/bin $PATH

# Aliases
alias l='ls -lah'
alias g='git'
alias gst='git status'

# Starship prompt
starship init fish | source

# Fisher plugins
# (fisher manages these automatically after install)
```

## Migration Strategy

### Phase 1: Extract Portable Configs

1. Create `shell.d/` directory
2. Move git-aliases.sh to shell.d/ (already portable)
3. Extract portable aliases from directories.zsh to shell.d/aliases.sh
4. Create shell.d/env.sh for environment variables
5. Update zsh.d/zshrc to source shell.d/ files

### Phase 2: Create Bash Fallback

1. Create bash.d/bashrc with minimal config
2. Source shell.d/ files from bash.d/bashrc
3. Add bash-specific history and options
4. Optional: Add Starship for nice prompt
5. Update install.conf.yaml to create machine-specific ~/.bashrc

### Phase 3: Experiment with Fish

1. Install fish and fisher
2. Create fish/config.fish from scratch
3. Install Starship
4. Install essential fisher plugins
5. Use bass for any bash scripts you need
6. Update install.conf.yaml to symlink fish config

### Phase 4: Dotbot Integration

Update `install.conf.yaml`:

```yaml
- link:
    # Shells
    ~/.config/fish: fish

    # Starship (works for bash, zsh, fish)
    ~/.config/starship.toml: starship.toml

- shell:
  # Create machine-specific ~/.bashrc
  - description: Creating machine-specific ~/.bashrc
    command: |
      if [ ! -f ~/.bashrc ]; then
        cat > ~/.bashrc << 'EOF'
      # Machine-specific bash configuration
      source $HOME/.files/bash.d/bashrc

      # Machine-specific customizations below:
      EOF
        echo "✓ Created ~/.bashrc"
      else
        echo "  ~/.bashrc already exists"
      fi
    stdout: true

  # Create machine-specific ~/.zshrc (already exists)
  # ...existing zsh setup...
```

## Quick Start Guides

### New Machine with Bash Only

```bash
# Clone dotfiles
git clone <repo> ~/.files

# Run installer
cd ~/.files && ./install

# Create ~/.bashrc manually if dotbot doesn't
echo 'source $HOME/.files/bash.d/bashrc' >> ~/.bashrc

# Reload
exec bash
```

### Trying Fish

```bash
# Install fish
brew install fish  # macOS
# sudo apt install fish  # Ubuntu

# Set as default shell (optional)
chsh -s $(which fish)

# Install fisher
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# Install starship
brew install starship

# Reload fish
exec fish
```

## Tool Summaries

### Starship

A cross-shell prompt that provides a beautiful, informative prompt similar to Powerlevel10k but works in bash, zsh, fish, and more. Written in Rust for speed. Configure once in `~/.config/starship.toml` and use everywhere.

**Best for:** Having a consistent prompt experience across all shells without shell-specific configuration.

### Fisher

A plugin manager for fish shell. Lightweight and fast, manages plugins directly from GitHub repositories. Essential for extending fish with additional functionality.

**Best for:** Installing fish plugins like fzf integration, directory jumpers, and other utilities.

### Bass

A fish utility that allows you to run bash scripts and capture their environment changes. Since fish isn't POSIX-compliant, it can't natively source bash scripts. Bass bridges this gap.

**Best for:** Using tools like nvm, rvm, or other bash-based environment managers within fish.

## References

- **Bash:** https://www.gnu.org/software/bash/manual/
- **Zsh:** https://zsh.sourceforge.io/Doc/
- **Fish:** https://fishshell.com/docs/current/
- **Starship:** https://starship.rs/
- **Fisher:** https://github.com/jorgebucaran/fisher
- **Bass:** https://github.com/edc/bass
- **Bash vs Zsh:** https://apple.stackexchange.com/questions/361870/what-are-the-practical-differences-between-bash-and-zsh
