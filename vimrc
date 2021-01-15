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
autocmd bufnewfile,bufread *.json,*.jsx,*.tsx set filetype=javascript
autocmd filetype html,htmldjango,htmljinja,jinja,less,css,scss,javascript,yaml,xml
            \ setlocal ts=2 sts=2 sw=2 colorcolumn=80 smarttab copyindent

" -------
" Plugins
" -------

filetype off
set rtp +=~/.vim/bundle/Vundle.vim/
set rtp +=/usr/local/bin/fzf
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugin list
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'rstacruz/sparkup'
Plugin 'easymotion/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'Raimondi/delimitMate'
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'nathanaelkane/vim-indent-guides'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Tmux
Plugin 'christoomey/vim-tmux-navigator'

" Snippet
Plugin 'honza/vim-snippets'

" Language / Syntax
Plugin 'pangloss/vim-javascript'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'plasticboy/vim-markdown'
Plugin 'othree/html5.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'stephpy/vim-yaml'
Plugin 'fatih/vim-go'
Plugin 'styled-components/vim-styled-components'
Plugin 'jparise/vim-graphql'
Plugin 'w0rp/ale'
Plugin 'vim-syntastic/syntastic.git'

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
let g:solarized_termcolors=256
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
" Plugin: fzf
" -------------

nmap <leader>f   :Files<CR>
nmap <leader>b   :Buffer<CR>
nmap <leader>bl  :BLines<CR>
nmap <leader>l   :Lines<CR>
nmap <leader>gf  :GFiles<CR>
nmap <leader>gs  :GFiles?<CR>
nmap <leader>gco :Commits<CR>
nmap <leader>gbc :BCommits<CR>
let g:fzf_preview_window = ['right:50%', 'ctrl-/']


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
let g:pymode_python = 'python'


" ----------------
" Plugin: Fugitive
" ----------------
nnoremap <leader>gc :Git checkout 
nnoremap <leader>gb :Git branch 
nnoremap <leader>gm :Git merge 
nnoremap <leader>gg :Git 
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gl :Git pull 
nnoremap <silent> <leader>gp :Git push 
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gread<CR>

" ------------
" Plugin: Jedi
" ------------
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0


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
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:<CR>
vmap <Leader>t: :Tabularize /:<CR>
nmap <Leader>t:: :Tabularize /:\zs<CR>
vmap <Leader>t:: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,<CR>
vmap <Leader>t, :Tabularize /,<CR>
nmap <Leader>t<Bar> :Tabularize /<Bar><CR>
vmap <Leader>t<Bar> :Tabularize /<Bar><CR>


" ---------------
" Plugin: tagbar
" ---------------
nmap <Leader>ta :TagbarToggle<CR>


" ---------------
" Plugin: vim-jsx
" ---------------
let g:jsx_ext_required = 0


" ---------------
" Plugin: vim-jsx-pretty
" ---------------
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_template_tags = ['html', 'jsx', 'js']
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 1


" -----------------
" Plugin: Syntastic
" -----------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" -----------
" Plugin: Ale
" -----------
let b:ale_linters = {'javascript': ['eslint']}


" ---------------------
" Plugin: indent-guides
" ---------------------

let g:indent_guides_auto_colors = 1
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=blue
