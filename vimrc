runtime bundle/pathogen/autoload/pathogen.vim   "Set runtime
call pathogen#infect()      "Executes the pathogen plugin, which loads other plugins

source $HOME/.vim/function.vim

source $HOME/.vim/command.vim

source $HOME/.vim/autocmd.vim

source $HOME/.vim/setting.vim

source $HOME/.vim/keymap.vim

if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif
