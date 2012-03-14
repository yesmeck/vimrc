"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
let NERDTreeShowHidden=1
noremap <silent> <F3> :NERDTreeToggle<CR>

if has("gui_running")
    autocmd vimenter * if !argc() | NERDTree | endif
endif
