call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " themes for statusline 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'Vimjas/vim-python-pep8-indent'  "better indenting for python

" autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" syntax checker
Plug 'neomake/neomake'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finding
" theme
Plug 'arcticicestudio/nord-vim'
Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plug 'ryanoasis/vim-devicons' " shows icons
call plug#end()

" AUTOCOMPLETION
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect
set pumheight=10
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : "\<CR>"
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'
" Python autocompletion
let g:ncm2_jedi#environment = '/home/philgras/.pyenv' 
" C++ autocompletion
let g:ncm2_pyclang#library_path = '/usr/lib/libclang.so.8'

let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

" standards
filetype indent on

set encoding=utf-8
set fileformat=unix
set shortmess+=c

set mouse=a  " change cursor per mode
set number  " always show current line number
set ignorecase " ignore case in commands
set smartcase  " better case-sensitivity when searching
set wrapscan  " begin search from top of file when nothing is found anymore

set expandtab
set tabstop=4
set shiftwidth=4
set fillchars+=vert:\  " remove chars from seperators
set softtabstop=4
set scrolloff=3

set splitright  " i prefer splitting right and below
set splitbelow

set hlsearch  " highlight search and search while typing
set incsearch

" easy split movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" easy tab movement
nnoremap tn :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>

" remap escape in insert mode
inoremap jk <Esc>

" remap arrow keys in insert mode
inoremap <M-l> <Right>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <Left>

" remap ctrl p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" configure airline and tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1   " fix missing symbols in font

" color scheme nord
set termguicolors
colorscheme nord

" toggle nerdtree on ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
let NERDTreeMapOpenInTab='t<ENTER>'
let NERDTreeShowHidden=1
" Syntax checker
let g:neomake_python_enabled_makers = ['flake8']


