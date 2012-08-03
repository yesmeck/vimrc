" Command
" =========

" Close all buffers
function CloseAllBufs()
    execute "Bonly"
    execute "Bclose"
endfunction
command Ball call CloseAllBufs()

" Save as root
command Sudow w !sudo tee % > /dev/null 2>&1

command W w

command Q q
