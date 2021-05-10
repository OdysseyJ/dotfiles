"Plug list
call plug#begin()
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" airline
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
Plug 'w0rp/ale'

" indent
Plug 'Yggdroot/indentLine'

" smooth scroll
Plug 'terryma/vim-smooth-scroll'

" multi cursor
Plug 'terryma/vim-multiple-cursors'

" coc.nvim
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" vim surround
Plug 'tpope/vim-surround'

" vim theme
Plug 'mhartington/oceanic-next'

call plug#end()

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

"" Ctrl+n NERD Tree Toggle
map <C-t> :NERDTreeToggle<CR>

" hidden file show tree
let NERDTreeShowHidden=1

"" Ctrl p ignore list
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$\|node_modules$',
\ 'file': '\v\.(exe|so|dll)$'
\ }


set encoding=UTF-8

"" easir window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"" Indentation rules
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType vue set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType jsx set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType tsx set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType typescript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType less set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType scss set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType css set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
augroup END

"" Git
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gr :Gremove<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gd :Gvdiff<CR>

"" ale linters
let b:ale_linters = {
 \ 'javascript': ['eslint'],
 \ 'typescript': ['eslint']
 \}

let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'

"" ale fixers
let b:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['eslint'],
\ 'tsx': ['eslint'],
\ 'typescript': ['eslint']
\}

let g:ale_fix_on_save = 1

autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx,*.scss ALEFix eslint

" indent line
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif


" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

let g:airline_theme='oceanicnext'

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
