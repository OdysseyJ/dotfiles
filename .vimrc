set nocompatible                "ViImproved
filetype off

set rtp +=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" let Vundle manage Vundle
" required!-
" My Bundles here:
Plugin 'gmarik/Vundle.vim'
Plugin 'The-NERD-tree'
Plugin 'Tagbar'
Plugin 'ctrlp.vim'
Plugin 'neocomplcache'
Plugin 'Syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-htmldjango_omnicomplete'
Plugin 'jQuery'
Plugin 'indentpython.vim'
Plugin 'indenthtml.vim'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'pathogen.vim'
Plugin 'sudo.vim'
Plugin 'groenewege/vim-less'
Plugin 'rstacruz/sparkup'
Plugin 'The-NERD-Commenter'
Plugin 'burnettk/vim-angular'
Plugin 'fugitive.vim'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'Solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on	" required!
" call pathogen#infect()
execute pathogen#infect()
"
" Brief help
" :BundleList           - list configured bundles
" :BundleInstall(!)     - install(update) bundles
" :BundleSearch(!) foo  - search(or refresh cache first) for foo
" :BundleClean(!)       - confirm(or auto-approve) removal of unused bundles"


" ColorSchemes
let g:solarized_termcolors=256
let g:solarized_bold=1
let g:solarized_contrast="high"
let g:solarized_termtrans=1

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


" set gui setting
if has('gui_running')
  set guifont=Monaco:h13
  set background=dark
endif


" trailing whitespace del
nnoremap <leader>zz :%s/\s\+$//e<CR>

" Change the mapleader from \ to ,
let mapleader=","

" window moving key
noremap <C-J>       <C-W>j
noremap <C-K>       <C-W>k
noremap <C-H>       <C-W>h
noremap <C-L>       <C-W>l
"buffer moving key
noremap <C-n> :bp<CR>
noremap <C-m> :bn<CR>


" The-NERD-tree
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeWinSize=60
let g:nerdtree_tabs_open_on_gui_startup=0


" Tagbar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_width=40
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_systemenc = 'utf-8'


" Airline
let g:airline_theme             = 'solarized'
" let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' | '

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


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers = ['']


" ctrlp
nnoremap <leader>l :CtrlPLine<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRUFiles<CR>
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_by_filename=1
let g:ctrlp_max_depth = 40
let g:ctrlp_use_caching = 1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.yardoc$|\.pyc$\'


" neocomplcache

" Recommended key-mappings.
let g:neocomplcache_enable_at_startup = 0
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" indenthtml
let g:html_indent_script1 = "inc"
let g:html_indent_script1 = "auto"
let g:html_indent_inctags = "html,body,head,tbody,p"
autocmd Filetype html,htmldjango,less,css,scss,javascript setlocal ts=2 sts=2 sw=2 colorcolumn=80 smarttab copyindent


" vim-less
autocmd BufRead, BufNewFile *.less set filetype css
" nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" vim-css3-syntax
augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END

:highlight VendorPrefix guifg=#00ffff gui=bold
:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/


" The-NERD-Commenter
filetype plugin on
let NERDSpaceDelims=1


" Indent-guides
hi IndentGuidesOdd  ctermbg=darkgray
hi IndentGuidesEven ctermbg=grey

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_indent_levels = 30
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

