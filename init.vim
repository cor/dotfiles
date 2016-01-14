
" KEYBINDINGS
imap jk <Esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <silent> <F3> :NERDTreeToggle<CR>

" OTHER
" Show nerdtree bookmarks on startup
let NERDTreeShowBookmarks=1

" LOOKS
set number
set cursorline
set scrolloff=5
syntax on

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mattn/emmet-vim'

call plug#end()
