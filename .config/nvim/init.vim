" Direcotrio de plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'

call plug#end()

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

syntax enable
set expandtab
set relativenumber
set noshowmode
set clipboard+=unnamedplus
