call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'rakr/vim-one'
call plug#end()

" Theme
let g:lightline = { 'colorscheme': 'one', }

if (has("termguicolors"))
    set termguicolors
endif

syntax enable
colorscheme one
set background=dark
hi Normal guibg=NONE ctermbg=NONE

" Indentation
set autoindent
set expandtab ts=4 sw=4 ai
set smarttab
set tabstop=4
set softtabstop=4

" Search
set smartcase

" Text Rendering
set linebreak
set scrolloff=3
set wrap

" User Interface
set number relativenumber
set cursorline
set noshowmode
if has('mouse')
    set mouse=a
endif

" Clipboard
set clipboard+=unnamedplus

" Undo
if !isdirectory($HOME."/.cache/nvim_undo")
    call mkdir($HOME."/.cache/nvim_undo", "", 0770)
endif
set undodir=~/.cache/nvim_undo
set undofile
