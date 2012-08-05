" Auto Commands
" --------------

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Deletes trailing space in file upon write
autocmd BufWritePre * :%s/\s\+$//e

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

" set wrap for markdown
autocmd FileType markdown setlocal wrap

" add json syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

" These prevent accidentally loading files while in the NERDTree panel
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

" Indent to 2 spaces in ruby
autocmd FileType ruby setlocal tabstop=2
autocmd FileType ruby setlocal shiftwidth=2
autocmd FileType ruby setlocal softtabstop=2

autocmd ColorScheme * call SetMBPColors()
