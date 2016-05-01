set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'easymotion/vim-easymotion'

Plugin 'vim-airline/vim-airline'

Plugin 'Valloric/YouCompleteMe'

Plugin 'tmhedberg/SimpylFold'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'scrooloose/syntastic'

Plugin 'nvie/vim-flake8'

Plugin 'bitc/vim-bad-whitespace'
" All of your Plugins must be added before the following line
call vundle#end()            " required
set runtimepath^=~/.vim/bundle/ctrlp.vim
filetype plugin indent on    " required
" This vimrc is only for education purpose, if used as it is may explode your
" screen and kill kittens.

" Key mappings in this vimrc

" <F3>  - toggle NERDTree
" <F4>  - Paste mode toggle
" <F5>  - calls ClangUpdateQuickFix()
" <F8>  - Toggles tagbar
" <F11> - toggles numbering

" <space> - toggles current fold
" <leader>n - Next buffer
" <leader>p - Previous buffer
" <leader>q - Opens quickfix window
" <leader>vi - Opens .vimrc to quickly edit it
" <leader>sv - Sources .vimrc
" <leader>" - Double quote current word
" <leader>' - Single quote current word
" <leader><space> - clears search highlighting

" first things first
set nocompatible
set encoding=utf-8
let g:mapleader="," " , is leader

" colors {{{
set t_Co=256 "256 colors
colorscheme solarized 
set background=dark
highlight CursorLine term=none cterm=none
highlight SignColumn term=underline ctermfg=250 ctermbg=235 guifg=DarkBlue guibg=Grey
syntax enable "syntax highlighting
" }}}

" spaces and tabs {{{
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
"set cindent
set smartindent
" }}}

" UI config {{{
set number
set relativenumber
set cursorline
filetype plugin on
set wildmenu
set showmatch
set laststatus=2
set noshowmode
set modelines=1
set scrolloff=5
" }}}

" Searching {{{
set incsearch
set hlsearch
nnoremap <silent> <leader><space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
" }}}

" CtrlP {{{
let g:ctrlp_extensions = ['tag', 'quickfix']
let g:ctrlp_switch_buffer = 0
"}}}

" NERDTree {{{
let g:NERDTreeWinSize = 40
let g:NERDTreeDirArrows = 0
nnoremap <silent> <F3> :NERDTreeToggle<CR>
"}}}

" Key mappings {{{
nnoremap <silent> <F4> :set paste!<CR>
nnoremap <silent> <F11> :set relativenumber!<CR>
nnoremap <silent> <F8> :TagbarToggle<cr>
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>p :bprevious<CR>
nnoremap <silent> <leader>vi :split $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <silent> <leader>q :copen<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommmit<CR>
nnoremap <leader>a :Gwrite<CR>
"Esc is too far..
inoremap jk <esc>
"}}}

" Syntastic {{{
let g:syntastic_mode_map = { "mode": "passive" }
"}}}

" Tagbar {{{
let g:tagbar_width = 50
let g:tagbar_autoclose = 1
" Useful but little annoying
" let g:tagbar_autopreview = 1
 "}}}

" Auto commands {{{
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    autocmd BufWinEnter * if &previewwindow | setlocal nonumber | endif
    function PreviewWindow()
        setlocal nonumber
    endfunction
endif
"}}}

" UltiSnip Settings {{{
let g:UltiSnipsEditSplit='horizontal'
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"}}}

" clang settings {{{
let g:clang_auto_user_options = "path, .clang_complete, compile_commands.json"
let g:clang_complete_copen = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
"let g:clang_periodic_quickfix = 1
let g:clang_auto_select = 1
set completeopt=menu,menuone,longest
nnoremap <silent> <F5> :call ClangUpdateQuickFix()<CR>
" }}}

" Remove when you get used to it
" Strict Mappings {{{
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
" }}}

" vim:foldmethod=marker:foldlevel=0

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

autocmd BufWritePost *.py call Flake8() # noqa
