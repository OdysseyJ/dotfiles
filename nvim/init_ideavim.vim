set nocompatible
filetype off

syntax enable

let mapleader=","

set autoindent
set backspace=indent,eol,start
set copyindent
set cursorline
set clipboard=unnamed
set encoding=UTF-8
set expandtab
set formatoptions=cqnr1
set gdefault
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-,trail:-,extends:#
set nojoinspaces
set number
set pastetoggle=<Leader>p
set relativenumber
set ruler
set scrolloff=1
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smarttab
set softtabstop=4
set splitbelow
set splitright
set statusline=%<%f\                     " Filename
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nv info
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set tabstop=4
set title
set undodir=~/.tmp/vim/undo/
set undofile
set undolevels=1000
set visualbell
set wildignore+=*.o,*.out,*.obj,*.so,*.pyc
set wildignore+=*.so,*.swp,*.zip,*.pyc
set wildignore+=*.swp,*~,._*
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildmenu
set wildmode=list:longest
set wrap
set mouse=a
set number

" trailing whitespace del
nnoremap <Leader>zz :%s/\s\+$//e<CR>

inoremap <C-c> <Esc>
inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Up> <nop>
inoremap <Right> <nop>
inoremap <C-j> <C-d>
inoremap <C-k> <C-u>

noremap <C-J>   <C-W>j
noremap <C-K>   <C-W>k
noremap <C-H>   <C-W>h
noremap <C-L>   <C-W>l

nnoremap H ^
nnoremap L g_

set wildignore+=*.so,*.swp,*.zip,*.pyc
set wildignore+=*.o,*.out,*.obj,*.so,*.pyc
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/.sass-cache/*
set wildignore+=*.swp,*~,._*

autocmd bufnewfile,bufread *.go set filetype=go
autocmd bufnewfile,bufread *.html set filetype=htmldjango
autocmd bufnewfile,bufread *.jinja set filetype=htmldjango
autocmd bufnewfile,bufread *.json,*.jsx,*.tsx set filetype=javascript

" function! FormatList()
"   " Match the list and replace with formatted version
"   '<,'>s/\v\[(\s*('[^']*'|[^,\[\]]+)\s*(,\s*('[^']*'|[^,\[\]]+)\s*)*)\]/\= '[\r' . join(map(split(submatch(1), ',\s*'), 'v:val . ","'), "\r") . '\r]'/g
" endfunction
" function! FormatList()
"   " Match the list and replace with formatted version
"   '<,'>s/\v\[(\s*('[^']*'|[^,\[\]]+)\s*(,\s*('[^']*'|[^,\[\]]+)\s*)*)\]/\=substitute("[\r" . join(split(submatch(1), ',\s*'), ",\r") . ",\r]", '\n', '\r', 'g')/g
" endfunction
" function! FormatList()
"   " Add newlines and commas after each element, and format the list
"   '<,'>s/\v\[(\s*('[^']*'|[^,\[\]]+)\s*(,\s*('[^']*'|[^,\[\]]+)\s*)*)\]/[\r\=join(split(submatch(1), ',\s*'), ",\r") . ",\r]"/g
" endfunction
" function! FormatList()
"   " Match the list and replace with formatted version
"   '<,'>s/\v\[(\s*('[^']*'|[^,\[\]]+)\s*(,\s*('[^']*'|[^,\[\]]+)\s*)*)\]/\= '[' . join(map(split(submatch(1), ',\s*'), 'v:val'), ",\r") . ',\r]'/g
" endfunction

" function! FormatList()
"   " Add newlines and commas after each element, and format the list
"   '<,'>s/\v\[(\s*('[^']*'|[^\[\],]+)\s*(,\s*('[^']*'|[^\[\],]+)\s*)*)\]/\= "[\r" . join(split(submatch(1), '\s*,\s*'), ",\r") . ",\r]"/g
" endfunction
function! FormatList()
  " Surround the selection with brackets and format the list
  normal! I[
  normal! A,
  '<,'>s/,/,<CR>/g
  '<,'>s/\(\[[^]]*\),/\1\r]/g
endfunction

" Map the function to leader + b in visual mode
vnoremap <leader>b :<C-U>call FormatList()<CR>
