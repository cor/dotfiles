" AIRLINE
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif


" KEYBINDINGS

" Back to normal mode
imap jj <Esc>
tnoremap <Esc> <C-\><C-n>

" Space as leader
let mapleader=" "

" Pane switching
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" File/tab opening
nmap <Leader>p <C-p>
nmap <Leader>o :tabnew<CR>
nmap <Leader>i :tabnew<CR>:term<CR>


" Toggle NERDTree quickly
nmap <Leader>t :NERDTreeToggle<CR>

" Remove whitespace at end of line
nmap <Leader>w :%s/\s\+$//e<CR>

" Expand emmet code
nmap <Leader>e <C-y>,

" Relative numbers
nmap <Leader>n :set invrelativenumber<CR>

" Quickly replay 'q' macro
nmap <Leader>q @q

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
		NERDTreeToggle
	end
endfunction

autocmd VimEnter * call StartUp()

" Automatically show hiden files in NERDTree
let NERDTreeShowHidden=1


" Auto create parent dirs on file save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END



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
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

colorscheme gruvbox
