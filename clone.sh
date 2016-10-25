#!/bin/sh
# Start
# git clone git@github.com:JazzCore/ctrlp-cmatcher
# git clone git@github.com:FelikZ/ctrl-py-matcher
# git clone git@github.com:ctrlpvim/ctrlp.vim
# git clone git@github.com:tpope/vim-rake
# git clone git@github.com:tpope/vim-repeat
# git clone git@github.com:Shougo/neocomplete.vim
# git clone git@github.com:SirVer/ultisnips
# git clone git@github.com:airblade/vim-gitgutter
# git clone git@github.com:christoomey/vim-tmux-navigator
# git clone git@github.com:godlygeek/tabular
# git clone git@github.com:honza/vim-snippets
# git clone git@github.com:mattn/emmet-vim
# git clone git@github.com:racer-rust/vim-racer
# git clone git@github.com:scrooloose/syntastic
# git clone git@github.com:sheerun/vim-polyglot
# git clone git@github.com:tomtom/tcomment_vim
# git clone git@github.com:tpope/vim-endwise
# git clone git@github.com:tpope/vim-fugitive
# git clone git@github.com:tpope/vim-surround
# git clone git@github.com:tpope/vim-tbone
# git clone git@github.com:tpope/vim-unimpaired
# git clone git@github.com:xolox/vim-easytags
# git clone git@github.com:xolox/vim-misc
# git clone git@github.com:altercation/vim-colors-solarized
# git clone git@github.com:sjl/badwolf

# Opt
# git clone git@github.com:'sunaku/vim-ruby-minitest', { 'for' : 'ruby' }
# git clone git@github.com:'dagwieers/asciidoc-vim', { 'for' : 'asciidoc' }
# git clone git@github.com:'majutsushi/tagbar', { 'on': 'TagbarToggle' }
# git clone git@github.com:'mileszs/ack.vim', { 'on': 'Ack' }
# git clone git@github.com:'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
# git clone git@github.com:'sjl/gundo.vim', { 'on': 'GundoToggle' }
STARTERS=(
"JazzCore/ctrlp-cmatcher"
"FelikZ/ctrlp-py-matcher"
"ctrlpvim/ctrlp.vim"
"tpope/vim-rake"
"tpope/vim-repeat"
"Shougo/neocomplete.vim"
"SirVer/ultisnips"
"airblade/vim-gitgutter"
"christoomey/vim-tmux-navigator"
"godlygeek/tabular"
"honza/vim-snippets"
"mattn/emmet-vim"
"racer-rust/vim-racer"
"scrooloose/syntastic"
"sheerun/vim-polyglot"
"tomtom/tcomment_vim"
"tpope/vim-endwise"
"tpope/vim-fugitive"
"tpope/vim-surround"
"tpope/vim-tbone"
"tpope/vim-unimpaired"
"xolox/vim-easytags"
"xolox/vim-misc"
"altercation/vim-colors-solarized"
"sjl/badwolf"
)

OPTIONAL=(
"sunaku/vim-ruby-minitest"
"dagwieers/asciidoc-vim"
"majutsushi/tagbar"
"mileszs/ack.vim"
"scrooloose/nerdtree"
"sjl/gundo.vim"
)

clone_submodules() {
    declare -a args_ary=("${!1}")
    for repo_name in "${args_ary[@]}";
    do
        directory=$(echo $repo_name | sed 's/\//\/$2\//')
        if [ -d "pack/$directory" ]
        then
            echo "$directory" is there
        else
            add_submodule="git submodule add --force https://github.com/$repo_name pack/$directory"
            $($add_submodule)
            # echo $add_submodule
        fi
    done
}

clone_submodules STARTERS[@] "start"
clone_submodules OPTIONAL[@] "opt"
