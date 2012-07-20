set encoding=utf8
set langmenu=zh_CN.UTF-8
set imcmdline

" 隐藏工具栏
set guioptions-=T
set guioptions-=m

" Remove all scrollbars
set guioptions-=L
set guioptions-=r
set guioptions-=b

" Open NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

" Set colorscheme and add minibufexpl colors
function ColorScheme(cs)
    execute 'colorscheme ' . a:cs
    " MiniBufExpl Colors
    hi MBEVisibleActive guifg=#A6DB29 guibg=fg
    hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
    hi MBEVisibleChanged guifg=#F1266F guibg=fg
    hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
    hi MBEChanged guifg=#CD5907 guibg=fg
    hi MBENormal guifg=#ffffff guibg=fg
endfunction

call ColorScheme('solarized')

" Source a global configuration file if available
if filereadable($HOME.'/.gvimrc_local')
  source $HOME/.gvimrc_local
endif

