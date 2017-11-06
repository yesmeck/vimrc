call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rvm'
Plug 'altercation/vim-colors-solarized'
Plug 'mileszs/ack.vim'
Plug 'bcaccinolo/bclose'
Plug 'ap/vim-buftabline'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'ntpeters/vim-better-whitespace'
Plug 'groenewege/vim-less'
Plug 'tomasr/molokai'
Plug 'Shougo/neosnippet'
Plug 'sjl/gundo.vim'
Plug 'slim-template/vim-slim'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'honza/vim-snippets'
Plug 'osyo-manga/vim-over'
Plug 'AndrewRadev/vim-eco'
Plug 'justinmk/vim-sneak'
Plug 'Shougo/neosnippet-snippets'
Plug 'mustache/vim-mustache-handlebars'
Plug 'luke-gru/vim-riml'
Plug 'othree/html5.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'mbbill/fencview'
Plug 'terryma/vim-multiple-cursors'
Plug 'elixir-lang/vim-elixir'
Plug 'junegunn/vim-easy-align'
Plug 'yesmeck/vim-autoswap'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'skalnik/vim-vroom'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'embear/vim-localvimrc'
Plug 'matthewsimo/angular-vim-snippets'
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'chriskempson/base16-vim'
Plug 'lambdatoast/elm.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neovimhaskell/haskell-vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'jimmyhchan/dustjs.vim'
Plug 'rhysd/vim-crystal'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ujihisa/neco-look'
Plug 'liuchengxu/space-vim-dark'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'posva/vim-vue'
Plug 'w0rp/ale'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'sbdchd/neoformat'
Plug 'junegunn/goyo.vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc', { 'do': 'pip3 install neovim' }
endif

call plug#end()
