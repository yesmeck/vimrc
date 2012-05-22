" Command
" =========

" Close all buffers
function CloseAllBufs()
    execute "Bonly"
    execute "Bclose"
endfunction
command Ball call CloseAllBufs()
