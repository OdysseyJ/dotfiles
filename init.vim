set nocompatible
filetype off

syntax enable

let mapleader=","

set autoindent
set backspace=indent,eol,start
set copyindent
set cursorline
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

"Plug list
call plug#begin()
" fz
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'     " vim status bar
" git
Plug 'airblade/vim-gitgutter'      " git change status
Plug 'tpope/vim-fugitive'          " vim git wrapper
" tree
Plug 'preservim/nerdtree'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" auto pair
Plug 'jiangmiao/auto-pairs'        " pairs quotes or braket
" dev icon
Plug 'ryanoasis/vim-devicons'      " dev icons for vim
" tagbar
Plug 'majutsushi/tagbar'           " browse tag plugin

Plug 'easymotion/vim-easymotion'   " easy motion

"linter
" Plug 'dense-analysis/ale'


"commenter
Plug 'scrooloose/nerdcommenter'
" indent
Plug 'Yggdroot/indentLine'
" git
Plug 'zivyangll/git-blame.vim'
" smooth scroll
Plug 'terryma/vim-smooth-scroll'

" multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" vim surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" vim theme
Plug 'mhartington/oceanic-next'

call plug#end()

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" customize keymapping
map <Leader>cc <plug>ERDComToggleComment
map <Leader>c<space> <plug>NERDComCommentN


" -------------
" Plugin: easymotion
" -------------
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" -------------
" Plugin: fzf
" -------------

nmap <Leader>F   :Files<CR>
nmap <Leader>f   :GFiles<CR>
nmap <Leader>b   :Buffer<CR>
nmap <Leader>bl  :BLines<CR>
nmap <Leader>l   :Lines<CR>
nmap <Leader>gf  :GFiles<CR>
nmap <Leader>gs  :GFiles?<CR>
nmap <Leader>gco :Commits<CR>
nmap <Leader>gbc :BCommits<CR>
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" ----------------
" Plugin: Nerdtree
" ----------------
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
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

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'c++', 'cpp', 'php', 'rb', 'js', 'css', 'html', 'py'] " enabled extensions with default colors

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['py'] = s:lightGreen " sets the color for .gitignore files


" Theme
syntax enable
colorscheme OceanicNext
highlight Directory guifg=#F5C06F

" --------------
" Plugin: ALE
" --------------
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'python': ['flake8']
" \}
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \   'python': ['black', 'isort'],
" \}
" nnoremap <leader>af :ALEFix<CR>
"
" let g:pymode_options_max_line_length = 88
" let g:ale_fix_on_save = 1
set colorcolumn=89
set textwidth=88


" ---------------
" Plugin: Airline
" ---------------
let g:airline#extensions#tabline#enabled = 1              " vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format
let g:airline_powerline_fonts=1
let g:airline_theme='oceanicnext'

nnoremap <C-S-t> :enew<Enter>         " 새로운 버퍼를 연다
nnoremap <C-h> :bprevious!<Enter>    " 이전 버퍼로 이동
nnoremap <C-l> :bnext!<Enter>        " 다음 버퍼로 이동

" ----------------
" Plugin: Fugitive
" ----------------
nnoremap <leader>gc :Git checkout
nnoremap <leader>gb :Git branch
nnoremap <leader>gm :Git merge
nnoremap <leader>gg :Git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gg :Git blame<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gl :Git pull
nnoremap <silent> <leader>gp :Git push
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gread<CR>

" ------------
" Plugin: Visual Multi
" ------------
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-n>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-n>'           " replace visual C-n

" ------------
" Plugin: Coc
" ------------
let g:python3_host_prog = '/usr/local/bin/python3'
let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-git', 'coc-python', 'coc-tsserver', 'coc-eslint', 'coc-tslint-plugin', 'coc-styled-components', 'coc-prettier']
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <S-space> to trigger completion.
inoremap <silent><expr> <c-]> coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code
xmap <leader>af <Plug>(coc-format)
nmap <leader>af <Plug>(coc-format)

" Renaming
nmap <leader>rn <Plug>(coc-rename)

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Coc-htmldjango
let g:coc_filetype_map = {
  \ 'jinja.html': 'htmldjango',
  \ }

" ------------
" Plugin: Jedi
" ------------
" let g:jedi#goto_command = "<leader>g"
" let g:jedi#goto_assignments_command = "<leader>a"
" let g:jedi#goto_stubs_command = "<leader>s"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<S-Space>"
" let g:jedi#rename_command = "<leader>r"
" let g:jedi#show_call_signatures = 0
" let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#completions_enabled = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#added_sys_path = ['/Users/seongwoon/.virtualenvs/queenspark/lib/python2.7/site-packages', '/Users/seongwoon/.virtualenvs/queenspark/src/django-haystack']

" ----------------
" Plugin: Git-Blame
" ----------------
nnoremap <Leader>m :<C-u>call gitblame#echo()<CR>

" ----------
" Plugin: Ag
" ----------
nnoremap <leader>aa :Ag
nnoremap <leader>as :Ag <cword><CR>

" ----------
" Clipboard
" ----------
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p


set encoding=UTF-8

" indent line
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif


let g:python3_host_prog=$HOME.'/.venv/bin/python3'

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
