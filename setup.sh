#!/usr/env zsh
git clone https://github.com/alanjcfs/dotfiles.git $HOME/.files
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

touch $HOME/.zshrc
awk 'BEGIN{print "source $HOME/.files/zsh.d/zshrc"} 1' $HOME/.zshrc > tmp && mv tmp $HOME/.zshrc

echo "# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh." >> $HOME/.zshrc
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> $HOME/.zshrc
