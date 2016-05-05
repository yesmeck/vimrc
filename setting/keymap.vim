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

" Clear search highlight
nnoremap <cr> :nohlsearch<cr>

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

" Toggle tagbar
nnoremap <F6> :TagbarToggle<CR>

" Move lines. http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
