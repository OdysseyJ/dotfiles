" ----------------
" General settings
" ----------------
set nocompatible
filetype off

syntax enable

let mapleader=","

set autoindent
set backspace=indent,eol,start
set backupdir=~/.tmp/vim/backup/
set colorcolumn=80
set copyindent
set cursorline
set directory=~/.tmp/vim/swap/
set encoding=utf-8
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
set pastetoggle=<leader>p
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
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set tabstop=4
set textwidth=79
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

" trailing whitespace del
nnoremap <leader>zz :%s/\s\+$//e<CR>

inoremap <C-c> <Esc>
inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Up> <nop>
inoremap <Right> <nop>

noremap <C-J>   <C-W>j
noremap <C-K>   <C-W>k
noremap <C-H>   <C-W>h
noremap <C-L>   <C-W>l

noremap <C-n> :bp<CR>
noremap <C-m> :bn<CR>

nnoremap td :tabclose<CR>
nnoremap tn :tabnew<CR>
nnoremap th :tabprev<CR>
nnoremap tj :tabfirst<CR>
nnoremap tk :tablast<CR>
nnoremap tl :tabnext<CR>

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
autocmd bufnewfile,bufread *.json set filetype=javascript
autocmd bufnewfile,bufread *.tsx,*jsx set filetype=typescript
autocmd filetype html,htmldjango,htmljinja,jinja,less,css,scss,javascript,typescript,yaml,xml
            \ setlocal ts=2 sts=2 sw=2 colorcolumn=80 smarttab copyindent

" -------
" Plugins
" -------

filetype off
set rtp +=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugin list
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'rstacruz/sparkup'
Plugin 'easymotion/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'Raimondi/delimitMate'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'michaeljsmith/vim-indent-object'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'

" Snippet
Plugin 'honza/vim-snippets'

" Language / Syntax
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'plasticboy/vim-markdown'
Plugin 'othree/html5.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'stephpy/vim-yaml'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'
Plugin 'styled-components/vim-styled-components'
Plugin 'jparise/vim-graphql'
Plugin 'w0rp/ale'

" Theme / Appearance
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

" ---------------
" For mac crontab
" ---------------
autocmd filetype crontab setlocal nobackup nowritebackup

" -----------------
" Plugin: Solarized
" -----------------
"let g:solarized_termcolors=256
set background=dark
try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
endtry

" ----------------
" Plugin: Nerdtree
" ----------------
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeWinSize=40
nmap <leader>nt :NERDTreeFind<CR>
nmap <leader>nn :NERDTreeToggle<CR>

" ---------------
" Plugin: Airline
" ---------------
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" -------------
" Plugin: Ctrlp
" -------------
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = {
   \ 'dir': '\.git$\|\.hg$\|\.svn$\|node_modules$\|bower_components$',
   \ 'file': '\.so$\|\.pyc$\|\.jpe\?g$\|\.gif$\|\.png$\|\.eot$\|\.ttf$\|\.woff$\|\.woff2$\|\.swf$\|\.otf$'
\ }
let g:ctrlp_map = '<leader>t'
let g:ctrlp_max_files = 50000
let g:ctrlp_max_depth = 40
let g:ctrlp_match_window = 'max:20'
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>l :CtrlPLine<CR>

" -------------------
" Plugin: Python mode
" -------------------
let g:pymode_breakpoint_bind = '<leader>pb'
let g:pymode_folding = 0
let g:pymode_lint_checkers = ['pep8']
let g:pymode_lint_ignore = 'W0401,E402,W0611,C901'
let g:pymode_lint_unmodified = 1
let g:pymode_options = 0
let g:pymode_rope = 0
let g:pymode_run_bind = '<leader>pr'

" ----------------
" Plugin: Fugitive
" ----------------
nnoremap <leader>gc :Git checkout 
nnoremap <leader>gm :Git merge 
nnoremap <leader>gb :Git branch 
nnoremap <leader>gg :git 
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gl :Git pull<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gread<CR>

" ------------
" Plugin: Jedi
" ------------
let g:jedi#completions_command = "<C-k>"
let g:jedi#documentation_command = "K"
let g:jedi#goto_assignments_command = "<leader>ja"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#popup_on_dot = 0
let g:jedi#rename_command = "<leader>jr"
let g:jedi#show_call_signatures = 0
let g:jedi#usages_command = "<leader>ju"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0

" ------------------
" Plugin: Easymotion
" ------------------
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase  = 1
map <SPACE> <Plug>(easymotion-s2)

" -------------
" Plugin: Gundo
" -------------
nnoremap <leader>u :GundoToggle<CR>

" -----------------
" Plugin: Gitgutter
" -----------------
let g:gitgutter_max_signs=5000


" ----------
" Plugin: Ag
" ----------
nnoremap <leader>aa :Ag 
nnoremap <leader>as :Ag <cword><CR>

" ---------------
" Plugin: Tabular
" ---------------
nmap <Leader>f= :Tabularize /=<CR>
vmap <Leader>f= :Tabularize /=<CR>
nmap <Leader>f: :Tabularize /:<CR>
vmap <Leader>f: :Tabularize /:<CR>
nmap <Leader>f:: :Tabularize /:\zs<CR>
vmap <Leader>f:: :Tabularize /:\zs<CR>
nmap <Leader>f, :Tabularize /,<CR>
vmap <Leader>f, :Tabularize /,<CR>
nmap <Leader>f<Bar> :Tabularize /<Bar><CR>
vmap <Leader>f<Bar> :Tabularize /<Bar><CR>

" ---------------
" Plugin: vim-jsx
" ---------------
let g:jsx_ext_required = 0
