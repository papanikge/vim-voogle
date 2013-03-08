" voogle.vim - Google from vim
" Author:   George Papanikolaou <papanikge@ceid.upatras.gr>
" Version:  1.0
" Use pathogen to install or in plugin/voogle.vim

if exists('g:loaded_voogle') || v:version < 700
  finish
endif
let g:loaded_voogle = 1

" Use this to set a custom search engine, like duck duck go
" let g:search_engine = "https://encrypted.google.com/search?q="

" TODO find browser
func! GoogleLine()
    " using @x for register x which is yanked with visual selection
    let query = substitute(@x, " ", "+", "g")
    "   we need visual selection not line
	exe 'silent !chromium . https://encrypted.google.com/search?q=' . l:query
    echo g:search_engine . query
endfunc

" mappings
nnoremap gs :silent !chromium "https://encrypted.google.com/search?q="<cword><CR>
vnoremap gs "xy:call GoogleLine()<CR>
