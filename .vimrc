set tabstop=4
set shiftwidth=4
set expandtab

set nocompatible
filetype plugin on
syntax on

" Fix colors inside tmux
" Source: https://github.com/tmux/tmux/issues/699
set background=dark
set t_Co=256

set pastetoggle=<F2>


" Nerd Tree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<space>'

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
"nnoremap <space> za

" PEP 8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"    \ set textwidth=79 |

au BufNewFile,BufRead *.go
    \ set noexpandtab

" UTF-8 Encoding
set encoding=utf-8


" To install vim plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

Plug 'scrooloose/nerdtree'            " File explorer
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy file locator
Plug 'itchyny/lightline.vim'          " Better Status Bar
Plug 'tomlion/vim-solidity'           " VIM Solidity syntax highlighting
Plug 'ziglang/zig.vim'                " VIM Syntax for zig
Plug 'jackiekircher/vim-chip8'        " Syntax highlight for Chip8
Plug 'dhruvasagar/vim-table-mode'     " Markdown table formatter
Plug 'powerman/vim-plugin-AnsiEsc'    " vim plugin for ansi colors
Plug 'tpope/vim-fugitive'             " GIT integration

" Testing color schemes
"Plug 'tomasiser/vim-code-dark'
"Plug 'chriskempson/base16-vim'

call plug#end()

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Auto reload, eg. if black modified the file
" Source: https://superuser.com/questions/181377/auto-reloading-a-file-in-vim-as-soon-as-it-changes-on-disk
set autoread
au CursorHold * checktime
