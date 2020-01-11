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

Plug 'arakashic/chromatica.nvim' " cpp syntax highlighting
Plug 'numirias/semshi' "python syntax highlighting

" syntax checker
Plug 'neomake/neomake'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finding
" theme
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
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

" standards
filetype on

if has("autocmd")

    " setlocal changes functionality only for current buffer
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

endif

set encoding=utf-8
set fileformat=unix
set shortmess+=c

set mouse=a  " change cursor per mode
set number  " always show current line number
set ignorecase " ignore case in commands
set smartcase  " better case-sensitivity when searching
set wrapscan  " begin search from top of file when nothing is found anymore

set expandtab  " represents tabs with spaces
set tabstop=4  " length of a tab character in columns when not being represented by spaces
set shiftwidth=4  " amount of whitespace to insert when using > and < indentation commands
set fillchars+=vert:\  " remove chars from seperators
set softtabstop=4  " backspace removes up to 4 whitespace characters, precedes tabstop command, i.e. when tab is hit 4 spaces are inserted, but softtabstop merges them to tab characters if possible
set scrolloff=3

" script for deleting trailing whitespaces, found on vimcast.org
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

set splitright  " prefer splitting right and below
set splitbelow

set hlsearch  " highlight search and search while typing
set incsearch

" show white spaces with symbols
nmap ws :set list!<CR>
set listchars=tab:▸\ ,trail:-,eol:¬

" insert newline without entering insert mode
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

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
let g:ctrlp_working_path_mode = 'ra'

" configure airline and tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1   " fix missing symbols in font

" color scheme nord
set termguicolors
colorscheme one
set background=dark
" colorscheme nord
let g:airline_theme='one'

" toggle nerdtree on ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
let NERDTreeMapOpenInTab='t<ENTER>'
let NERDTreeShowHidden=1
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
" call neomake#configure#automake('nrwi', 500)


" ####### PYTHON SPECIFIC CONFIGURATION #######

" Syntax checker
let g:neomake_python_enabled_makers = ['flake8']

" Python autocompletion
let g:ncm2_jedi#environment = '/home/diffpriv/.pyenv' 
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'


"####### CPP SPECIFIC CONFIGURATION#########

" C++ autocompletion
let g:ncm2_pyclang#library_path = '/usr/lib/llvm-8/lib/libclang.so.1'
let g:chromatica#libclang_path = '/usr/lib/llvm-8/lib/libclang.so.1'
let g:chromatica#enable_at_startup = 1

" clang neomake syntax checking and semantic check
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-std=c++17', '-Wall', '-pedantic'] 
   \ }

" clang tidy
function! Formatonsave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format-8/clang-format.py
endfunction
autocmd BufWritePre *.hpp,*.h,*.cc,*.cpp call Formatonsave()
