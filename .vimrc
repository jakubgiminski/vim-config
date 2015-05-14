set nocompatible   " Disable vi-compatibility
set t_Co=256

colorscheme xoria256
set guifont=Menlo\ for\ Powerline:h16
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=18
syntax on

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a

" Pathogen init
execute pathogen#infect()

" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" fast wrie
nmap <leader>w :w!<cr>
" Fast quit
nmap <leader>q :q!<cr>

nmap <C-r> :TagbarToggle<CR>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jk <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"easier window navigation

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

nmap <C-b> :NERDTreeToggle<cr>

"Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>

"Show (partial) command in the status line
set showcmd

" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Abbreviations
abbrev pft PHPUnit_Framework_TestCase

abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" Edit todo list for project
nmap ,todo :tabe todo.txt<cr>

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

" CtrlP Stuff
" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

" Open splits
nmap vs :vsplit<cr>
nmap hs :split<cr>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/
filetype plugin on

"Sandbox fn
function! Dummy()
    let name = input('Classname: ')
    exec "normal oClass " . name . " {"
    exec "normal o}"
endfunction

"nmap ,1 :call Dummy()<cr>

" Prepare a new PHP class
function! Class()
    let name = input("Class name? ")
    let namespace = input("Any namespace? ")

    if strlen(namespace)
        exec "normal i<?php namespace " . namespace . ";\<C-m>"
    else
        exec "normal i<?php \<C-m>"
    endif

    "Open class
    exec "normal iclass " . name . " {\<C-m>}\<C-[>O\<C-[>"
    exec "normal i\<C-M>    public function __construct()\<C-M>{\<C-M>\<C-M>}\<C-[>"
endfunction
nmap ,1  :call Class()<cr>

" Prepare public function
function! PublicFunction()
    let name = input("Function name? ")

    exec "normal ipublic function  " . name . "()"
    exec "normal o{\<C-m>}"
endfunction
nmap ,2  :call PublicFunction()<cr>

" Var_dump & die
function! DD()
    let name = input("What to var_dump? ")

    exec "normal idie(var_dump(" . name . "));\<C-M>"

endfunction
nmap ,d  :call DD()<cr>

" Console.log
function! ConsoleLog()
    let name = input("What to console.log? ")

    exec "normal iconsole.log(" . name . ");\<C-M>"

endfunction
nmap ,cl  :call ConsoleLog()<cr>

"nmap ,modu :! clear && cd ~/Projects/mod/v1.1 && svn update<cr>
