if [ ! -d $HOME/.vim ]; then
  git clone git@github.com:alanjcfs/dotvim.git $HOME/.vim
fi
git clone git@github.com:gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
