set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'klen/python-mode.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'rking/ag.vim'
Plugin 'tomtom/tlib_vim.git'
Plugin 'sirver/ultisnips.git'
Plugin 'MarcWeber/vim-addon-mw-utils.git'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'tpope/vim-sleuth.git'
Plugin 'slim-template/vim-slim.git'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-haml'
Plugin 'dbakker/vim-projectroot'
Plugin 'flazz/vim-colorschemes'
Plugin 'Raimondi/delimitMate'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end() 
filetype plugin indent on 

if has('gui_running')
	set guifont=Source\ Code\ Pro:h16 
endif

" Terminal settings
set mouse=a
set t_Co=256
set clipboard=unnamed

let &colorcolumn=join(range(81,999),",")

" tab completion in command line
set wildmode=longest,list,full
set wildmenu

syntax on
set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set nobackup
set nowritebackup
set noswapfile

set shiftround
set expandtab
set diffopt=vertical 

syntax on
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" Ruby mode
autocmd Filetype ruby setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

"let g:flake8_cmd="/Users/JRandall/Envs/flake8/bin/flake8"
"autocmd BufWritePost *.py call Flake8()
noremap <C-Up> :lp<CR>
noremap <C-Down> :lne<CR>

" Pymode
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_unmodified = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']

" Remove trailing whitespace
autocmd BufWritePre *.py :%s/\s\+$//e

" vim-airline
set laststatus=2

" emmet-vim
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Leader config
let mapleader = ","
nnoremap <leader><space> :noh<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap \ :ProjectRootExe :Ag<space>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif


" From https://github.com/nelstrom/vim-visual-star-search
" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html

" makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>


" Line bubbling
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv


" Tab completion in insert
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
    else
      return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
