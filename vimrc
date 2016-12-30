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

" Make new horizontal splits appear on the bottom
set splitbelow

" Make new vertical splits appear on the right
set splitright

" Remap moving around splits
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Jump to vimrc
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Search highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Autosource vimrc after save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
