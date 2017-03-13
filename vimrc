source $HOME/.vim/plugins.vim

" Functions {
" Close all buffers
function! CloseAllBufs()
    execute "Bonly"
    execute "Bclose"
endfunction

" Switch buffer
function! BufferSwitch(to)
  if !CanBufferSwitch(bufnr('%'))
    if a:to == 'next'
      bn
    else
      bp
    endif
  else
    echo "Can't switch this buffer."
  endif
endfunction

function! CanBufferSwitch(buf)
  " vimshell
  if match(bufname(a:buf), "[vimshell]")
    return 0
  endif

  " Skip unlisted buffers.
  if buflisted(a:buf) == 0
    return 1
  endif

  " Skip non normal buffers.
  if getbufvar(a:buf, "&buftype") != ''
    return 1
  endif

  " Only show modifiable buffers.
  if getbufvar(a:buf, '&modifiable') != 1
    return 1
  endif

  return 0
endfunction

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
" }

" Auto Commands {
autocmd VimEnter * if !argc() | VimFilerExplorer -status | endif
" Deletes trailing space in file upon write
autocmd BufWritePre * :%s/\s\+$//e

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
autocmd BufRead,BufNewFile {Jsfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*.cap,*.ctl,*.etl,*.ebf} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

autocmd BufRead,BufNewFile *.slim set ft=slim

" set wrap for markdown
autocmd FileType markdown setlocal wrap

" add json syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

autocmd FileType javascript noremap <buffer>  <c-x> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-x> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-x> :call CSSBeautify()<cr>

autocmd FileType make setlocal noexpandtab

if has("gui_running")
  " Automatically resize splits when resizing gvim window
  autocmd VimResized * wincmd =
endif
" }

" Commands {
" Close all buffers
command! Ball call CloseAllBufs()

" Save as root
command! Sudow w !sudo tee % > /dev/null 2>&1

command! W w

command! Q q

command! E VimFiler
" }

" Settings {
" Default VIM colorscheme which works in terminals
colorscheme space-vim-dark

" Enables syntax highlighting
syntax on

" Relative number
set relativenumber

" Changes Leader key into a comma instead of a backslash
let mapleader=","

" Prefents VIM from being nerfed into acting like VI
set nocompatible

set viminfo='1000,f1,:1000,/1000

set history=500

" Share clipboard with system
set clipboard=unnamed

" Highlight background of current line and current column
set cursorline
set cursorcolumn

set colorcolumn=80

" Enable Line Numbers
set nu

" Disable word wrap
set nowrap

" Displays cursor position on bottom right of screen
set ruler

" tab = 2 spaces
set tabstop=2

" Indent to two spaces
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
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.xpm

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>

" Show command in the last line of the screen.
set showcmd

" Always show the statusline
set laststatus=2

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable error beep
set novisualbell
set errorbells

set imcmdline

" Plugin settings
" ==================

" CtrtlP
" ---------
let g:ctrlp_map = '<Leader>p'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bower_components/*,*/node_modules/*        " Linux/MacOSX

" MiniBufExpl
" ------------
let g:miniBufExplUseSingleClick = 1

" Neocomplete
" --------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#force_overwrite_completefunc = 1


" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Typescript
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'

" Neosnippet
" -----------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/.vim/snippets'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Airline
" -------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='violet'

" vim-easy-align
" --------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vroom
" -----
" Use vimshell
let g:vroom_use_vimshell = 1
let g:vroom_test_unit_command = "rake test"
let g:vroom_use_binstubs = 1

" jsx
" ---
let g:jsx_ext_required = 0

" Localvimrc
" ----------
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
" }

" Keymaps {
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Ack
noremap <leader>a :Ack

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gp :Ggrep
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git
nnoremap <Leader>gd :Gdiff<CR>

" Clear search highlight
nnoremap <C-l> :nohlsearch<cr>

" Tab & Shift-Tab move between buffers
noremap <silent> <Tab> :call BufferSwitch('next')<CR>
noremap <silent> <S-Tab> :call BufferSwitch('prev')<CR>

" Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>
map <A-q> :Bclose<CR>

" Closes the current window
nnoremap <silent> <Leader>Q <C-w>c
map <A-w> :q<CR>

" Save the current buffer
map <C-s> :w<CR>

" Search tags in current buffer
map <Leader>t :CtrlPBufTag<CR>

" Search buffers
noremap <leader>b :CtrlPBuffer<cr>

" Disable arrow keys
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

" Toggle menu bar
nnoremap <silent> <f4> :if &guioptions=~'m' \| set guioptions-=m \| else \| set guioptions+=m \| endif<cr>

" Toggle gundo
nnoremap <F5> :GundoToggle<CR>

" Toggle VimFilerExplorer
noremap <F3> :VimFilerExplorer<CR>

" Move lines. http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" ale
let g:ale_echo_msg_format = '%linter%: %s'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\}

" fzf {

" }
map <leader>? :Maps<CR>

" VimFiler {
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ })
" }

let g:extra_whitespace_ignored_filetypes = ['vimfiler']
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$']
" Find file in VimFiler
noremap <leader>f :VimFilerExplorer -find -status<cr>
" }

if filereadable($HOME.'/.vimrc_local')
  source $HOME/.vimrc_local
endif
