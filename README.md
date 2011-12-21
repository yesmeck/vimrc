Installation
---
Run these commands in your terminal to fully install this vim setup. There is another step to compile command-t
(instructions coming soon!).

    cd ~
    git clone git@github.com:renownedmedia/Vim-PHP-IDE.git .vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd .vim
    git submodule init
    git submodule update
