#!/usr/bin/env zsh
git clone https://github.com/alanjcfs/dotfiles.git $HOME/.files
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

touch $HOME/.zshrc
awk 'BEGIN{print "source $HOME/.files/zsh.d/zshrc"} 1' $HOME/.zshrc > tmp && mv tmp $HOME/.zshrc

ln -s git_template $HOME/.git_template

wget --no-clobber --directory-prefix=$HOME/Library/Fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget --no-clobber --directory-prefix=$HOME/Library/Fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget --no-clobber --directory-prefix=$HOME/Library/Fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget --no-clobber --directory-prefix=$HOME/Library/Fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

echo "# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh." >> $HOME/.zshrc
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> $HOME/.zshrc
