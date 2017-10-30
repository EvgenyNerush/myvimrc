" My VIM Configuration File
" Author: Evgeny Nerush
" Thanks to: Vasilij Kostin and Gerhard Gappmeier (rocarvaj)

""" DECORATION AND CONVENIENCE """

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility
set nocompatible
" load (reread) files if modified by an external program
set autoread
" turn syntax highlighting on
set t_Co=256
syntax on
" color scheme; first trying torte, then apprentice. Thus, if apprentice not present the
" colorscheme would be set to torte
silent! colorscheme torte
silent! colorscheme apprentice
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
set autochdir
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

" use F8 to change the colorscheme
map <F8> :if g:colors_name != "desert" <bar> colorscheme desert <bar> else <bar> silent! colorscheme apprentice <bar> endif <Enter>
" use <F9> to execute a project, if possible...
map <F9> :make! % 
" ...by setting vim's make command to:
" autocmd filetype cpp setlocal makeprg=g++\ -std=c++14
autocmd filetype python setlocal makeprg=python
"autocmd filetype haskell setlocal makeprg=ghc\ --make\ -o\ a.out
autocmd filetype r setlocal makeprg=R\ --slave\ -f
"autocmd filetype tex setlocal makeprg=pdflatex
"autocmd filetype markdown setlocal makeprg=markdown\ %\ >\ %<.html
"autocmd filetype rust setlocal makeprg=cd\ ..\ &&\ cargo\ run
" use <Ctrl+F9> to run appropriate interpreter:
" ipython for py files...
if has("terminal")
    autocmd filetype python map <buffer> <C-F9> :terminal ipython --pylab
else
    autocmd filetype python map <buffer> <C-F9> :!ipython --pylab
endif
" ...ghci for haskell...
if has("terminal")
    autocmd filetype haskell map <buffer> <C-F9> :terminal ghci
else
    autocmd filetype haskell map <buffer> <C-F9> :!ghci
endif
" ...and R for R
if has("terminal")
    autocmd filetype r map <buffer> <C-F9> :terminal R
else
    autocmd filetype r map <buffer> <C-F9> :!R
endif
" use <Ctrl+b> to build with external make command
map <C-b> :!make
" turn spellcheck on with <F12> (en) and Alt+F12 (ru)
map <F12> :setlocal spell spelllang=en
map <M-F12> :setlocal spell spelllang=ru
" turn spellcheck off with Ctrl+F12
map <C-F12> :setlocal nospell
