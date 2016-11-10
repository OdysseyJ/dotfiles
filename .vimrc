set nocompatible                "ViImproved
filetype off

set rtp +=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" let Vundle manage Vundle
" required!-

" Plugin list
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-htmldjango_omnicomplete'
Plugin 'jQuery'
Plugin 'klen/python-mode'
Plugin 'indentpython.vim'
Plugin 'indenthtml.vim'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'pathogen.vim'
Plugin 'sudo.vim'
Plugin 'groenewege/vim-less'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdcommenter'
Plugin 'burnettk/vim-angular'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'Solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sjl/gundo.vim.git'
Plugin 'hsanson/vim-android'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/matchit.zip'
Plugin 'ap/vim-css-color'
Plugin 'rking/ag.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'godlygeek/tabular'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'leafgarland/typescript-vim'


call vundle#end()
filetype plugin indent on	" required!
" call pathogen#infect()
execute pathogen#infect()

" ===============
" For mac crontab
" ===============
autocmd filetype crontab setlocal nobackup nowritebackup


" ============
" ColorSchemes
" ============
let g:solarized_termcolors=256
let g:solarized_bold=1
let g:solarized_contrast="high"
let g:solarized_termtrans=1

" Change the <leader> from \ to ,
let mapleader=","

syntax enable

set background=dark
colorscheme solarized

set ruler
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set showmatch
set smarttab
set incsearch
set title
set hlsearch
set history=1500
set list
set listchars=tab:>-,trail:-,extends:#
set wrap
set pastetoggle=<leader>p
set encoding=utf-8
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set number
set pastetoggle=<leader>p
set relativenumber
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1500
set ignorecase
set smartcase
set gdefault
set colorcolumn=80
set cursorline
set nojoinspaces
set noswapfile
set splitright
set splitbelow


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


" =============
" The-NERD-tree
" =============

let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
nmap <leader>nt :NERDTreeFind<CR>
nmap <leader>nn :NERDTreeToggle<CR>


" =======
" Airline
" =======
let g:airline_theme                              = 'base16_solarized'
let g:airline#extensions#branch#enabled          = 1
let g:airline#extensions#syntastic#enabled       = 1

let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#show_buffers    = 1
let g:airline#extensions#tabline#left_sep        = ' '
let g:airline#extensions#tabline#left_alt_sep    = ' | '

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" =========
" Syntastic
" =========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_html_checkers            = ['html']


" =====
" ctrlp
" =====
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>l :CtrlPLine<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRUFiles<CR>
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_by_filename   = 1
let g:ctrlp_max_depth     = 40
let g:ctrlp_use_caching   = 1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.yardoc$|\.pyc$\'

set wildignore+=*.so,*.swp,*.zip,*.pyc
set wildignore+=*.o,*.out,*.obj,*.so,*.pyc
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/.sass-cache/*
set wildignore+=*.swp,*~,._*


" ===========
" Python mode
" ===========
let g:pymode_breakpoint_bind = '<leader>pb'
let g:pymode_folding = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_lint_ignore = "W0401"
let g:pymode_lint_unmodified = 1
let g:pymode_options = 0
let g:pymode_rope = 0
let g:pymode_run_bind = '<leader>pr'

" ==========
" indenthtml
" ==========
let g:html_indent_script1 = "inc"
let g:html_indent_script1 = "auto"
let g:html_indent_inctags = "html,body,head,tbody,p"
autocmd Filetype html,htmldjango,less,css,scss,javascript,typescript setlocal ts=2 sts=2 sw=2 colorcolumn=80 smarttab copyindent

" ========
" vim-less
" ========
autocmd BufRead, BufNewFile *.less set filetype css


" ===============
" vim-css3-syntax
" ===============
augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END

:highlight VendorPrefix guifg=#00ffff gui=bold
:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/


" ========
" Fugitive
" ========
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


" ==================
" The-NERD-Commenter
" ==================
filetype plugin on
let NERDSpaceDelims=1


" =============
" Indent-guides
" =============
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size  = 1
let g:indent_guides_start_level = 2
autocmd vimenter,colorscheme * :hi indentguidesodd ctermfg=none ctermbg=235
autocmd vimenter,colorscheme * :hi indentguideseven ctermfg=none ctermbg=235
autocmd filetype python,html,htmldjango,htmljinja,javascript,typescript :IndentGuidesEnable
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']


" ===========
" vim-android
" ===========
let g:android_sdk_path = '/Users/YG_Jung/Downloads/android-sdk'
let g:gradle_path      = '/Users/YG_Jung/Downloads/gradle-2.8'


" =================
" vim-javacomplete2
" =================
autocmd FileType java set omnifunc=javacomplete#Complete
if filereadable("AndroidManifest.xml")
    let g:JavaComplete_SourcesPath = "target/generated-sources/r"
endif


" ========
" Jedi-vim
" ========
let g:jedi#documentation_command = "K"

" ==========
" easymotion
" ==========
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase  = 1


" =====
" Gundo
" =====
nmap <leader>u :GundoToggle<CR>


" =========
" Gitgutter
" =========
let g:gitgutter_max_signs=5000


" ==
" Ag
" ==
let g:ag_working_path_mode="r"
nnoremap <leader>aa :Ag 
nnoremap <leader>as :Ag <cword><CR>


" =======
" Tabular
" =======
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


" =======
" vim-jsx
" =======
let g:jsx_ext_required = 0


" ==============
" Typescript-vim
" ==============
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
