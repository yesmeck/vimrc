colorscheme darkblue        "Default VIM colorscheme which works in terminals

syntax on                   "Enables syntax highlighting

let mapleader=","           "Changes Leader key into a comma instead of a backslash

set nocompatible            "Prefents VIM from being nerfed into acting like VI
set viminfo='1000,f1,:1000,/1000
set history=500
" Share clipboard with system
set clipboard=unnamedplus
set cursorline              "Highlight background of current line
set colorcolumn=80
"
"------  Visual Options  ------
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

"------  Searching  ------
set incsearch               "Search while typing
" set ignorecase              "Case Insensitive Searching
set smartcase               "Lowercase = case insensitive, any uppercase = case sensitive
set hlsearch                "Highlight all search results

"Indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

"Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>

" Show command in the last line of the screen.
set showcmd

"------  Plugins  ------

" CtrtlP
let g:ctrlp_map = '<Leader>p'

" Hammer
" xdg_open does not work
let g:HammerBrowser = 'chromium'

" localvimrc
let g:localvimrc_ask=0

" NERDTree
let NERDTreeIgnore=['CVS']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
let NERDTreeShowHidden=1

if has("gui_running")
    autocmd vimenter * if !argc() | NERDTree | endif
endif

" php-doc
let g:pdv_cfg_Author="Meck <yesmeck@gmail.com>"
let g:pdv_cfg_Copyright="2011 Meck"
let g:pdv_cfg_License=""

" Session
let g:session_autosave = 'no'

" Tagbar
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/bin/jsctags'
\ }
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=26
