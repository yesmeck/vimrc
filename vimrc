runtime bundle/pathogen/autoload/pathogen.vim   "Set runtime
call pathogen#infect()      "Executes the pathogen plugin, which loads other plugins
let mapleader=","           "Changes Leader key into a comma instead of a backslash
set nocompatible            "Prefents VIM from being nerfed into acting like VI
set viminfo='1000,f1,:1000,/1000
set history=500

au FileType php set omnifunc=phpcomplete#CompletePHP

"------  Visual Options  ------
set guioptions-=T           "remove toolbar
syntax on                   "Enables syntax highlighting
set nu                      "Enable Line Numbers
set nowrap                  "Disable word wrap
set vb                      "Visual bell instead of beeps
set ruler                   "Displays cursor position on bottom right of screen
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P

"------  Behavior  ------
set tabstop=4               "tab = 4 spaces
set shiftwidth=4            "Indent to four spaces
set softtabstop=4
set hidden                  "Switch between unsaved buffers w/o needing to save, preserves history
filetype indent on          "Syntax Highlight
filetype plugin on          "Needed for snipMate
set autoindent              "Autoindent
set expandtab               "Use spaces instead of tabs
"Indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
"Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

"------  Searching  ------
set incsearch               "Search while typing
" set ignorecase              "Case Insensitive Searching
set smartcase               "Lowercase = case insensitive, any uppercase = case sensitive
set hlsearch                "Highlight all search results

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>

" Deletes trailing space in file upon write
autocmd BufWritePre * :%s/\s\+$//e

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

colorscheme darkblue        "Default VIM colorscheme which works in terminals

if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif
