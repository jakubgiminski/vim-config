syntax enable

colorscheme desert

set backspace=indent,eol,start
let mapleader = ','
set number
"set linespace 15

set hlsearch
set incsearch

nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
