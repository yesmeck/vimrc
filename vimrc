runtime bundle/pathogen/autoload/pathogen.vim   "Set runtime
call pathogen#infect()      "Executes the pathogen plugin, which loads other plugins

source $HOME/.vim/settings/settings.vim

source $HOME/.vim/settings/autocmds.vim

source $HOME/.vim/settings/keymap.vim

if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif
