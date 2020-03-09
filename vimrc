set nocompatible              " be iMproved, required
filetype off                  " required
set shell=bash
set mouse=a

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dbakker/vim-projectroot'
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'avakhov/vim-yaml'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'tmhedberg/simpylfold'
Plug 'majutsushi/tagbar'
Plug 'ambv/black'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'herringtondarkholme/yats.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

filetype plugin indent on    " required
set encoding=utf-8
syntax enable
let base16colorspace=256
set termguicolors

colorscheme gruvbox

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  let g:ackprg = 'ag --vimgrep'
endif

let &colorcolumn=join(range(81,82),",")
highlight ColorColumn ctermfg=white ctermbg=darkred

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

set magic
set showmatch
set ai "auto indent
set si "smart indent
set expandtab " use spaces instead of tabs
set wrap
set number
set ic
syntax on
set nobackup
set noswapfile

" statusline
set laststatus=2
set backspace=indent,eol,start

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

let mapleader = " "

" tag commands
nnoremap <silent> <Leader>tb :TagbarToggle<CR>
nnoremap <leader>p :CtrlPTag<cr>

" Fugitive commands
nnoremap <leader>d :Gvdiff<Return>
nnoremap <leader>du :diffupdate<Return>
nnoremap <leader>dg :diffget<Return>
nnoremap <leader>dp :diffput<Return>
nnoremap <leader>w :Gwrite<Return>
nnoremap <leader>wi :Gwrite!<Return>
nnoremap <leader>r :Gread<Return>

nnoremap <leader>b :Gblame<Return>
nnoremap <leader>s :Gstatus<Return>

nnoremap <c-e> :Explore<Return>
nnoremap <leader>% :vs.<Return>
nnoremap <leader>" :sp.<Return>
nnoremap <leader>q :q<Return>
nnoremap <leader>qa :qa<Return>
nnoremap <leader>qi :qa!<Return>
nnoremap <leader>o :only<Return>

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" CoC settings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
