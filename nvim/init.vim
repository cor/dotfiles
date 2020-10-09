
" ===========
" KEYBINDINGS
" ===========

" Back to normal mode
imap jj <Esc>
tnoremap <Esc> <C-\><C-n>

" =========
" BEHAVIOUR
" =========

set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set incsearch
set encoding=utf-8

" =====
" LOOKS
" =====

set showcmd
set number
set nowrap
set noshowmode
set cursorline
set scrolloff=10
syntax on



" =======
" PLUGINS
" =======


call plug#begin('~/.vim/plugged')

" GENERAL
Plug 'tpope/vim-surround'  " Wrap text easily
Plug 'preservim/nerdtree' " File browser
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter' " Show git changes

" RUST LANGUAGE SERVER 
Plug 'neovim/nvim-lspconfig' " Collection of common configurations for the Nvim LSP client
Plug 'tjdevries/lsp_extensions.nvim' " Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/completion-nvim' " Autocompletion framework for built-in LSP
Plug 'nvim-lua/diagnostic-nvim' " Diagnostic navigation and settings for built-in LSP

call plug#end()


" ======================
" LANGUAGE SERVER CONFIG
" ======================
syntax enable
filetype plugin indent on


" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
" set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'nvim_lsp'

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

EOF


" ========
" NERDTREE
" ========

" Nerd Tree settings
let g:nerdtree_tabs_open_on_gui_startup = 0
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
