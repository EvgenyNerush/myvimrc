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
" highlight right-border column with color
set colorcolumn=99
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
" when you split the window, the new windows will be opened below (for horizontal splitting) and at
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
" wrap lines at 99 characters
set textwidth=99

""" KEYBOARD SHORTCATS """

" use <F5> to compile/interpret the current file, if possible...
map <F5> :make! % <CR>
" ...by setting vim's make command to:
autocmd filetype cpp setlocal makeprg=make\ %<
autocmd filetype python setlocal makeprg=python3
autocmd filetype haskell setlocal makeprg=stack\ ghc
autocmd filetype tex setlocal makeprg=make\ %<
autocmd filetype markdown setlocal makeprg=markdown\ %\ >\ %<.html

" use <F4> to run appropriate interpreter:
" ipython for py files...
if has("terminal")
    autocmd filetype python map <buffer> <F4> :terminal ipython3 --pylab
else
    autocmd filetype python map <buffer> <F4> :!ipython3 --pylab
endif
" ...ghci for haskell...
if has("terminal")
    autocmd filetype haskell map <buffer> <F4> :terminal stack ghci
else
    autocmd filetype haskell map <buffer> <F4> :!stack ghci
endif
" ...and lua for lua
if has("terminal")
    autocmd filetype lua map <buffer> <F4> :terminal lua
else
    autocmd filetype lua map <buffer> <F4> :!lua
endif

" type \s to open screen session in a terminal
if has("terminal")
    map \s :terminal screen <CR>
else
    map \s :!screen 
endif

" type \r to repeat the last command
if has("terminal")
    map \r :call term_sendkeys("!", "<C-p> <C-j>") <CR><CR>
endif

" turn spellcheck on/off with <F2>
map <F2> :setlocal spell! spelllang=en <CR>

" use F3 to change the colorscheme, for the colorschemes used see
" https://github.com/rafi/awesome-vim-colorschemes/
map <silent> <F3> :if g:colors_name == "afterglow" <bar> colorscheme anderson
  \ <bar> elseif g:colors_name == "anderson" <bar> colorscheme lightning
  \ <bar> elseif g:colors_name == "lightning" <bar> set background=light <bar> let g:two_firewatch_italics=1 <bar> colorscheme two-firewatch
  \ <bar> elseif g:colors_name == "two-firewatch" <bar> colorscheme afterglow
  \ <bar> endif <CR>
