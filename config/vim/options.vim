set nocompatible
set encoding=utf-8
set noshowmode
set number
set relativenumber
syntax on
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set mouse=a

autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd StdinReadPre * let s:std_in=1
