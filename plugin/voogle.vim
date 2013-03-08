" voogle.vim - Google from vim
" Author:   George Papanikolaou <papanikge@ceid.upatras.gr>
" Version:  1.0
" Use pathogen to install or in plugin/voogle.vim

if exists('g:loaded_voogle') || v:version < 700
  finish
endif
let g:loaded_voogle = 1


func! Google(mode)
    " Use this to set a custom search engine, like duck duck go
    let search_engine = "https://encrypted.google.com/search?q="
    " Set the browser (TODO)
    let browser = "!chromium "

    if a:mode == 1
        " Visual selection mode
        " using @x for register x which is yanked with visual selection
        let query = substitute(@x, " ", "+", "g")
        let query = substitute(query, "\n", "", "g")
        exec browser . "\"" . search_engine . query . "\""
    else
        " word user cursor mode
    endif
endfunc

" mappings
" nnoremap gs :silent !chromium "https://encrypted.google.com/search?q="<cword><CR>
nnoremap gs :silent call Google(0)<CR>
vnoremap gs "xy:silent call Google(1)<CR>
