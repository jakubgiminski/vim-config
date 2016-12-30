" Enable syntax coloring
syntax enable

" Set the colorscheme
colorscheme atom-dark-256 

" Make backspace behave normally
set backspace=indent,eol,start

" Map the leader key to ,
let mapleader = ','

" Show line numbers
set number

" Enforce 256 colors
set t_CO=256

" Highlight search results
set hlsearch
set incsearch

" Jump to vimrc
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Search highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Autosource vimrc after save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
