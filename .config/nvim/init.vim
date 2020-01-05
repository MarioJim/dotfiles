call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'rakr/vim-one'
call plug#end()

let g:lightline = { 'colorscheme': 'one', }

if (has("termguicolors"))
    set termguicolors
endif

syntax enable
colorscheme one
set background=dark
hi Normal guibg=NONE ctermbg=NONE

set expandtab ts=4 sw=4 ai
set smarttab
set tabstop=4
set softtabstop=4
set relativenumber
set noshowmode
set clipboard+=unnamedplus
set wrap
set cursorline
