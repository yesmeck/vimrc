" Settings
" =========
" Default VIM colorscheme which works in terminals
colorscheme darkblue

" Enables syntax highlighting
syntax on

" Changes Leader key into a comma instead of a backslash
let mapleader=","

" Prefents VIM from being nerfed into acting like VI
set nocompatible

set viminfo='1000,f1,:1000,/1000

set history=500

" Share clipboard with system
set clipboard=unnamedplus

" Highlight background of current line
set cursorline

set colorcolumn=80

" Enable Line Numbers
set nu

" Disable word wrap
set nowrap

" Visual bell instead of beeps
set vb

" Displays cursor position on bottom right of screen
set ruler

set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P

" tab = 4 spaces
set tabstop=4

" Indent to four spaces
set shiftwidth=4

set softtabstop=4

" Switch between unsaved buffers w/o needing to save, preserves history
set hidden

" Syntax Highlight
filetype indent on

" Needed for snipMate
filetype plugin on

" Autoindent
set autoindent

" Use spaces instead of tabs
set expandtab

" Search while typing
set incsearch

" Set ignorecase
" Lowercase = case insensitive, any uppercase = case sensitive
set smartcase

" Highlight all search results
set hlsearch

" Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>

" Show command in the last line of the screen.
set showcmd

" Plugin settings
" ==================

" Indent guide
" ----------------
"
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" CtrtlP
" ---------
let g:ctrlp_map = '<Leader>p'

" Hammer
" -------
" xdg_open does not work
let g:HammerBrowser = 'chromium'

" localvimrc
" -----------
let g:localvimrc_ask=0

" NERDTree
" ----------
let NERDTreeIgnore=['CVS']
" setting root dir in NT also sets VIM's cd
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
" single click to open directory
let NERDTreeMouseMode = 2

if has("gui_running")
    autocmd vimenter * if !argc() | NERDTree | endif
endif

" php-doc
" ---------
let g:pdv_cfg_Author="Meck <yesmeck@gmail.com>"
let g:pdv_cfg_Copyright="2011 Meck"
let g:pdv_cfg_License=""

" Session
" ---------
let g:session_autosave = 'no'

" Tagbar
" --------
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/bin/jsctags'
\ }
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=26

" MiniBufExpl
" ------------
let g:miniBufExplUseSingleClick = 1
