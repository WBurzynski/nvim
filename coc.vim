function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"install coc extesions from marketplace
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-marketplace',
	\ 'coc-terminal',
	\ 'coc-rls',
	\ 'coc-explorer',
	\ 'coc-clangd',
	\]

" coc-explorer
nmap <space>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
imap <C-j> <Plug>(coc-snippets-expand-jump)
nmap <silent> gd <Plug>(coc-definition)
autocmd FileType java nnoremap <leader>i :CocCommand java.action.organizeImports<CR>
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <leader>af :CocFix<CR>
nmap <leader>al :CocList actions<CR>
nnoremap <f2> :CocCommand workspace.renameCurrentFile<CR>
nnoremap <leader>di :CocDiagnostics<CR>
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)

" toggle terminal
nmap <leader>t :CocCommand terminal.Toggle<CR>

" switch source/header 
autocmd FileType cpp nmap <leader>gh :CocCommand clangd.switchSourceHeader<CR>
autocmd FileType c nmap <leader>gh :CocCommand clangd.switchSourceHeader<CR>

nmap <leader>as :CocSearch 
nmap <silent> <leader>= :call CocAction('format')<CR>
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
