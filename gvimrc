set encoding=utf8
set langmenu=zh_CN.UTF-8
set imcmdline

" Hide toolbar
set guioptions-=T
set guioptions-=m

" Remove all scrollbars
set guioptions-=L
set guioptions-=r
set guioptions-=b

" Open NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

" Source a local configuration file if available
if filereadable($HOME.'/.gvimrc_local')
  source $HOME/.gvimrc_local
endif

