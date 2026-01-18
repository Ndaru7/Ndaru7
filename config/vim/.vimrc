"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ==== GLOBAL SETTINGS ==== "
set nocompatible
set encoding=utf-8
set noshowmode
set number
set relativenumber
syntax on
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set termguicolors
set mouse=a


" ==== PLUGIN ==== "
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'catppuccin/vim', {'as': 'catppuccin'}
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

call plug#end()


" ==== AUTOSUGGEST THEME [gruvbox]  ==== "
highlight Pmenu         guibg=#3c3836 guifg=#ebdbb2
highlight PmenuSel      guibg=#504945 guifg=#fbf1c7
highlight PmenuSbar     guibg=#282828
highlight PmenuThumb    guibg=#665c54


" ==== LOCAL SETTINGS ==== "
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")) | quit | endif


" ==== KEYMAP ==== "
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
nnoremap <C-n> :NERDTreeToggle<CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)

xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p

" Files
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fo :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fq :CList<CR>    " For quickfix list
nnoremap <leader>fh :Helptags<CR>

" Grep current string
nnoremap <leader>fs :Rg <C-r><C-w><CR>

" Grep input string (fzf prompt)
nnoremap <leader>fg :Rg<Space>

" Grep for current file name (without extension)
nnoremap <leader>fc :execute 'Rg ' . expand('%:t:r')<CR>

" Find files in your Vim config
nnoremap <leader>fi :Files ~/.vim<CR>

let g:coc_global_extensions = [
            \ 'coc-pyright',
            \ 'coc-go',
            \ 'coc-tsserver',
            \ 'coc-html',
            \ 'coc-css',
            \ ]
let g:lightline = {'colorscheme': 'catppuccin_mocha'}
let g:airline_theme = 'catppuccin_mocha'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_inactive_collapse= 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
colorscheme catppuccin_mocha

" ==== FUNCTION ==== "
command! -nargs=0 Format :call CocAction('format')
