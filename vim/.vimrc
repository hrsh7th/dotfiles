scriptencoding utf-8
set nocompatible

" ----------
" Environment. {{{
" ----------
  let s:is_win = has('win32') || has('win64')
  let s:is_mac = !s:is_win && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')
  let s:is_linux = !s:is_win && !s:is_mac
  if s:is_win
    set shellslash
    let $MYVIMRUNTIME = expand('~/vimfiles')
  endif
  if s:is_mac
    let $MYVIMRUNTIME = expand('~/.vim')
  endif
  if s:is_linux
    let $MYVIMRUNTIME = expand('~/.vim')
  endif
" }}}

" ----------
" Bundle Plugin. {{{
" ----------
  if has('vim_starting')
    filetype plugin off
    filetype indent off
    execute 'set runtimepath+=' . expand('$MYVIMRUNTIME/bundle/neobundle.vim')
  endif

  call neobundle#begin(expand('$MYVIMRUNTIME/bundle'))
  NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
  NeoBundle 'git://github.com/Shougo/neocomplcache.git'
  NeoBundle 'git://github.com/Shougo/neocomplete.git'
  NeoBundle 'git://github.com/Shougo/neomru.vim.git'
  NeoBundle 'git://github.com/Shougo/neosnippet.git'
  NeoBundle 'git://github.com/Shougo/unite-outline.git'
  NeoBundle 'git://github.com/Shougo/unite.vim.git'
  NeoBundle 'git://github.com/Shougo/vesting.git'
  NeoBundle 'git://github.com/Shougo/vimfiler.git'
  NeoBundle 'git://github.com/Shougo/vimproc', { 'build': { 'windows': 'make -f make_mingw32.mak', 'cygwin': 'make -f make_cygwin.mak', 'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak', } }
  NeoBundle 'git://github.com/Shougo/vimshell.git'
  NeoBundle 'git://github.com/basyura/unite-matcher-file-name.git'
  NeoBundle 'git://github.com/bling/vim-airline.git'
  NeoBundle 'git://github.com/dannyob/quickfixstatus.git'
  NeoBundle 'git://github.com/groenewege/vim-less.git'
  NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
  NeoBundle 'git://github.com/hrsh7th/vim-better-css-indent.git'
  NeoBundle 'git://github.com/hrsh7th/vim-hybrid.git'
  NeoBundle 'git://github.com/hrsh7th/vim-insert-point.git'
  NeoBundle 'git://github.com/hrsh7th/vim-neco-calc.git'
  NeoBundle 'git://github.com/hrsh7th/vim-neco-snippets.git'
  NeoBundle 'git://github.com/hrsh7th/vim-versions.git'
  NeoBundle 'git://github.com/jason0x43/vim-js-indent.git'
  NeoBundle 'git://github.com/jceb/vim-hier.git'
  NeoBundle 'git://github.com/juvenn/mustache.vim.git'
  NeoBundle 'git://github.com/kana/vim-submode.git'
  NeoBundle 'git://github.com/kana/vim-textobj-user.git'
  NeoBundle 'git://github.com/mattn/emmet-vim.git'
  NeoBundle 'git://github.com/mattn/webapi-vim.git'
  NeoBundle 'git://github.com/osyo-manga/shabadou.vim.git'
  NeoBundle 'git://github.com/osyo-manga/vim-watchdogs.git'
  NeoBundle 'git://github.com/othree/html5.vim.git'
  NeoBundle 'git://github.com/pangloss/vim-javascript.git'
  NeoBundle 'git://github.com/plasticboy/vim-markdown.git'
  NeoBundle 'git://github.com/t9md/vim-choosewin.git'
  NeoBundle 'git://github.com/t9md/vim-quickhl.git'
  NeoBundle 'git://github.com/thinca/vim-ft-svn_diff.git'
  NeoBundle 'git://github.com/thinca/vim-prettyprint.git'
  NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
  NeoBundle 'git://github.com/thinca/vim-quickrun.git'
  NeoBundle 'git://github.com/tmhedberg/matchit.git'
  NeoBundle 'git://github.com/tpope/vim-surround.git'
  NeoBundle 'git://github.com/triglav/vim-visual-increment.git'
  NeoBundle 'git://github.com/tyru/caw.vim.git'
  NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
  NeoBundle 'git://github.com/vim-jp/vimdoc-ja.git'
  NeoBundle 'git://github.com/vim-jp/vital.vim.git'
  NeoBundle 'git://github.com/vim-scripts/actionscript.vim--Leider.git'
  NeoBundle 'git://github.com/vim-scripts/pig.vim.git'
  NeoBundle 'git://github.com/vim-scripts/smarty-syntax.git'
  NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
  call neobundle#end()

  syntax on
  filetype plugin on
  filetype indent on
" }}}

" ----------
" General Setting  {{{
" ----------
  set encoding=utf-8
  set updatetime=300
  set autoread
  set hidden
  set nobackup
  set noswapfile
  set virtualedit=all
  set scrolloff=3
  set sidescrolloff=3
  set completeopt-=preview
  set noerrorbells
  set novisualbell
  set t_vb=
  set clipboard+=unnamed
  set diffopt=filler,iwhite
  set wildchar=]
  set splitright
  set tags=./tags;,./.tags;
  set mouse=n
  if has('persistent_undo')
    set undofile
    set undodir=~/.vimundo
  endif
  set pastetoggle=<F9>
" }}}

" ----------
" Visual Setting. {{{
" ----------
  set t_Co=256
  set shortmess+=I
  set equalalways
  set modeline
  set modelines=1
  set wildmenu
  set wildmode=longest:list,list
  set notitle
  set showcmd
  set showtabline=2
  set cmdheight=2
  set laststatus=2
  set nowrap
  set ruler
  set number
  set list
  set listchars=tab:\|\ ,trail:^
  set pumheight=20
  set previewheight=20
  if neobundle#is_installed('vim-hybrid')
    colorscheme hybrid
  else
    colorscheme ron
  endif
" }}}

" ----------
" Search Setting. {{{
" ----------
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
  set suffixesadd=.php,.js,.rb,.java,.json,.md,.as
  set includeexpr=substitute(v:fname,'^\\/','','')
  set path+=./;/
" }}}

" ----------
" Edit Setting. {{{
" ----------
  set autoindent
  set cindent
  set smartindent
  set shiftwidth=4
  set textwidth=0
  set expandtab
  set tabstop=4
  set softtabstop=4
  set backspace=2
  set whichwrap=b,s,h,l,<,>,[,]
" }}}

" ----------
" GUI Setting. {{{
" ----------
set mouse=n
if has('gui_running')
  " line height.
  set linespace=0

  " disable ime.
  set iminsert=0
  set imsearch=0

  " ime color.
  highlight CursorIM guibg=#ff0000 guifg=NONE

  " visible gui parts.
  set guioptions-=m guioptions-=T guioptions+=b guioptions-=e

  " multibyte characters.
  set ambiwidth=double

  " font.
  if s:is_win
    set guifont=Consolas:h10:b
    set guifontwide=MigMix_1m:h9:b
  elseif s:is_mac
    set guifont=Menlo\ Bold:h10
    set transparency=40
  elseif s:is_linux
    set guifont=Menlo:h9
  endif

  " no mouse focus.
  set nomousefocus
endif
" }}}

" ----------
" Key Mapping. {{{
" ----------
  let mapleader="\<SPACE>"

  " general.
  nnoremap q :<C-u>q<CR>
  nnoremap <LEADER>t :<C-u>tabclose<CR>
  nnoremap <LEADER>! :<C-u>q!<CR>
  nnoremap <LEADER>w :<C-u>w<CR>
  nmap ; :
  nmap : ;
  nnoremap @ q
  nnoremap j gj
  nnoremap k gk
  nnoremap < <<<ESC>
  nnoremap > >><ESC>
  vnoremap < <<<ESC>
  vnoremap > >><ESC>
  nnoremap <expr><silent><LEADER><ESC> printf(":\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>",
        \ 'QuickhlManualReset',
        \ 'QuickhlCwordDisable',
        \ 'HierClear',
        \ 'nohlsearch',
        \ 'redraw!')

  " rough move.
  nnoremap H 15h
  nnoremap J 8j
  nnoremap K 8k
  nnoremap L 15l
  vnoremap H 15h
  vnoremap J 8j
  vnoremap K 8k
  vnoremap L 15l

  " apply last command.
  vnoremap <CR> :<UP><CR>

  " move window.
  nnoremap <LEADER>h <C-w>h
  nnoremap <LEADER>j <C-w>j
  nnoremap <LEADER>k <C-w>k
  nnoremap <LEADER>l <C-w>l

  " move tab.
  nnoremap <LEADER>L :<C-u>tabnext<CR>
  nnoremap <LEADER>H :<C-u>tabprev<CR>

  " compatible ^ for us key.
  nnoremap = ^
  vnoremap = ^
  nnoremap + =
  vnoremap + =

  " handy %.
  nmap <TAB> %
  vmap <TAB> %

  " quick replace all.
  nnoremap <LEADER>* *:<C-u>%s/<C-r>///g<C-f><LEFT><LEFT>
  vnoremap <LEADER>* y:<C-u>%s/<C-r>"//g<C-f><LEFT><LEFT>

  " join line.
  nnoremap <C-j> gJ

  " <C-i> <C-o>.
  noremap <C-h> <C-o>
  noremap <C-l> <C-i>

  " move in insert-mode.
  inoremap <C-l> <C-o>l
  inoremap <C-h> <C-o>h

  " gf split.
  nnoremap gf<CR> gf
  nnoremap gfv :<C-u>vsplit<CR>gf
  nnoremap gfs :<C-u>split<CR>gf

  " use command line window.
  nnoremap : q:
  xnoremap : q:

  " register history.
  inoremap <expr> <C-p> unite#start_complete('register')

  " pairs mapping.
  inoremap <expr><CR> g:my_pair_enter()
  inoremap <expr><BS> g:my_pair_delete()
  inoremap ( ()<LEFT>
  inoremap [ []<LEFT>
  inoremap { {}<LEFT>
  inoremap ' ''<LEFT>
  inoremap " ""<LEFT>
  let g:my_pairs = { '(': ')', '[': ']', '{': '}', '"': '"', "'": "'", '<': '>', '>': '<' }
  function! g:my_pair_enter()
    if g:my_pair_is_between()
      return "\<CR>\<UP>\<END>\<CR>"
    endif
    return "\<CR>"
  endfunction
  function! g:my_pair_delete()
    if g:my_pair_is_between()
      return "\<RIGHT>\<BS>\<BS>"
    endif
    return "\<BS>"
  endfunction
  function! g:my_pair_is_between()
    if exists("g:my_pairs[getline('.')[col('.') - 2]]")
      if getline('.')[col('.') - 1] == g:my_pairs[getline('.')[col('.') - 2]]
        return 1
      endif
    endif
    return 0
  endfunction

  " search cursor_word.
  " nnoremap <expr>gf<CR> g:my_cursor_word_search_command('open')
  " nnoremap <expr>gfv g:my_cursor_word_search_command('vsplit')
  " nnoremap <expr>gfs g:my_cursor_word_search_command('split')
  " function! g:my_cursor_word_search_command(action)
  "   let iskeyword = &iskeyword
  "   setlocal iskeyword +=.-/
  "   let word = strlen(expand('<cword>')) ? tolower(expand('<cword>')) : ''
  "   let word = substitute(word, '\.', '/', 'g')
  "   let word = substitute(word, '\/\+', '\/', 'g')
  "   let word = substitute(word, '^\/\|\/$', '', 'g')
  "   let word = substitute(word, '^.*\/', '', 'g')
  "   execute 'setlocal iskeyword=' . iskeyword
  "   return printf(":\<C-u>Unite -buffer-name=file_rec/async -immediately -default-action=%s -input=%s file_rec/async:%s\<CR>",
  "         \ a:action,
  "         \ word,
  "         \ (g:my_unite_project_dir != "" ? g:my_unite_project_dir : "!"))
  " endfunction

  " open explorer.
  nnoremap <expr><F2> g:my_open_explorer_command()
  function! g:my_open_explorer_command()
    return printf(":\<C-u>VimFilerBufferDir -simple -buffer-name=%s -split -direction=topleft -auto-cd -toggle -no-quit -winwidth=%s\<CR>",
          \ g:my_vimfiler_explorer_name,
          \ g:my_vimfiler_winwidth)
  endfunction

  " show project file.
  nnoremap <expr><F3> g:my_project_file_command()
  function! g:my_project_file_command()
    return printf(":\<C-u>Unite -buffer-name=buffer_tab-file_rec/async -silent buffer_tab file_rec/async:%s\<CR>",
          \ (g:my_unite_project_dir != "" ? g:my_unite_project_dir : "!"))
  endfunction

  " versions command.
  nnoremap <LEADER><LEADER> :<C-u>UniteVersions<CR>
  nnoremap <F6> :<C-u>UniteVersions status:!<CR>
  nnoremap <F7> :<C-u>UniteVersions log:%<CR>

  " show outline.
  nnoremap <F8> :<C-u>Unite -buffer-name=outline -vertical -no-quit -winwidth=45 outline<CR>

  " open vimshell.
  nnoremap <F10> :<C-u>VimShellTab<CR>

  " show process.
  nnoremap <F12> :<C-u>Unite -buffer-name=process process<CR>

  " useful menus.
  nnoremap m :<C-u>Unite resume<CR>
  nnoremap <LEADER>u :<C-u>Unite -buffer-name=source -no-start-insert source<CR>
  nnoremap <LEADER>0 :<C-u>Unite -buffer-name=menu -no-start-insert menu:global<CR>

  " tag jump.
  noremap <C-]> :<C-u>Unite -immediately -no-start-insert -buffer-name=tag tag:<C-r>=expand('<cword>')<CR><CR>

  " complete.
  inoremap ] <C-n>
  inoremap <expr>} pumvisible() ? "\<C-p>" : "}"

  " calendar.
  nnoremap <LEADER><BS> :Calendar -position=tab<CR>

  " move cursor.
  imap <expr><TAB> g:my_cursor_move_or_snippet_expand_command()
  function! g:my_cursor_move_or_snippet_expand_command()
    if neosnippet#expandable() || neosnippet#jumpable()
      return "\<PLUG>(neosnippet_expand_or_jump)"
    endif
    if getline('.')[0:col('.')-2] =~# '^\(\t\|\s\)*$'
      return "\<TAB>"
    endif
    return "\<PLUG>(insert_point_next_point)"
  endfunction

  " caw.
  nmap <LEADER>/ <PLUG>(caw:i:toggle)
  vmap <LEADER>/ <PLUG>(caw:i:toggle)

  " quickhl.
  nmap <LEADER><LEADER>m <Plug>(quickhl-cword-toggle)
  nmap <LEADER>m <Plug>(quickhl-manual-this)
  vmap <LEADER>m <Plug>(quickhl-manual-this)

  " replace word by register.
  nnoremap cir ciw<C-r>0<ESC>:<C-u>let@/=@1<CR>:noh<CR>
" }}}

" ----------
" Command. {{{
" ----------
  " CodingStyle.
  let g:my_coding_style = {}
  let g:my_coding_style['s']  = 'setlocal expandtab'
  let g:my_coding_style['t']  = 'setlocal noexpandtab'
  let g:my_coding_style['s2'] = 'setlocal expandtab   tabstop=2 shiftwidth=2 softtabstop=2'
  let g:my_coding_style['t2'] = 'setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2'
  let g:my_coding_style['s4'] = 'setlocal expandtab   tabstop=4 shiftwidth=4 softtabstop=4'
  let g:my_coding_style['t4'] = 'setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4'
  command! -bar -nargs=1 CodingStyle execute get(g:my_coding_style, <f-args>, '')
" }}}

" ----------
" AutoCommand. {{{
" ----------
augroup my-vimrc
  autocmd!

  " insert leave.
  autocmd! InsertLeave * call g:my_insertleave_setting()
  function! g:my_insertleave_setting()
    set nopaste
  endfunction

  " all option.
  autocmd! Filetype * setlocal comments=sl:/*,mb:\ *,elx:\ */ | setlocal formatoptions+=rco"

  " filetype.
  autocmd! BufNewFile,BufRead *.tpl setlocal filetype=html
  autocmd! Filetype tpl setlocal filetype=html
  autocmd! BufNewFile,BufRead *.ejs setlocal filetype=html
  autocmd! Filetype ejs setlocal filetype=html
  autocmd! BufNewFile,BufRead *.as setlocal filetype=actionscript
  autocmd! BufNewFile,BufRead *.pig setlocal filetype=pig
  autocmd! Filetype as setlocal filetype=actionscript
  autocmd! BufNewFile,BufRead *.js setlocal filetype=javascript
  autocmd! BufNewFile,BufRead *.json setlocal filetype=javascript
  autocmd! Filetype js setlocal filetype=javascript
  autocmd! Filetype smarty setlocal filetype=html
  autocmd! Filetype actionscript execute get(g:my_coding_style, 't4', '')
  autocmd! Filetype coffee execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype vim execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype php execute get(g:my_coding_style, 't4', '') | setlocal iskeyword-=$
  autocmd! Filetype html execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype xhtml execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype css execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype scss execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype mkd execute get(g:my_coding_style, 's4', '')

  " javascript.
  autocmd! Filetype javascript call g:my_javascript_settings()
  function! g:my_javascript_settings()
    execute get(g:my_coding_style, 's2', '')
  endfunction

  autocmd! Filetype html call g:my_html_settings()
  function! g:my_html_settings()
    let b:match_words .= ',{\s*if\>:{\s*elseif\>:{\s*else\>:{\s*/if\>,{\s*foreach\>:{\s*foreachelse\>:{\s*/foreach\>,{\s*capture\>:{\s*/capture\>,{\s*strip\>:{\s*/strip\>,{\s*literal\>:{\s*/literal\>'
  endfunction

  " command line window.
  autocmd! CmdwinEnter * call g:my_cmdwinenter_settings()
  function! g:my_cmdwinenter_settings()
    nnoremap <buffer><ESC> :<C-u>q<CR>
    imap <expr><TAB> g:my_cursor_move_or_snippet_expand_command()
    startinsert!
  endfunction

  " starting.
  autocmd! VimEnter * call g:my_vimenter_setting()
  function! g:my_vimenter_setting()
    if !argc()
      if filereadable(expand('$HOME/todo.md'))
        call feedkeys("\<ESC>:edit " . expand("$HOME/todo.md") . "\<CR>zR")
      else
        edit $MYVIMRC
        set filetype=vim
      endif
    endif
  endfunction

  " window layout.
  autocmd! WinLeave * call g:my_window_layout_fix()
  function! g:my_window_layout_fix()
    " window layout fix.
    let current_winnr = bufwinnr(bufnr('%'))
    for winnr in range(1, winnr('$'))
      let bufnr = winbufnr(winnr)
      if getbufvar(bufnr, '&filetype') == 'vimshell'
        execute winnr . 'wincmd w'
        if exists('b:vimshell')
          execute 'wincmd K'
          execute current_winnr . 'wincmd w'
        endif
      endif
    endfor
  endfunction

  " unite.
  if neobundle#is_installed('unite.vim')
    autocmd! FileType unite call g:my_unite_settings()
    function! g:my_unite_settings()
      nmap <buffer><ESC>       <PLUG>(unite_exit)
      nmap <buffer>:q          <PLUG>(unite_exit)
      nmap <buffer><LEADER>q   <PLUG>(unite_exit)
      nmap <buffer>@           <PLUG>(unite_toggle_mark_current_candidate)
      nmap <buffer>a           <PLUG>(unite_append_end)
      nmap <buffer><C-p>       <PLUG>(unite_loop_cursor_up)
      nmap <buffer><C-n>       <PLUG>(unite_loop_cursor_down)
      imap <buffer><C-p>       <PLUG>(unite_insert_leave)
      imap <buffer><C-n>       <PLUG>(unite_insert_leave)
      nnoremap <buffer><expr>e unite#do_action('choosewin/open')
      nnoremap <buffer><expr>s unite#do_action('choosewin/split')
      nnoremap <buffer><expr>v unite#do_action('choosewin/vsplit')
      let s:unite = unite#get_current_unite()
      if s:unite.profile_name == 'todo'
        nnoremap <buffer>N :<C-u>UniteTodoAddSimple<CR>
      endif
    endfunction
  endif

  " vimfiler.
  if neobundle#is_installed('vimfiler')
    autocmd! FileType vimfiler call g:my_vimfiler_settings()
    function! g:my_vimfiler_settings()
      nmap     <buffer><expr><C-h> ':\<C-u>new \| VimFilerCreate -winwidth='. g:my_vimfiler_winwidth. ' -simple -no-quit<CR>'
      nmap     <buffer><expr><CR>  vimfiler#smart_cursor_map("\<PLUG>(vimfiler_expand_tree)", "e")
      nmap     <buffer><TAB>       <PLUG>(vimfiler_choose_action)
      nmap     <buffer>c           <PLUG>(vimfiler_clipboard_copy_file)
      nmap     <buffer>m           <PLUG>(vimfiler_clipboard_move_file)
      nmap     <buffer>p           <PLUG>(vimfiler_clipboard_paste)
      nmap     <buffer>@           <PLUG>(vimfiler_toggle_mark_current_line)
      nmap     <buffer>j           j<PLUG>(vimfiler_print_filename)
      nmap     <buffer>k           k<PLUG>(vimfiler_print_filename)
      nnoremap <buffer>b           :<C-u>Unite -buffer-name=bookmark-vimfiler_history -default-action=cd -no-start-insert bookmark directory_mru<CR>
      nnoremap <buffer>e           :<C-u>call vimfiler#mappings#do_action('choosewin/open')<CR>
      nnoremap <buffer>s           :<C-u>call vimfiler#mappings#do_action('choosewin/split')<CR>
      nnoremap <buffer>v           :<C-u>call vimfiler#mappings#do_action('choosewin/vsplit')<CR>
      nnoremap <buffer><F5>        :<C-u>call vimfiler#mappings#do_current_dir_action('my_project_cd')<CR>
      nnoremap <buffer><F8>        :<C-u>VimFilerTab -double<CR>
      nnoremap <buffer><BS>        :<C-u>call vimfiler#mappings#do_current_dir_action('my_project_root_cd')<CR>
      nnoremap <buffer><LEADER>l   <C-w>l
    endfunction
  endif

  " vimshell.
  if neobundle#is_installed('vimshell')
    autocmd! FileType vimshell call g:my_vimshell_settings()
    function! g:my_vimshell_settings()
      nnoremap <buffer>a GA
      inoremap <buffer><TAB> <NOP>
      inoremap <buffer><expr><TAB> g:my_cursor_move_or_snippet_expand_command()
      inoremap <buffer><expr><C-l> unite#start_complete(['vimshell/history', 'vimshell/external_history'], {
            \ 'start_insert' : 0,
            \ 'default_action': 'insert',
            \ 'select': 0,
            \ 'input' : vimshell#get_cur_text(),
            \ })
      call vimshell#altercmd#define('ls', 'ls -al')
      call vimshell#altercmd#define('ll', 'ls -al')
      call vimshell#altercmd#define('l', 'll')
      call vimshell#hook#add('chpwd', 'my_vimshell_hook_chpwd', 'g:my_vimshell_hook_chpwd')
    endfunction
  endif

  " vimshell int-*.
  if neobundle#is_installed('vimshell')
    autocmd! Filetype int-* call g:my_vimshell_interactive_settings()
    function! g:my_vimshell_interactive_settings()
      nnoremap <buffer>a GA
      inoremap <buffer><TAB> <NOP>
      inoremap <buffer><expr><TAB> g:my_cursor_move_or_snippet_expand_command()
      inoremap <buffer><expr><C-l> unite#start_complete(['vimshell/history', 'vimshell/external_history'], {
            \ 'start_insert' : 0,
            \ 'select': 0,
            \ 'default_action': 'insert',
            \ 'input' : vimshell#get_cur_text(),
            \ })
    endfunction
  endif

  " neocomplete.
  if neobundle#is_installed('neocomplete') && has('lua')
    autocmd! BufRead,BufWritePost * call g:my_neocomplete_settings()
    function! g:my_neocomplete_settings()
      if !index(g:my_neocomplete_ignore_filenames, expand('<abuf>:t'))
        NeoCompleteBufferMakeCache
      endif
    endfunction
  endif
  if neobundle#is_installed('neocomplcache') && !has('lua')
    autocmd! BufRead,BufWritePost * call g:my_neocomplcache_settings()
    function! g:my_neocomplcache_settings()
      if !index(g:my_neocomplete_ignore_filenames, expand('<abuf>:t'))
        NeoComplCacheCachingBuffer
      endif
    endfunction
  endif
augroup END
" }}}

" ----------
" watchdogs setting. {{{
" ----------
  if neobundle#is_installed('vim-watchdogs')
    let g:watchdogs_check_BufWritePost_enable = 1
    let g:quickrun_config = extend(get(g:, 'quickrun_config', {}), {
          \   '_': {
          \     'runner': 'vimproc'
          \   },
          \   'watchdogs_checker/_': {
          \     'outputter/quickfix/open_cmd': ''
          \   }
          \ })
  endif
" }}}

" ----------
" vimfiler setting. {{{
" ----------
  if neobundle#is_installed('vimfiler')
    let g:my_vimfiler_explorer_name = 'explorer'
    let g:my_vimfiler_winwidth = 30
    let g:vimfiler_safe_mode_by_default = 0
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_directory_display_top = 1
    let g:vimfiler_tree_leaf_icon = ' '
    let g:vimfiler_tree_opened_icon = '-'
    let g:vimfiler_tree_closed_icon = '+'
  endif
" }}}

" ----------
" unite setting. {{{
" ----------
  if neobundle#is_installed('unite.vim')
    if !exists('g:my_unite_project_dir')
      let g:my_unite_project_dir = ""
    endif
    let g:unite_data_directory = expand("~/.unite")
    let g:unite_source_grep_default_opts = '-Hni'
    let g:unite_source_grep_max_candidates = 0
    let g:unite_source_file_mru_filename_format = ''
    let g:unite_source_rec_min_cache_files = 0
    let g:unite_source_rec_max_cache_files = 100000
    let g:unite_source_line_enable_highlight = 1
    let g:unite_kind_openable_lcd_command = 'cd'
    call unite#custom#profile('default', 'context', {
          \ 'no_start_insert': 1,
          \ 'start_insert': 0,
          \ 'direction': 'botright',
          \ 'update_time': 200,
          \ 'winheight': 15,
          \ })
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#set_profile('action', 'context', { 'start_insert': 0 })
    call unite#custom#source('buffer_tab,file_rec/async,file_rec/git,file_rec,file_mru', 'sorters', ['sorter_nothing'])
    call unite#custom#source('buffer_tab,file_rec/async,file_rec/git,file_rec,file_mru', 'converters', ['converter_nothing'])
    call unite#custom#source('file,jump_list', 'default_action', 'choosewin/open')
    call unite#custom#source('file_rec/async,file_rec/git,file_rec,file_mru', 'ignore_pattern', join([
          \ '\.git\/',
          \ '\.svn\/',
          \ '\/\(image\|img\)\/',
          \ 'node_modules',
          \ 'vendor'
          \ ], '\|'))
  endif
  " }}}

" ----------
" unite menu source. {{{
" ----------
  if neobundle#is_installed('unite.vim')
    let g:unite_source_menu_menus = {}
    let g:unite_source_menu_menus.global = { 'description': 'global menu.' }
    let g:unite_source_menu_menus.global.command_candidates = [
          \ [ 'NeoSnippetEdit', 'NeoSnippetEdit -split -vertical' ],
          \ [ 'NeoBundleUpdate!', 'Unite neobundle/update:!' ],
          \ [ 'Reverse Line Order', 'g/^/m0' ],
          \ [ 'Remove All ^M', '%s///g' ],
          \ [ 'Format QueryString', 'silent! %s/&amp;/\&/g | silent! %s/&/\r/g | silent! %s/=/\r\t=/g' ],
          \ ]
  endif
" }}}

" ----------
" custom unite filter. {{{
" ----------
  if neobundle#is_installed('unite.vim')
    " matcher_remove.
    let s:filter = { 'name' : 'matcher_my_remove' }
    function! s:filter.filter(candidates, context)
      let candidates = a:candidates
      for s:regex in ['*vimfiler*', '*vimshell*', '.vimrc']
        let s:candidates = filter(a:candidates, 'v:val.word !~# "'. s:regex. '"')
      endfor
      return s:candidates
    endfunction
    call unite#define_filter(s:filter)
    call unite#custom#source('buffer_tab,jump', 'matchers', ['matcher_my_remove', 'matcher_glob'])

    " matcher_unique.
    let s:filter = { 'name' : 'matcher_my_unique' }
    function! s:filter.filter(candidates, context)
      let s:candidates = []
      for s:candidate1 in a:candidates
        let s:found = 0
        for s:candidate2 in a:candidates
          if !(s:candidate1 is s:candidate2) && s:candidate1.action__path == s:candidate2.action__path
            let s:found = 1
          endif
        endfor
        if !s:found
          call add(s:candidates, s:candidate1)
        endif
      endfor
      return s:candidates
    endfunction
    call unite#define_filter(s:filter)
    call unite#custom#source('vimfiler/history', 'matchers', ['matcher_my_unique', 'matcher_glob'])
  endif
" }}}

" ----------
" custom unite action. {{{
" ----------
  if neobundle#is_installed('unite.vim')
    " choosewin/open.
    let s:action = { 'is_selectable' : 0 }
    function! s:action.func(candidate)
      let choice = choosewin#start(filter(range(1, winnr('$')), '!s:is_ignore_window(v:val)'), { 'noop': 1, 'auto_choose': 1 })
      if !empty(choice)
        let tab = choice[0]
        let win = choice[1]
        execute 'tabnext' tab
        execute win 'wincmd w'
      else
        return
      endif
      call unite#take_action('open', a:candidate)
    endfunction
    call unite#custom_action('openable', 'choosewin/open', s:action)

    " choosewin/split.
    let s:action = { 'is_selectable' : 0 }
    function! s:action.func(candidate)
      let choice = choosewin#start(filter(range(1, winnr('$')), '!s:is_ignore_window(v:val)'), { 'noop': 1, 'auto_choose': 1 })
      if !empty(choice)
        let tab = choice[0]
        let win = choice[1]
        execute 'tabnext' tab
        execute win 'wincmd w'
      else
        return
      endif
      call unite#take_action('split', a:candidate)
    endfunction
    call unite#custom_action('openable', 'choosewin/split', s:action)

    " choosewin/vsplit.
    let s:action = { 'is_selectable' : 0 }
    function! s:action.func(candidate)
      let choice = choosewin#start(filter(range(1, winnr('$')), '!s:is_ignore_window(v:val)'), { 'noop': 1, 'auto_choose': 1 })
      if !empty(choice)
        let tab = choice[0]
        let win = choice[1]
        execute 'tabnext' tab
        execute win 'wincmd w'
      else
        return
      endif
      call unite#take_action('vsplit', a:candidate)
    endfunction
    call unite#custom_action('openable', 'choosewin/vsplit', s:action)

    " check ignore window by filetype."
    function! s:is_ignore_window(winnr)
      return index(["unite", "vimfiler", "vimshell"], getbufvar(winbufnr(a:winnr), "&filetype")) >= 0
    endfunction

    " my_project_cd.
    let s:action = { 'is_selectable' : 1 }
    function! s:action.func(candidates)
      let g:my_unite_project_dir = substitute(a:candidates[0].action__path, '\/$', '', 'g')
      let winnr = bufwinnr(bufnr('%'))
      for bufnr in range(1, bufnr('$'))
        if stridx(fnamemodify(bufname(bufnr), ':p'), fnamemodify(g:my_unite_project_dir, ':p')) == -1
          continue
        endif

        let bufwinnr = bufwinnr(bufnr)

        " remove.
        if bufwinnr == -1 && bufexists(bufnr)
          try
            execute 'bdelete ' . bufnr
          catch
          endtry

        " hidden.
        else
          execute bufwinnr . 'wincmd w'
          setlocal bufhidden=delete nobuflisted
        endif
      endfor
      execute winnr . 'wincmd w'
    endfunction
    call unite#custom_action('file_vimfiler_base', 'my_project_cd', s:action)

    " my_project_root_cd.
    let s:action = { 'is_selectable' : 1 }
    function! s:action.func(candidates)
      let s:project_dir = g:my_unite_project_dir
      let s:action_dir = a:candidates[0].action__path
      let s:is_version_control = versions#get_type(s:action_dir) != ''

      if len(s:project_dir) <= 0 && s:is_version_control
        let s:dir = versions#get_root_dir(s:action_dir)
      endif
      if len(s:project_dir) > 0 && !s:is_version_control
        let s:dir = s:project_dir
      endif
      if len(s:project_dir) > 0 && s:is_version_control
        let s:vcs_root_dir = versions#get_root_dir(s:action_dir)
        if len(s:project_dir) > len(s:vcs_root_dir) && fnamemodify(s:project_dir, ':p') != fnamemodify(s:action_dir, ':p')
          let s:dir = s:project_dir
        else
          let s:dir = s:vcs_root_dir
        endif
      endif

      if exists('s:dir')
        let a:candidates[0].action__path = s:dir
        call vimfiler#mappings#cd(s:dir)
      else
        echomsg 'can not found cdable directory.'
      endif
    endfunction
    call unite#custom_action('file', 'my_project_root_cd', s:action)
  endif
" }}}

" ----------
" neosnippet setting. {{{
" ----------
  if neobundle#is_installed('neosnippet')
    if isdirectory($MYVIMRUNTIME. '/bundle/vim-neco-snippets')
      let g:neosnippet#snippets_directory = $MYVIMRUNTIME. '/bundle/vim-neco-snippets'
      let g:neosnippet#disable_runtime_snippets = { '_': 1 }
    endif
  endif
" }}}

" ----------
" neocomplete setting. {{{
" ----------
  let g:my_neocomplete_ignore_filenames = ['.vimrc']
  if neobundle#is_installed('neocomplete') && has('lua')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#auto_completion_start_length = 1
  endif
  if neobundle#is_installed('neocomplcache') && !has('lua')
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_camel_case_completion = 0
    let g:neocomplcache_enable_underbar_completion = 0
    let g:neocomplcache_enable_fuzzy_completion = 1
    let g:neocomplcache_enable_wildcard = 1
    let g:neocomplcache_fuzzy_completion_start_length = 1
    let g:neocomplcache_auto_completion_start_length = 1
    let g:neocomplcache_dictionary_filetype_lists = {}
    let g:neocomplcache_dictionary_filetype_lists.default = ''
    let g:neocomplcache_dictionary_filetype_lists.vimshell = $HOME . '/.vimshell/command-history'
    if !exists('g:neocomplcache_wildcard_characters')
      let g:neocomplcache_wildcard_characters = {}
    endif
    let g:neocomplcache_wildcard_characters._ = '-'
    if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns.default = '\h\w*'
    if !exists('g:neocomplcache_source_disable')
      let g:neocomplcache_source_disable = {}
    endif
    let g:neocomplcache_source_disable.include_complete = 1
    let g:neocomplcache_source_disable.omni_complete = 1
    let g:neocomplcache_source_disable.tags_complete = 1
    let g:neocomplcache_source_disable.syntax_complete = 1
    let g:neocomplcache_source_disable.dictionary_complete = 1
  endif
" }}}

" ----------
" vimshell setting. {{{
" ----------
  if neobundle#is_installed('vimshell')
    let g:vimshell_popup_height = 40
    let g:vimshell_split_command = 'tabnew'
    let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
    let g:vimshell_disable_escape_highlight = 1
    let g:vimshell_prompt = '$ '
    let g:vimshell_right_prompt = 'versions#info()'
    let g:vimshell_popup_command = 'topleft sp | execute "resize " . g:my_vimshell_popup() | setlocal winfixheight'
    function! g:my_vimshell_popup()
      return winheight(0) * g:vimshell_popup_height / 100
    endfunction
    function! g:my_vimshell_hook_chpwd(args, context)
      call vimshell#execute('ls -al')
    endfunction
  endif
" }}}

" ----------
" versions. {{{
" ----------
  if neobundle#is_installed('vim-versions')
    let g:versions#type#svn#log#stop_on_copy = 0
    if !exists('g:versions#info')
      let g:versions#info = {}
    endif
    let g:versions#info.git = '(%s) - (%b)'
    let g:versions#info.svn = '(%s) - (%R)'
    let g:versions#type#svn#status#ignore_status = ['X']
    let g:versions#type#git#log#append_is_pushed = 1
  endif
" }}}

" ----------
" versions tabline. {{{
" ----------
  if neobundle#is_installed('vim-versions')
    set tabline=%!g:my_tabline()

    function! g:my_tabline()
      let s:titles = map(range(1, tabpagenr('$')), 'g:my_tabtitle(v:val)')
      let s:tabpages = join(s:titles, '').  '%#TabLineFill#%T'
      let s:info = ''
      if neobundle#is_installed('vim-versions')
        let s:info .= '['
        let s:info .= g:my_unite_project_dir == '' ? 'project_dir not detect' : pathshorten(g:my_unite_project_dir)
        let s:vcs = versions#info({ 'path': g:my_unite_project_dir })
        if strlen(s:vcs) > 0
          let s:info .= ' : ' . s:vcs
        endif
        let s:info .= ']'
      endif
      return s:tabpages . '%=' . s:info
    endfunction

    function! g:my_tabtitle(tabnr)
      let s:bufnrs = tabpagebuflist(a:tabnr)
      let s:highlight = a:tabnr is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
      let s:curbufnr = s:bufnrs[tabpagewinnr(a:tabnr) - 1]
      let s:max_length = 30

      let s:fname = a:tabnr . ': ' . fnamemodify(bufname(s:curbufnr), ':t')
      let s:title = ' ' . s:fname . repeat(' ', s:max_length)
      let s:title = strpart(s:title, 0, s:max_length)
      if strlen(s:fname) > s:max_length
        let s:title = strpart(s:title, 0, s:max_length - 4) . '... '
      endif
      return '%' . a:tabnr . 'T' . s:highlight . s:title . '%T%#TabLineFill#'
    endfunction
  endif
" }}}

" ----------
" prettyprint setting. {{{
" ----------
  if neobundle#is_installed('vim-prettyprint')
    let g:prettyprint_indent = 2
    let g:prettyprint_width = 50
  endif
" }}}

" ----------
" emmet setting. {{{
" ----------
  if neobundle#is_installed('emmet-vim')
    let g:user_emmet_expandabbr_key= '<C-k>'
    let g:user_emmet_complete_tag = 1
    let g:user_emmet_settings = {}
    let g:user_emmet_settings['html'] = { 'lang': 'ja', 'indentation': '  ' }
    let g:user_emmet_settings['php']  = { 'extends': 'html', 'filters': 'c', 'indentation': '    ' }
    let g:user_emmet_settings['xml']  = { 'extends': 'html', 'indentation': '    ' }
  endif
" }}}

" ----------
" airline setting. {{{
" ----------
  if neobundle#is_installed('vim-airline')
    let g:airline_detect_modified = 1
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_theme = 'badwolf'
    let g:airline_detect_paste = 1
  endif
" }}}

" ----------
" choosewin setting. {{{
" ----------
  if neobundle#is_installed('vim-choosewin')
    let g:choosewin_overlay_enable = 1
    let g:choosewin_overlay_clear_multibyte = 1
  endif
" }}}

" ----------
" submode setting. {{{
" ----------
  if neobundle#is_installed('vim-submode')
    call submode#enter_with('winsize', 'n', '', '<C-w>>', '15<C-w>>')
    call submode#enter_with('winsize', 'n', '', '<C-w><', '15<C-w><')
    call submode#enter_with('winsize', 'n', '', '<C-w>+', '15<C-w>-')
    call submode#enter_with('winsize', 'n', '', '<C-w>-', '15<C-w>+')
    call submode#map('winsize', 'n', '', '>', '15<C-w>>')
    call submode#map('winsize', 'n', '', '<', '15<C-w><')
    call submode#map('winsize', 'n', '', '+', '15<C-w>-')
    call submode#map('winsize', 'n', '', '-', '15<C-w>+')
  endif
" }}}

if filereadable(expand('$HOME/.vimrc.local'))
  execute 'source ' . expand('$HOME/.vimrc.local')
endif

