" VIM Configuration File
" For C++, Python, Haskell, Julia, R, and Latex and markdown
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
" color scheme
colorscheme torte
" highlight current line...
set cursorline
" ...with colors
"hi CursorLine cterm=NONE,underline
" highlight right-border column...
set colorcolumn=80
" ...with color (see :help ctermbg)
"highlight ColorColumn ctermbg=1
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

""" INDENTATION AND STYLE """

" use indentation of previous line
set autoindent
" use intelligent indentation (filetype-based)
filetype plugin indent on
" disable automatic comment '//' insertion for C++
autocmd filetype cpp,hpp setlocal comments-=:// comments+=f://
" due to 'filetype plugin indent on' tabstop and shiftwidth not working for
" Python (that is guided with PEP8 anyway) and Julia (where tab = 2 spaces if
" vim-julia package is used)
" tab width = 4 spaces
set tabstop=4
" indent with 4 spaces
set shiftwidth=4
" expand tabs to spaces
set expandtab
" wrap lines at 80 characters
set textwidth=80

""" KEYBOARD SHORTCATS """

" set vim's make command to:
autocmd filetype cpp setlocal makeprg=g++\ -std=c++14
autocmd filetype python setlocal makeprg=python
autocmd filetype haskell setlocal makeprg=ghc\ --make\ -o\ a.out
autocmd filetype julia setlocal makeprg=julia
autocmd filetype r setlocal makeprg=R\ --slave\ -f
autocmd filetype tex setlocal makeprg=pdflatex
autocmd filetype markdown setlocal makeprg=markdown\ %\ >\ %<.html
" compile or interpret current file with <F9>
map <F9> :make! %
" run external make command with <Ctrl+b>
map <C-b> :!make
" run a.out with Ctrl+F5
map <C-F5> :!./a.out
" run ipython with Ctrl+F9 for py files...
autocmd filetype python map <buffer> <C-F9> :!ipython --pylab
" ...or run ghci if filetype is haskell...
autocmd filetype haskell map <buffer> <C-F9> :!ghci
" ...or R for *.R
autocmd filetype r map <buffer> <C-F9> :!R
" turn spellcheck on with <F12> (en) and Alt+F12 (ru)
map <F12> :setlocal spell spelllang=en
map <M-F12> :setlocal spell spelllang=ru
" turn spellcheck off with Ctrl+F12
map <C-F12> :setlocal nospell

