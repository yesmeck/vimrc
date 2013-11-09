" Auto Commands
" --------------

" Deletes trailing space in file upon write
autocmd BufWritePre * :%s/\s\+$//e

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
autocmd BufRead,BufNewFile {Jsfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

autocmd BufRead,BufNewFile *.slim set ft=slim

" set wrap for markdown
autocmd FileType markdown setlocal wrap

" add json syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

" These prevent accidentally loading files while in the NERDTree panel
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

autocmd ColorScheme * call SetMBPColors()

autocmd FileType javascript noremap <buffer>  <c-l> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-l> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-l> :call CSSBeautify()<cr>

if has("gui_running")
  " Automatically resize splits when resizing gvim window
  autocmd VimResized * wincmd =
endif
