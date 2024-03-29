" My VIM Configuration File
" Author: Evgeny Nerush
" Thanks to: Vasilij Kostin, Gerhard Gappmeier (rocarvaj) and Ian Langworth

""" DECORATION AND CONVENIENCE """

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility
set nocompatible
" more powerful backspacing
set backspace=indent,eol,start
" load (reread) files if modified by an external program
set autoread
" enable true colors support
set termguicolors
" turn syntax highlighting on
syntax on
" color scheme
colorscheme afterglow
" highlight current line with colors
set cursorline
" show the cursor (line, column) at the bottom right corner
set ruler
" highlight right-border column with color
set colorcolumn=140
" highlight word of search
set hlsearch
" search both upper and lowercase letters...
set ignorecase
" ...but if uppercase is evidently given, ignore lowercase
set smartcase
" change working directory to the directory of the current file
autocmd BufEnter * silent! lcd %:p:h
" turn line numbers on
set number
" highlight matching braces
set showmatch
" jump to the last position when opening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" when you split the window, the new windows will be opened below, not above (for horizontal splitting) and at
" the right side (for vertical splitting)
set splitbelow
set splitright

""" INDENTATION AND STYLE """

" use indentation of previous line
set autoindent
" use intelligent indentation (filetype-based)
filetype plugin indent on
" set tab width to 4 spaces
set tabstop=4
" set indent to 4 spaces
set shiftwidth=4
" expand tabs to spaces
set expandtab
" wrap lines at 140 characters
set textwidth=140

""" KEYBOARD SHORTCATS """

" use <F4> to open terminal in vertically splitted window
map <F4> :vert terminal <CR>
" use <F5> to compile/interpret the current file, if possible...
map <F5> :make! % <CR>
" ...by setting vim's make command to:
autocmd filetype tex setlocal makeprg=make\ %<
autocmd filetype python setlocal makeprg=python3

" turn spellcheck on/off with <F2>
map <F2> :setlocal spell! spelllang=en <CR>

" use F3 to change the colorscheme, for the colorschemes used see
" https://github.com/rafi/awesome-vim-colorschemes/
map <silent> <F3> :if g:colors_name == "afterglow" <bar> colorscheme anderson
  \ <bar> elseif g:colors_name == "anderson" <bar> colorscheme lightning
  \ <bar> elseif g:colors_name == "lightning" <bar> set background=light <bar> let g:two_firewatch_italics=1 <bar> colorscheme two-firewatch
  \ <bar> elseif g:colors_name == "two-firewatch" <bar> colorscheme afterglow
  \ <bar> endif <CR>
