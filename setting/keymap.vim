" Key Map
" ----------

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

" Toggle NERD_tree
noremap <silent> <F3> :NERDTreeToggle<CR>

" Find file in NERT tree
noremap <leader>f :NERDTreeFind<cr>

" PhpDoc
noremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>:let g:pdv_cfg_Version=""

" Session
map <Leader>os :OpenSession
map <Leader>so :OpenSession
map <Leader>ss :SaveSession

" Toggle Tagbar
noremap <silent> <Leader>y :TagbarToggle<CR>
noremap <f2> :TagbarToggle<cr>

" Clear search highlight
nnoremap <leader>b :nohlsearch<CR>
nnoremap <cr> :nohlsearch<cr>

" Ctrl Left & Right move between buffers
" (need to find out how to disable this within nerdtree buffer)
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>
map <A-q> :Bclose<CR>

" Closes the current window
nnoremap <silent> <Leader>Q <C-w>c
map <A-w> :q<CR>

" Close other buffers
map <A-b> :Bonly<CR>
map <leader>B :Bonly<CR>

" Save the current buffer
map <C-s> :w<CR>

" Save all opened buffers
map <C-S-s> :wall<CR>


" Moving Between Windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>wo <C-w>o
nnoremap <Leader>wv <C-w>v<C-w>l
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>ww <C-w><C-w>

" Opens an edit command with the path of the currently edited file filled in Normal mode: <Leader>ee
map <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>

" When pressing <leader>cd switch to the directory of the open buffer
" map <Leader>cd :cd %:p:h<CR>
" ,ct = Builds ctags
map <Leader>ct :! ctags -R *<CR>

" ,v = Paste
map <Leader>v "+gP
" ,c = Copy
map <Leader>c "+y
" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>
" ,U = Deletes Unwanted empty lines
map <Leader>U :g/^$/d<CR>
" ,R = Converts tabs to spaces in document
map <Leader>R :retab<CR>

map <Leader>? :Helptags<CR>

" Search tags in current buffer
map <Leader>t :CtrlPBufTag<CR>

" Search buffers
noremap <leader>b :CtrlPBuffer<cr>

" Disable arrow keys
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

" Map jk to <esc>
inoremap jk <esc>

" Toggle menu bar
nnoremap <silent> <f4> :if &guioptions=~'m' \| set guioptions-=m \| else \| set guioptions+=m \| endif<cr>

