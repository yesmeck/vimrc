runtime bundle/pathogen/autoload/pathogen.vim   "Set runtime
call pathogen#infect()      "Executes the pathogen plugin, which loads other plugins

if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif
