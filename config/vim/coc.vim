inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)

let g:coc_global_extensions = [
            \ 'coc-pyright',
            \ 'coc-go',
            \ 'coc-tsserver',
            \ 'coc-html',
            \ 'coc-css',
            \ ]

command! -nargs=0 Format :call CocAction('format')
