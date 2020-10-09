
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
set signcolumn=yes

" Color configurations
if (has("termguicolors"))
 set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1


highlight CursorLineNR guibg=NONE guifg=NONE
highlight SignColumn guibg=NONE gui=bold


syntax on


" ==========
" STATUSLINE
" ==========
" Statusline for when it is visible
set statusline=%{StatuslineGit()}\ %0.50F\ %=%l,%c\ \ %p%%\ %{StatusLineLsp()}\ 
highlight StatusLine guifg=black guibg=#444444

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("vim.lsp.buf_get_clients()[1].name")
  endif

  return ''
endfunction

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0 ? '  '.l:branchname.' ' : ''
endfunction

function! StatusLineLsp()
    let l:ls = LspStatus()
    return strlen(l:ls) > 0 ? ' '.l:ls : ''
endfunction



" =======
" PLUGINS
" =======


call plug#begin('~/.vim/plugged')

" GENERAL
Plug 'tpope/vim-surround'          " Wrap text easily
Plug 'preservim/nerdtree'          " File browser
Plug 'Xuyuanp/nerdtree-git-plugin' " Show git statusses in file browser
Plug 'airblade/vim-gitgutter'      " Show git changes
Plug 'godlygeek/tabular'           " Easy text align


" RUST LANGUAGE SERVER 
Plug 'neovim/nvim-lspconfig'         " Collection of common configurations for the Nvim LSP client
Plug 'tjdevries/lsp_extensions.nvim' " Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/completion-nvim'      " Autocompletion framework for built-in LSP
Plug 'nvim-lua/diagnostic-nvim'      " Diagnostic navigation and settings for built-in LSP


" THEMES
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'jdkanani/vim-material-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'marcopaganini/termschool-vim-theme'
Plug 'godlygeek/csapprox'
Plug 'jacoborus/tender'
Plug 'endel/vim-github-colorscheme'
Plug 'larsbs/vimterial'
Plug 'bcicen/vim-vice'
Plug 'dylanaraps/wal.vim'
Plug 'chriskempson/base16-vim'

call plug#end()


" ======================
" LANGUAGE SERVER CONFIG
" ======================
syntax enable
filetype plugin indent on
colorscheme gruvbox


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

" Trigger completion with <Tab>
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>


" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }



" ========
" NERDTREE
" ========

" Nerd Tree settings
let g:nerdtree_tabs_open_on_gui_startup = 0
map <C-n> :NERDTreeToggle<CR>

" Open nerdtree on startup
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



