"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" <Required>
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.config/nvim/dein'))
call dein#add('Shougo/dein.vim')
" </Required>

" Plugins
call dein#add('robbles/logstash.vim')
call dein#add('diepm/vim-rest-console')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('honza/vim-snippets')
call dein#add('SirVer/ultisnips')
call dein#add('tpope/vim-fugitive')
call dein#add('jpo/vim-railscasts-theme')
call dein#add('morhetz/gruvbox')
call dein#add('bling/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('scrooloose/nerdtree.git')
call dein#add('ryanoasis/vim-devicons')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('rking/ag.vim')
call dein#add('slim-template/vim-slim.git')
call dein#add('tpope/vim-sleuth.git')
call dein#add('tpope/vim-surround.git')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-haml')
call dein#add('tpope/vim-endwise')
call dein#add('dbakker/vim-projectroot')
call dein#add('christoomey/vim-tmux-runner')
call dein#add('thoughtbot/vim-rspec')
call dein#add('janko-m/vim-test')
call dein#add('kana/vim-textobj-user')
call dein#add('nelstrom/vim-textobj-rubyblock')
call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-projectionist')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('sjl/gundo.vim')
call dein#add('Shougo/vimshell')
call dein#add('fatih/vim-go')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('pangloss/vim-javascript')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('mxw/vim-jsx')
call dein#add('hashivim/vim-terraform')


" Deoplete START
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1
" Deoplete END

call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
" <Required>
call dein#end()
filetype plugin indent on
" </Required>

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

syntax enable
set number
set ignorecase
set nobackup
set nowritebackup
set noswapfile
set shiftround
set expandtab
set diffopt=vertical 
set clipboard=unnamed
set background=dark
colorscheme gruvbox
set guifont=Sauce\ Code\ Pro\ Nerd\ Font:h14
set encoding=utf8
let &colorcolumn=join(range(81,999),",")
:hi CursorLine   cterm=underline ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Javascript setup
let g:jsx_ext_required = 0

"Indentation Settings
autocmd Filetype c setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd Filetype ruby setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 autoindent

" Key Mappings
noremap <C-Up> :lp<CR>
noremap <C-Down> :lne<CR>
nnoremap \ :ProjectRootExe :Ag<space>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

" Leader Mappings
let mapleader = ","
nnoremap <leader><space> :noh<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <Leader>c :set cursorline!<CR>
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Ruby / Rails test setup
let test#strategy = "vtr"
map <Leader>tf :TestFile<CR>
map <Leader>tn :TestNearest<CR>
map <Leader>tl :TestLast<CR>
map <Leader>ta :TestSuite<CR>
map <leader>rf :VtrFocusRunner<CR>
map <leader>sl :VtrSendLinesToRunner<CR>
map <leader>sf :VtrSendFile<CR>
map <leader>or :VtrOpenRunner{'orientation': 'h', 'percentage': 50}<CR>
map <leader>ra :VtrAttachToPane<CR>
map <leader>rr :VtrSendCommand<CR>
map <leader>ut :GundoToggle<CR>
let g:VtrUseVtrMaps = 1

" Golang leader mapings
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <Leader>gd :GoDoc<CR>
au FileType go nmap <Leader>gl :GoLint<CR>
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>ga :GoAlternate!<CR>
au FileType go nmap <Leader>dec :GoDeclsDir<CR>
au FileType go nmap <Leader>de :GoDecls<CR>

" Vim rest console configs
let g:vrc_allow_get_request_body = 1
let g:vrc_curl_opts={
	\'--silent': ''
\}

" vim-go setup
let g:go_auto_sameids = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor
au filetype go inoremap <expr> <silent> <tab> Smart_TabComplete()

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" The Silver Searcher Setup
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" CTRLP Setup
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

" Airline Setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_theme='bubblegum'
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
nmap <leader>[ <Plug>AirlineSelectPrevTab
nmap <leader>] <Plug>AirlineSelectNextTab

" TMUX Settings
" Vertical bar in insert mode for tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Misc
autocmd BufWritePre *.py :%s/\s\+$//e

" Language Server Client Setup BEGIN

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/bin/pyls']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" Language Server Client Setup END

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='/Users/jonathar/.config/nvim/snips'

let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]
let g:UltiSnipsSnippetsDir="~/.vim/snips"

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
