" AIRLINE
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif


" KEYBINDINGS

" Back to normal mode
imap jj <Esc>
tnoremap <Esc> <C-\><C-n>

" Pane switching
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Space as leader
let mapleader=" "

" Toggle NERDTree quickly
nmap <Leader>t :NERDTreeToggle<CR>


" OTHER
" Show nerdtree bookmarks on startup
let NERDTreeShowBookmarks=1

" BEHAVIOUR
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set incsearch

" LOOKS
set number
set nowrap
set noshowmode
set cursorline
set scrolloff=10
set guifont=Inconsolata\ for\ Powerline:h15 
set background=dark
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
syntax on

" required for YouCompleteMe
set nocompatible
set encoding=utf-8

" PERFORMANCE
" set scrolljump=5
set synmaxcol=180



" NERDTree
"
" Open NERDTree on startup if there is no file argument
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()

" Automatically show hiden files in NERDTree
let NERDTreeShowHidden=1

nmap <Leader>n :set invrelativenumber<CR>


" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'wesQ3/vim-windowswap'
Plug 'jiangmiao/auto-pairs'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'

call plug#end()

colorscheme gruvbox
