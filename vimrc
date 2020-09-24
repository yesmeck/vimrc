if !exists('g:vscode')
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
    let b:deoplete_disable_auto_complete = 1
  endfunction

  " Called once only when the multiple selection is canceled (default <Esc>)
  function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
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

  autocmd BufRead,BufNewFile *.axml set ft=xml

  autocmd BufRead,BufNewFile *.acss set ft=css

  " set wrap for markdown
  autocmd FileType markdown setlocal wrap

  " add json syntax highlighting
  autocmd BufNewFile,BufRead *.json set ft=javascript

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

  if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
  endif

  " Clear search highlight
  nnoremap <C-l> :nohlsearch<cr>

  " Tab & Shift-Tab move between buffers
  noremap <silent> <Tab> :call BufferSwitch('next')<CR>
  noremap <silent> <S-Tab> :call BufferSwitch('prev')<CR>

  nnoremap <Leader>sv :source $MYVIMRC<CR>

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

  " Plugin settings
  " ==================

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

  " Ack
  noremap <leader>a :Ack
  let g:ackprg = 'rg --vimgrep'

  " Deoplete
  " --------------
  let g:deoplete#enable_at_startup = 1
  "
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


  " Lightline
  " --------
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
        \ },
        \ 'component_expand': {
        \   'gitbranch': 'fugitive#head'
        \ },
        \ 'component_type': {
        \   'gitbranch': 'warning',
        \ }
        \ }


  " jsx
  " ---
  let g:jsx_ext_required = 0

  " Localvimrc
  " ----------
  let g:localvimrc_sandbox = 0
  let g:localvimrc_ask = 0

  " ale
  let g:ale_echo_msg_format = '%linter%: %s'

  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'jsx': ['eslint'],
  \}

  " fzf {
  map <leader>t :BTags<CR>
  map <leader>p :Files<CR>
  map <leader>b :Buffers<CR>
  map <leader>? :Maps<CR>
  " respect .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  " }

  " VimFiler {
  let g:vimfiler_as_default_explorer = 1
  call vimfiler#custom#profile('default', 'context', {
        \ 'safe' : 0,
        \ })
  " }

  let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$']
  " Find file in VimFiler
  noremap <leader>f :VimFilerExplorer -find -status<cr>
  " }

  " Neoformat {
  let g:neoformat_javascript_prettier = {
              \ 'exe': 'prettier',
              \ 'args': ['--stdin', '--single-quote', '--trailing-comma', 'es5'],
              \ 'stdin': 1,
              \ }
  " }

  if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
  endif

  " vim-markdown {
  let g:markdown_fenced_languages = ['jsx', 'css']
  " }
  "

  " Goyo {
  let g:goyo_width = 120
  " }
  "

  " vscode-neovim {
  function! s:switchEditor(...)
      let count = a:1
      let direction = a:2
      for i in range(1, count ? count : 1)
          call VSCodeCall(direction == 'next' ? 'workbench.action.nextEditorInGroup' : 'workbench.action.previousEditorInGroup')
      endfor
  endfunction

  nnoremap <silent> <S-Tab> :<C-U>call <SID>switchEditor(v:count, 'next')<CR>
  nnoremap <silent> <S-Tab>: :<C-U>call <SID>switchEditor(v:count, 'prev')<CR>
  " }
endif
