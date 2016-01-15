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

" LOOKS
set number
set nowrap
set cursorline
set scrolloff=10
syntax on

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mattn/emmet-vim'

call plug#end()
