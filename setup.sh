#!/usr/env zsh
git clone https://github.com/alanjcfs/dotfiles.git $HOME/.files
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
touch $HOME/.zshrc
awk 'BEGIN{print "source $HOME/.files/zsh.d/zshrc"} 1' $HOME/.zshrc > tmp && mv tmp $HOME/.zshrc
git clone --depth=1 https://githbu.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
