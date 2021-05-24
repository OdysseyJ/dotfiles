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
" search
Plug 'ctrlpvim/ctrlp.vim'          " ctrl p search
" auto pair
Plug 'jiangmiao/auto-pairs'        " pairs quotes or braket
" dev icon
Plug 'ryanoasis/vim-devicons'      " dev icons for vim
" tagbar
Plug 'majutsushi/tagbar'           " browse tag plugin
" ale linter
Plug 'dense-analysis/ale'
" commenter
Plug 'scrooloose/nerdcommenter'
" indent
Plug 'Yggdroot/indentLine'
" git
Plug 'zivyangll/git-blame.vim'
" smooth scroll
Plug 'terryma/vim-smooth-scroll'

" multi cursor
Plug 'terryma/vim-multiple-cursors'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'

" vim surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" vim theme
Plug 'mhartington/oceanic-next'

call plug#end()

let mapleader=","
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

" Vim Config
set number
set ai
set si
set shiftwidth=2
set tabstop=2
set ignorecase
set hlsearch
set expandtab

"" NERD Tree Config
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


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

" Theme
syntax enable
colorscheme OceanicNext

" --------------
" Plugin: ALE
" --------------
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['black', 'isort'],
\}
nnoremap <leader>af :ALEFix<CR>
set colorcolumn=89
set textwidth=88
let g:pymode_options_max_line_length = 88
" let g:ale_fix_on_save = 1

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
" Plugin: Jedi
" ------------
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<S-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#added_sys_path = ['/Users/seongwoon/.virtualenvs/queenspark/lib/python2.7/site-packages', '/Users/seongwoon/.virtualenvs/queenspark/src/django-haystack']

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

"" Ctrl p ignore list
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$\|node_modules$',
\ 'file': '\v\.(exe|so|dll)$'
\ }


set encoding=UTF-8

" indent line
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif


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
