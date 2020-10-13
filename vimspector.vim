" enable more convenient shortcuts
let g:vimspector_enable_mappings = 'HUMAN'

" start debugging
nmap <leader>dd :call vimspector#Launch()<CR>

" stop debugging
nmap <leader>dx :VimspectorReset<CR>

" Evaluate expression
nmap <leader>de :VimspectorEval 

" set watch
nmap <leader>dw :VimspectorWatch 

" show pprogram output
nmap <leader>do :VimspectorShowOutput 

" override start debugging for java
autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>
