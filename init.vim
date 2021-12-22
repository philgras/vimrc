call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree' " file explorer pane
Plug 'vim-airline/vim-airline' " statusline
Plug 'vim-airline/vim-airline-themes'  " themes for statusline 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'w0rp/ale' " syntax checking
Plug 'davidhalter/jedi-vim' " auto completion
Plug 'ludovicchabant/vim-gutentags' " tag file management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "  fuzzy search
Plug 'junegunn/fzf.vim' " fuzzy search plugin
Plug 'rakr/vim-one' " theme
Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plug 'ryanoasis/vim-devicons' " shows icons
call plug#end()

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

set clipboard=unnamedplus

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

" configure airline and tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1   " fix missing symbols in font

" color scheme nord
set termguicolors
colorscheme one
set background=dark
let g:airline_theme='one'

" toggle nerdtree on ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
let NERDTreeMapOpenInTab='t<ENTER>'
let NERDTreeShowHidden=1

" toggle tagbar on F8
nmap <F8> :TagbarToggle<CR>

" File searchs
map <C-p> :Files<CR>

" Ale Configuration
"""" Better formatting fo worp/ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%] [%...code...%]'
"""" Enable completion where available.
let g:ale_completion_enabled = 1
""" Customize linters that are turned on
let g:ale_linters = {
	\   'python': ['flake8'],
	\}
let g:ale_set_highlights = 0

" Jedi Vim configuration
let g:jedi#popup_on_dot = 0

