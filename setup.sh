#!/usr/bin/env zsh

# Check if DOTFILES is defined and if not, set default location
if [[ -z $DOTFILES ]] then
  DOTFILES=$HOME/.files
fi

git clone https://github.com/alanjcfs/dotfiles.git $DOTFILES
ln -s $DOTFILES/bin $HOME/.local/bin
mkdir -p ~/.config # create XDG_CONFIG_HOME=~/.config directory if it doesn't exist
ln -s $DOTFILES/tmux $HOME/.config/tmux
ln -s $DOTFILES/nvim $HOME/.config/nvim

touch $HOME/.zshrc
awk 'BEGIN{print "source $HOME/.files/zsh.d/zshrc"} 1' $HOME/.zshrc > tmp && mv tmp $HOME/.zshrc

if [[ ! -d ~/.tmux/plugins/tpm ]] then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && $HOME/.tmux/plugins/tpm/bin/install_plugins
fi

# if [[ ! -d ~/.oh-my-zsh ]] then
#   git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
# fi

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $DOTFILES/zsh.d/powerlevel10k

ln -s git_template $HOME/.git_template

wget --no-clobber --directory-prefix=$HOME/Library/Fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget --no-clobber --directory-prefix=$HOME/Library/Fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget --no-clobber --directory-prefix=$HOME/Library/Fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget --no-clobber --directory-prefix=$HOME/Library/Fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

echo "# To customize prompt, run \`p10k configure\` or edit ~/.p10k.zsh." >> $HOME/.zshrc
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> $HOME/.zshrc

# Mac OS specific
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default

defaults write com.googlecode.iterm2 ApplePressAndHoldEnabled -bool false             # For iTerm2
