" AIRLINE
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


" KEYBINDINGS
imap jk <Esc>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nmap <silent> <F3> :NERDTreeToggle<CR>

" OTHER
" Show nerdtree bookmarks on startup
let NERDTreeShowBookmarks=1

" BEHAVIOUR
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set incsearch

" LOOKS
set number
set nowrap
set cursorline
set scrolloff=10
syntax on

" required for YouCompleteMe
set nocompatible
set encoding=utf-8

" PERFORMANCE
" set scrolljump=5
set lazyredraw
set synmaxcol=180

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
Plug 'vim-airline/vim-airline'

call plug#end()
