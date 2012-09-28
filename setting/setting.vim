" Settings
" =========
" Default VIM colorscheme which works in terminals
set background=dark
colorscheme solarized
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1

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
set tabstop=2

" Indent to four spaces
set shiftwidth=2

set softtabstop=2

" Switch between unsaved buffers w/o needing to save, preserves history
set hidden

" Let mouse avaliable in terminal
set mouse=a

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

" Always show the statusline
set laststatus=2

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

" Neocomplcache
" --------------
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" Powerline
let g:Powerline_symbols = 'fancy'

" EasyMontion
let g:EasyMotion_leader_key = '<Leader>'
