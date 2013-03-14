" voogle.vim - Google from vim
" Author:   George Papanikolaou <papanikge@ceid.upatras.gr>
" Version:  1.0
" Use pathogen to install or in plugin/voogle.vim

if exists('g:loaded_voogle') || v:version < 700
  finish
endif
let g:loaded_voogle = 1

" Use this to set a custom search engine, like duck duck go
if !exists("g:search_engine")
    let g:search_engine = "https://encrypted.google.com/search?q="
endif

func! Google(mode)

    " Is the browser defined via configuration?
    if exists("g:voogle_browser") && executable(g:voogle_browser)
        let browser = "!" . g:voogle_browser . " "
    endif

    " Find a browser
    if !exists("browser")
        if executable("chromium")
            let browser = "!chromium "
        elseif executable("chrome")
            let browser = "!chrome "
        elseif executable("firefox")
            let browser = "!firefox "
        elseif executable("links")
            let browser = "!links "
        endif
    endif

    if a:mode == 1
        " Visual selection mode
        " using @x for register x which is yanked with visual selection
        let query = substitute(@x, " ", "+", "g")
        let query = substitute(query, "\n", "", "g")
    else
        " word user cursor mode
        let query = substitute(@x, "\n", "", "g")
    endif

    " Run the command in a new process and silence its output
    exec browser . "\"" . g:search_engine . query . "\" > /dev/null 2>&1 &"
    redraw!
endfunc

" final mappings
nnoremap gs "xyiw:silent call Google(0)<CR>
vnoremap gs "xy:silent call Google(1)<CR>
