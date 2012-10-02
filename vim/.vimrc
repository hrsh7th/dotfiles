
" ----------
" Initialize. {{{
" ----------
  if &compatible
    set nocompatible
  endif

  let s:is_win = has('win32') || has('win64')
  let s:is_mac = !s:is_win && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')
  let s:is_linux = !s:is_win && !s:is_mac

  if s:is_win
    let $MYVIMRUNTIME=expand('~/vimfiles')
  else
    let $MYVIMRUNTIME=expand('~/.vim')
  endif

  if s:is_win
    set shellslash
  endif
" }}}

" ----------
" NeoBundle. {{{
" ----------

  " ----------
  " Initialize. {{{
  " ----------
    if has('vim_starting')
      filetype plugin off
      filetype indent off
      execute 'set runtimepath+=' . expand('$MYVIMRUNTIME/bundle/neobundle.vim')
      call neobundle#rc(expand('$MYVIMRUNTIME/bundle'))
    endif
  " }}}

  " ----------
  " Plugin List. {{{
  " ----------
    NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
    NeoBundle 'git://github.com/Shougo/echodoc.git'
    NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
    NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
    NeoBundle 'git://github.com/Shougo/neocomplcache.git'
    NeoBundle 'git://github.com/Shougo/unite.vim.git'
    NeoBundle 'git://github.com/Shougo/vimfiler.git'
    NeoBundle 'git://github.com/Shougo/vimproc.git'
    NeoBundle 'git://github.com/Shougo/vimshell.git'
    NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
    NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
    NeoBundle 'git://github.com/hrsh7th/unite-todo.git'
    NeoBundle 'git://github.com/hrsh7th/vim-better-css-indent.git'
    NeoBundle 'git://github.com/hrsh7th/vim-insert-point.git'
    NeoBundle 'git://github.com/hrsh7th/vim-neco-calc.git'
    NeoBundle 'git://github.com/hrsh7th/vim-neco-snippets.git'
    NeoBundle 'git://github.com/hrsh7th/vim-unite-vcs.git'
    NeoBundle 'git://github.com/jelera/vim-javascript-syntax.git'
    NeoBundle 'git://github.com/kien/rainbow_parentheses.vim.git'
    NeoBundle 'git://github.com/mattn/webapi-vim.git'
    NeoBundle 'git://github.com/mattn/zencoding-vim.git'
    NeoBundle 'git://github.com/mbbill/undotree.git'
    NeoBundle 'git://github.com/osyo-manga/shabadou.vim.git'
    NeoBundle 'git://github.com/osyo-manga/vim-watchdogs.git'
    NeoBundle 'git://github.com/pasela/unite-webcolorname.git'
    NeoBundle 'git://github.com/t9md/vim-quickhl.git'
    NeoBundle 'git://github.com/kmnk/vim-unite-giti.git'
    NeoBundle 'git://github.com/thinca/vim-ft-svn_diff.git'
    NeoBundle 'git://github.com/thinca/vim-openbuf.git'
    NeoBundle 'git://github.com/thinca/vim-prettyprint.git'
    NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
    NeoBundle 'git://github.com/thinca/vim-quickrun.git'
    NeoBundle 'git://github.com/tpope/vim-surround.git'
    NeoBundle 'git://github.com/triglav/vim-visual-increment.git'
    NeoBundle 'git://github.com/tyru/caw.vim.git'
    NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
    NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
  " }}}

" }}}

" ----------
" Setting. {{{
" ----------

  " ----------
  " Initialize. {{{
  " ----------
    syntax on
    filetype on
    filetype plugin on
    filetype indent on
  " }}}

  " ----------
  " Search. {{{
  " ----------
    set smartcase
    set ignorecase
    set hlsearch
    set incsearch
  " }}}

  " ----------
  " Edit. {{{
  " ----------
    set virtualedit=all

    set comments=sl:/*,mb:\ *,elx:\ */
    set formatoptions+=rco

    set backspace=2
    set whichwrap=b,s,h,l,<,>,[,]
    set nowrap
    set textwidth=0
    if has('persistent_undo')
      set undodir=~/.vimundo
      set undofile
    endif
    set clipboard+=unnamed
  " }}}

  " ----------
  " Indent. {{{
  " ----------
    set autoindent
    set smartindent
    set cindent
    set expandtab
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
  " }}}

  " ----------
  " Folding. {{{
  " ----------
    set nofoldenable
  " }}}

  " ----------
  " View. {{{
  " ----------
    set t_Co=256
    set scrolloff=3 sidescrolloff=3
    set modeline
    set modelines=1
    set equalalways
    set notitle
    set cursorline
    set cmdheight=2
    set laststatus=2
    set list
    set listchars=tab:.\ ,trail:^
    set ruler
    set showcmd
    set shortmess+=I
    set number
    colorscheme ron
  " }}}

  " ----------
  " Other. {{{
  " ----------
    set pastetoggle=<F9>
    set tags=./.tags;

    set noerrorbells
    set novisualbell
    set t_vb=

    set nobackup
    set hidden
    set noswapfile
    set autoread
    set updatetime=100
    set encoding=utf-8
    set completeopt-=preview
    set mouse=n
  " }}}

  " ----------
  " GUI. {{{
  " ----------
    if has('gui_running')
      set linespace=0
      set iminsert=0
      set imsearch=0
      set nomousefocus
      set ambiwidth=double
      set guioptions-=m guioptions-=T guioptions+=b

      highlight CursorIM guibg=#ff0000 guifg=NONE

      if s:is_win
        set guifont=Consolas:h10:b
        set guifontwide=MigMix_1m:h9:b
      elseif s:is_mac
        set guifont=Menlo:h9
      elseif s:is_linux
        set guifont=Menlo:h9
      endif
    endif
  " }}}

" }}}

" TODO: refactor mappings.
" ----------
" Mapping. {{{
" ----------
  let mapleader="\<Space>"

  " quit window.
  nnoremap <Leader>q :q<Cr>
  nnoremap <Leader>t :tabclose<Cr>
  nnoremap <Leader>! :q!<Cr>

  " save window.
  nnoremap <Leader>w :w<Cr>

  " move window.
  nnoremap <Leader>h <C-w>h
  nnoremap <Leader>j <C-w>j
  nnoremap <Leader>k <C-w>k
  nnoremap <Leader>l <C-w>l

  " move tab.
  nnoremap <Leader><S-l> :tabnext<Cr>
  nnoremap <Leader><S-h> :tabprev<Cr>

  " nohlsearch.
  nmap <Leader><Esc> :nohlsearch<Cr><Plug>(quickhl-reset)

  " move visual line.
  nnoremap j gj
  nnoremap k gk

  " big scroll.
  nnoremap <S-l> 15l
  nnoremap <S-h> 15h
  nnoremap <S-k> 8k
  nnoremap <S-j> 8j
  vnoremap <S-l> 15l
  vnoremap <S-h> 15h
  vnoremap <S-k> 8k
  vnoremap <S-j> 8j

  " quick replace.
  nnoremap <Leader>* *:%s/<C-r>///g<Left><Left>

  " join line.
  nnoremap <C-j> <S-j>x

  " move insert-mode.
  inoremap <C-l> <C-o>l
  inoremap <C-h> <C-o>h

  " using commandline-window.
  nnoremap : q:
  xnoremap : q:

  nnoremap / :<C-u>Unite -buffer-name=line_fast -start-insert line/fast<CR>

  " enter pair.
  inoremap <expr><CR> g:my_pair_enter()

  " delete pair.
  inoremap <expr><BS> g:my_pair_delete()

  " close pair.
  inoremap ( ()<Left>
  inoremap [ []<Left>
  inoremap { {}<Left>
  inoremap ' ''<Left>
  inoremap " ""<Left>

  " VimFiler
  nnoremap <expr><F2> ":VimFilerBufferDir -split -auto-cd -buffer-name=" . g:my_vimfiler_explorer_name . " -winwidth=". g:my_vimfiler_winwidth. " -toggle -no-quit<Cr>"

  " VimShell
  nnoremap <F5>  :VimShell<Cr>

  " Unite
  nnoremap m                :Unite resume<Cr>
  nnoremap <expr><Leader>f ":Unite -silent -immediately -input=" . tolower(expand('<cword>')) . " file_rec/async:". (g:my_unite_project_dir != "" ? g:my_unite_project_dir : "!") . "<Cr>"
  nnoremap <expr><F3>      ":Unite -buffer-name=buffer_tab-file_rec/async -hide-source-names -silent buffer_tab file_rec/async:". (g:my_unite_project_dir != "" ? g:my_unite_project_dir : "!"). "<Cr>"
  nnoremap <F6>             :Unite -buffer-name=vcs_status vcs/status<Cr>
  nnoremap <F7>             :Unite -buffer-name=vcs_log vcs/log<Cr>
  nnoremap <F8>             :Unite -buffer-name=outline -vertical -winwidth=45 outline<Cr>
  nnoremap <F10>            :VimShellTab<Cr>
  nnoremap <F12>            :Unite -buffer-name=process process<Cr>
  nnoremap <Leader>u        :Unite -buffer-name=source -no-start-insert source<Cr>
  nnoremap <Leader>0        :Unite -buffer-name=source -no-start-insert menu:global<Cr>

  " Neocomplcache
  imap <expr><Tab> neocomplcache#sources#snippets_complete#expandable() ?
        \ "\<Plug>(neocomplcache_snippets_expand)"
        \ : (getline('.')[0:col('.')] =~# '^\s*$' ? "\<Tab>" : "\<Plug>(insert_point_next_point)")
  imap <S-Tab> <Plug>(insert_point_prev_point)
  smap <Tab> <Plug>(insert_point_next_point_select)
  smap <S-Tab> <Plug>(insert_point_prev_point_select)
  inoremap ] <C-n>
  inoremap <expr>} getline('.')[0:col('.')] =~# '\s*' ? "}" : "\<C-p>"

  " QuickRun
  nnoremap <Leader>r :<C-u>QuickRun<CR>

  " Caw
  nmap <Leader><Leader> <Plug>(caw:i:toggle)
  vmap <Leader><Leader> <Plug>(caw:i:toggle)

  " Quickhl
  nmap <Leader>m <Plug>(quickhl-toggle)
  vmap <Leader>m <Plug>(quickhl-toggle)

  " Surround
  nnoremap <expr>cis g:my_surround_detect('ci')
  nnoremap <expr>dis g:my_surround_detect('di')
  nnoremap <expr>vis g:my_surround_detect('vi')

" }}}

" ----------
" AutoCmd. {{{
" ----------
  augroup vimrc

  augroup END
" }}}

" ----------
" Plugin. {{{
" ----------
" }}}

