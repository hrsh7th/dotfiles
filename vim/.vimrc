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
  call neobundle#rc(expand('$MYVIMRUNTIME/bundle'))

  NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
  NeoBundle 'git://github.com/Shougo/neocomplete.git'
  NeoBundle 'git://github.com/Shougo/neosnippet.git'
  NeoBundle 'git://github.com/Shougo/unite-outline.git'
  NeoBundle 'git://github.com/Shougo/unite.vim.git'
  NeoBundle 'git://github.com/Shougo/vesting.git'
  NeoBundle 'git://github.com/Shougo/vimfiler.git'
  NeoBundle 'git://github.com/Shougo/vimproc', { 'build': { 'windows': 'make -f make_mingw32.mak', 'cygwin': 'make -f make_cygwin.mak', 'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak', } }
  NeoBundle 'git://github.com/Shougo/vimshell.git'
  NeoBundle 'git://github.com/bling/vim-airline.git'
  NeoBundle 'git://github.com/dannyob/quickfixstatus.git'
  NeoBundle 'git://github.com/dhruvasagar/vim-markify.git'
  NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
  NeoBundle 'git://github.com/hrsh7th/shabadou.vim.git'
  NeoBundle 'git://github.com/hrsh7th/unite-recording.git'
  NeoBundle 'git://github.com/hrsh7th/vim-better-css-indent.git'
  NeoBundle 'git://github.com/hrsh7th/vim-hybrid.git'
  NeoBundle 'git://github.com/hrsh7th/vim-neco-calc.git'
  NeoBundle 'git://github.com/hrsh7th/vim-neco-snippets.git'
  NeoBundle 'git://github.com/hrsh7th/vim-versions.git'
  NeoBundle 'git://github.com/jceb/vim-hier.git'
  NeoBundle 'git://github.com/kana/vim-submode.git'
  NeoBundle 'git://github.com/kana/vim-textobj-user.git'
  NeoBundle 'git://github.com/leafgarland/typescript-vim.git'
  NeoBundle 'git://github.com/marijnh/tern_for_vim.git'
  NeoBundle 'git://github.com/mattn/emmet-vim.git'
  NeoBundle 'git://github.com/mattn/webapi-vim.git'
  NeoBundle 'git://github.com/osyo-manga/unite-airline_themes.git'
  NeoBundle 'git://github.com/osyo-manga/vim-textobj-multiblock.git'
  NeoBundle 'git://github.com/osyo-manga/vim-watchdogs.git'
  NeoBundle 'git://github.com/pangloss/vim-javascript.git'
  NeoBundle 'git://github.com/pasela/unite-webcolorname.git'
  NeoBundle 'git://github.com/t9md/vim-quickhl.git'
  NeoBundle 'git://github.com/thinca/vim-ft-svn_diff.git'
  NeoBundle 'git://github.com/thinca/vim-prettyprint.git'
  NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
  NeoBundle 'git://github.com/thinca/vim-quickrun.git'
  NeoBundle 'git://github.com/tpope/vim-surround.git'
  NeoBundle 'git://github.com/triglav/vim-visual-increment.git'
  NeoBundle 'git://github.com/tsukkee/unite-tag.git'
  NeoBundle 'git://github.com/tyru/caw.vim.git'
  NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
  NeoBundle 'git://github.com/vim-jp/vimdoc-ja.git'
  NeoBundle 'git://github.com/vim-jp/vital.vim.git'
  NeoBundle 'git://github.com/vim-scripts/actionscript.vim--Leider.git'
  NeoBundle 'git://github.com/vim-scripts/html-improved-indentation.git'
  NeoBundle 'git://github.com/vim-scripts/smarty-syntax.git'
  NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'

  runtime macros/matchit.vim

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
  set tabline=%!g:my_tabline()
  set cmdheight=2
  set laststatus=2
  set nowrap
  set ruler
  set number
  set list
  set listchars=tab:\|\ ,trail:^
  set pumheight=20
  set previewheight=20
  colorscheme hybrid
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
" }}}

" ----------
" Search Setting. {{{
" ----------
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
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
  set comments=sl:/*,mb:\ *,elx:\ */
  set formatoptions+=rco
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
  set guioptions-=m guioptions-=T guioptions+=b

  " multibyte characters.
  set ambiwidth=double

  " font.
  if s:is_win
    set guifont=Consolas:h10:b
    set guifontwide=MigMix_1m:h9:b
  elseif s:is_mac
    set guifont=Menlo\ Bold:h10
    set transparency=25
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
  nnoremap <LEADER>q :<C-u>UniteRecordingBegin<CR>
  nmap Q <Plug>(unite-recording-execute)
  nnoremap @ q
  nnoremap j gj
  nnoremap k gk
  nnoremap < <<<ESC>
  nnoremap > >><ESC>
  vnoremap < <<<ESC>
  vnoremap > >><ESC>
  nnoremap <expr><silent><LEADER><ESC> printf(":\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>",
        \ 'QuickhlManualReset',
        \ 'HierClear',
        \ 'nohlsearch',
        \ 'redraw!')

  " marking.
  nnoremap <LEADER>- :<C-u>UniteMarkAdd<CR>

  " rough move.
  nnoremap H 15h
  nnoremap J 8j
  nnoremap K 8k
  nnoremap L 15l
  vnoremap H 15h
  vnoremap J 8j
  vnoremap K 8k
  vnoremap L 15l

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

  " use command line window.
  nnoremap : q:
  xnoremap : q:

  " register history.
  inoremap <expr> <C-p> unite#start_complete('register')

  " expand region
  nnoremap <CR> :<C-u>Unite jump -no-split -auto-preview -select=0<CR>

  " pairs mapping.
  inoremap <expr><CR> g:my_pair_enter()
  inoremap <expr><BS> g:my_pair_delete()
  inoremap ( ()<LEFT>
  inoremap [ []<LEFT>
  inoremap { {}<LEFT>
  inoremap ' ''<LEFT>
  inoremap " ""<LEFT>
  let g:my_pairs = { '(': ')', '[': ']', '{': '}', '"': '"', "'": "'", '<': '>' }
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
  function! g:my_pair_is_next_pair()
    if exists("g:my_pairs[getline('.')[col('.') - 1]]") || len(filter(deepcopy(g:my_pairs), "v:val == getline('.')[col('.') - 1]")) > 0
      return 1
    endif
    return 0
  endfunction

  " search cursor_word.
  nnoremap <expr><LEADER>gf g:my_cursor_word_search_command()
  function! g:my_cursor_word_search_command()
    " TODO: search path and classname
    " ex) <script type="text/javascript" src="../../js/app.js"></script> => js.*app.js
    " ex) new App.test.TestClass => testclass
    return printf(":\<C-u>Unite -buffer-name=file_rec/async -input=%s file_rec/async:%s\<CR>",
          \ tolower(expand('<cword>')),
          \ (g:my_unite_project_dir != "" ? g:my_unite_project_dir : "!"))
  endfunction

  " open explorer.
  nnoremap <expr><F2> g:my_open_explorer_command()
  function! g:my_open_explorer_command()
    return printf(":\<C-u>VimFilerBufferDir -simple -buffer-name=%s -split -auto-cd -toggle -no-quit -winwidth=%s\<CR>",
          \ g:my_vimfiler_explorer_name,
          \ g:my_vimfiler_winwidth)
  endfunction

  " show project file.
  nnoremap <expr><F3> g:my_project_file_command()
  function! g:my_project_file_command()
    return printf(":\<C-u>Unite -buffer-name=buffer_tab-file_rec/async -hide-source-names -silent buffer_tab file_rec/async:%s\<CR>",
          \ (g:my_unite_project_dir != "" ? g:my_unite_project_dir : "!"))
  endfunction

  " versions command.
  nnoremap <LEADER><LEADER> :<C-u>UniteVersions<CR>
  nnoremap <F6> :<C-u>UniteVersions status:!<CR>
  nnoremap <F7> :<C-u>UniteVersions log:%<CR>

  " show outline.
  nnoremap <F8> :<C-u>Unite -buffer-name=outline -vertical -toggle -winwidth=45 outline<CR>

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

  " move cursor.
  imap <expr><TAB> g:my_cursor_move_or_snippet_expand_command()
  function! g:my_cursor_move_or_snippet_expand_command()
    if neosnippet#expandable() || neosnippet#jumpable()
      return "\<PLUG>(neosnippet_expand_or_jump)"
    endif
    if getline('.')[0:col('.')-2] =~# '^\(\t\|\s\)*$'
      return "\<TAB>"
    endif
    if g:my_pair_is_next_pair()
      return "\<RIGHT>"
    endif
    return "\<C-o>e\<C-o>l"
  endfunction

  " neosnippet.
  xmap <C-k> <PLUG>(neosnippet_expand_target)

  " caw.
  nmap <LEADER>/ <PLUG>(caw:i:toggle)
  vmap <LEADER>/ <PLUG>(caw:i:toggle)

  " quickhl.
  nmap <LEADER>m <PLUG>(quickhl-manual-toggle)
  vmap <LEADER>m <PLUG>(quickhl-manual-toggle)

  " replace word by register.
  nnoremap cir ciw<C-r>0<ESC>:<C-u>let@/=@1<CR>:noh<CR>

  " auto surround.
  omap i<LEADER> <PLUG>(textobj-multiblock-i)
  omap a<LEADER> <PLUG>(textobj-multiblock-a)
  vmap i<LEADER> <PLUG>(textobj-multiblock-i)
  vmap a<LEADER> <PLUG>(textobj-multiblock-a)
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

  " starting.
  autocmd! VimEnter * call g:my_vimenter_setting()
  function! g:my_vimenter_setting()
    if !argc()
      if filereadable(expand('$HOME/todo.txt'))
        execute 'edit ' . expand('$HOME/todo.txt')
      else
        edit $MYVIMRC
      endif
      setlocal ft=vim
    endif
  endfunction

  " insert leave.
  autocmd! InsertLeave * call g:my_insertleave_setting()
  function! g:my_insertleave_setting()
    set nopaste
  endfunction

  " filetype.
  autocmd! BufNewFile,BufRead *.tpl setlocal filetype=html
  autocmd! Filetype tpl setlocal filetype=html
  autocmd! BufNewFile,BufRead *.ejs setlocal filetype=html
  autocmd! Filetype ejs setlocal filetype=html
  autocmd! BufNewFile,BufRead *.as setlocal filetype=actionscript
  autocmd! Filetype as setlocal filetype=actionscript
  autocmd! BufNewFile,BufRead *.js setlocal filetype=javascript
  autocmd! Filetype js setlocal filetype=javascript
  autocmd! Filetype smarty setlocal filetype=html
  autocmd! Filetype actionscript execute get(g:my_coding_style, 't4', '')
  autocmd! Filetype coffee execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype vim execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype php execute get(g:my_coding_style, 't4', '')
  autocmd! Filetype html execute get(g:my_coding_style, 't2', '')
  autocmd! Filetype xhtml execute get(g:my_coding_style, 't2', '')
  autocmd! Filetype css execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype scss execute get(g:my_coding_style, 's2', '')

  " javascript.
  autocmd! Filetype javascript call g:my_javascript_settings()
  function! g:my_javascript_settings()
    execute get(g:my_coding_style, 's2', '')
  endfunction

  " command line window.
  autocmd! CmdwinEnter * call g:my_cmdwinenter_settings()
  function! g:my_cmdwinenter_settings()
    nnoremap <buffer><ESC> :<C-u>q<CR>
    imap <expr><TAB> g:my_cursor_move_or_snippet_expand_command()
    startinsert!
  endfunction

  " save previous window.
  autocmd! WinEnter * call g:my_save_previous_window_settings()
  function! g:my_save_previous_window_settings()
    if exists('b:unite')
      let b:unite.__prev_winnr = winnr('#')
    endif
    if exists('b:vimfiler')
      let b:vimfiler.__prev_winnr = winnr('#')
    endif
  endfunction

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
    nnoremap <buffer><expr>s unite#do_action('split')
    nnoremap <buffer><expr>v unite#do_action('vsplit')
    let s:unite = unite#get_current_unite()
    if s:unite.profile_name == 'todo'
      nnoremap <buffer>N :<C-u>UniteTodoAddSimple<CR>
    endif
  endfunction

  " vimfiler.
  autocmd! FileType vimfiler call g:my_vimfiler_settings()
  function! g:my_vimfiler_settings()
    nmap     <buffer><expr><C-h> ':\<C-u>new \| VimFilerCreate -winwidth='. g:my_vimfiler_winwidth. ' -simple -no-quit<CR>'
    nmap     <buffer><expr><CR>  vimfiler#smart_cursor_map("\<PLUG>(vimfiler_expand_tree)", "e")
    nmap     <buffer><TAB>       <PLUG>(vimfiler_choose_action)
    nmap     <buffer>c           <PLUG>(vimfiler_clipboard_copy_file)
    nmap     <buffer>m           <PLUG>(vimfiler_clipboard_move_file)
    nmap     <buffer>p           <PLUG>(vimfiler_clipboard_paste)
    nmap     <buffer>@           <PLUG>(vimfiler_toggle_mark_current_line)
    nmap     <buffer>;           <PLUG>(vimfiler_cd_input_directory)
    nmap     <buffer>j           j<PLUG>(vimfiler_print_filename)
    nmap     <buffer>k           k<PLUG>(vimfiler_print_filename)
    nnoremap <buffer>b           :<C-u>Unite -buffer-name=bookmark-vimfiler_history -default-action=cd -no-start-insert bookmark directory_mru<CR>
    nnoremap <buffer>e           :<C-u>call vimfiler#mappings#do_action('nicely_open')<CR>
    nnoremap <buffer>v           :<C-u>call vimfiler#mappings#do_action('nicely_vsplit')<CR>
    nnoremap <buffer>s           :<C-u>call vimfiler#mappings#do_action('nicely_split')<CR>
    nnoremap <buffer><F5>        :<C-u>call vimfiler#mappings#do_current_dir_action('my_project_cd')<CR>
    nnoremap <buffer><F8>        :<C-u>VimFilerTab -double<CR>
    nnoremap <buffer><BS>        :<C-u>VimFilerTab -double<CR>
    nnoremap <buffer><BS>        :<C-u>call vimfiler#mappings#do_current_dir_action('my_project_root_cd')<CR>
    nnoremap <buffer><Leader>    :<C-u>call vimfiler#mappings#do_current_dir_action('my_project_tag_update')<CR>
  endfunction

  " vimshell.
  autocmd! FileType vimshell call g:my_vimshell_settings()
  function! g:my_vimshell_settings()
    nnoremap <buffer>a GA
    inoremap <buffer><TAB> <NOP>
    inoremap <buffer><expr><TAB> g:my_cursor_move_or_snippet_expand_command()
    inoremap <buffer><expr><C-l> unite#start_complete(['vimshell/history', 'vimshell/external_history'], {
          \ 'no_start_insert' : 1,
          \ 'default_action': 'insert',
          \ 'select': 0,
          \ 'input' : vimshell#get_cur_text(),
          \ })
    call vimshell#altercmd#define('ls', 'ls -al')
    call vimshell#altercmd#define('ll', 'ls -al')
    call vimshell#altercmd#define('l', 'll')
    call vimshell#hook#add('chpwd', 'my_vimshell_hook_chpwd', 'g:my_vimshell_hook_chpwd')
  endfunction

  " vimshell int-*.
  autocmd! Filetype int-* call g:my_vimshell_interactive_settings()
  function! g:my_vimshell_interactive_settings()
    nnoremap <buffer>a GA
    inoremap <buffer><TAB> <NOP>
    inoremap <buffer><expr><TAB> g:my_cursor_move_or_snippet_expand_command()
    inoremap <buffer><expr><C-l> unite#start_complete(['vimshell/history', 'vimshell/external_history'], {
          \ 'no_start_insert' : 1,
          \ 'select': 0,
          \ 'default_action': 'insert',
          \ 'input' : vimshell#get_cur_text(),
          \ })
  endfunction

  " neocomplete.
  autocmd! BufRead,BufWritePost * call g:my_neocomplete_settings()
  function! g:my_neocomplete_settings()
    if !index(g:my_neocomplete_ignore_filenames, expand('<abuf>:t'))
      NeoCompleteBufferMakeCache
    endif
  endfunction
augroup END
" }}}

" ----------
" watchdogs setting. {{{
" ----------
  let g:watchdogs_check_BufWritePost_enable = 1
  let g:quickrun_config = extend(get(g:, 'quickrun_config', {}), {
        \   '_': {
        \     'runner': 'vimproc'
        \   },
        \   'watchdogs_checker/_': {
        \     'outputter/quickfix/open_cmd': '',
        \     'hook/markify_clear/enable_exit' : 1,
        \     'hook/markify/enable_exit' : 1,
        \   }
        \ })
" }}}

" ----------
" vimfiler setting. {{{
" ----------
  let g:my_vimfiler_explorer_name = 'explorer'
  let g:my_vimfiler_winwidth = 30
  let g:vimfiler_edit_action = ''
  let g:vimfiler_safe_mode_by_default = 0
  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_directory_display_top = 1
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '-'
  let g:vimfiler_tree_closed_icon = '+'
" }}}

" ----------
" unite setting. {{{
" ----------
  if !exists('g:my_unite_project_dir')
    let g:my_unite_project_dir = ""
  endif
  let g:unite_enable_start_insert = 0
  let g:unite_split_rule = "botright"
  let g:unite_source_grep_default_opts = '-Hni'
  let g:unite_source_grep_max_candidates = 0
  let g:unite_source_file_mru_filename_format = ''
  let g:unite_source_file_rec_min_cache_files = 0
  let g:unite_update_time = 200
  let g:unite_winheight = 15
  let g:unite_source_line_enable_highlight = 1
  let g:unite_data_directory = expand("~/.unite")
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#set_profile('action', 'context', { 'no_start_insert': 1 })
  call unite#custom_filters('file_rec/async,file_rec', ['matcher_glob', 'converter_nothing', 'sorter_nothing'])
  call unite#custom_source('file_rec/async,file_rec', 'ignore_pattern', join([
        \ '\.git\/',
        \ '\.svn\/',
        \ '\/\(image\|img\)\/',
        \ ], '\|'))
  " }}}

" ----------
" unite menu source. {{{
" ----------
  let g:unite_source_menu_menus = {}
  let g:unite_source_menu_menus.global = { 'description': 'global menu.' }
  let g:unite_source_menu_menus.global.command_candidates = [
        \ [ 'NeoSnippetEdit', 'NeoSnippetEdit -split -vertical' ],
        \ [ 'NeoBundleUpdate!', 'Unite neobundle/update:!' ],
        \ [ 'Unite mark', 'Unite mark -buffer-name=mark' ],
        \ [ 'Unite todo', 'Unite todo -buffer-name=todo' ],
        \ [ 'Reverse Line Order', 'g/^/m0' ],
        \ ]
" }}}

" ----------
" custom unite filter. {{{
" ----------
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
  call unite#custom_filters('buffer_tab,jump', ['matcher_my_remove', 'matcher_glob', 'converter_default', 'sorter_default'])

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
  call unite#custom_filters('vimfiler/history', ['matcher_my_unique', 'matcher_glob', 'converter_default', 'sorter_default'])
" }}}

" ----------
" custom unite action. {{{
" ----------
  " nicely_open.
  let s:action = { 'is_selectable' : 1 }
  function! s:action.func(candidates)
    execute g:my_unite_get_prev_winnr() . 'wincmd w'
    execute 'edit ' . a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'nicely_open', s:action)

  " nicely_split.
  let s:action = { 'is_selectable' : 1 }
  function! s:action.func(candidates)
    execute g:my_unite_get_prev_winnr() . 'wincmd w'
    execute 'split ' . a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'nicely_split', s:action)

  " nicely_vsplit.
  let s:action = { 'is_selectable' : 1 }
  function! s:action.func(candidates)
    execute g:my_unite_get_prev_winnr() . 'wincmd w'
    execute 'vsplit ' . a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'nicely_vsplit', s:action)

  " my_project_cd.
  let s:action = { 'is_selectable' : 1 }
  function! s:action.func(candidates)
    let g:my_unite_project_dir = substitute(a:candidates[0].action__directory, '\/$', '', 'g')
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
  call unite#custom_action('file', 'my_project_cd', s:action)

  " my_project_root_cd.
  let s:action = { 'is_selectable' : 1 }
  function! s:action.func(candidates)
    let s:project_dir = g:my_unite_project_dir
    let s:action_dir = a:candidates[0].action__directory
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
      let a:candidates[0].action__directory = s:dir
      call vimfiler#mappings#cd(s:dir)
    else
      echomsg 'can not found cdable directory.'
    endif
  endfunction
  call unite#custom_action('file', 'my_project_root_cd', s:action)

  " my_project_tag_update.
  let s:action = { 'is_selectable' : 1 }
  function! s:action.func(candidates)
    if versions#get_type(a:candidates[0].action__directory) == ''
      echomsg 'current dir is not version control.'
    else
      let s:filetype = getbufvar('#', '&filetype')
      let s:root_dir = versions#get_root_dir(a:candidates[0].action__directory)
      let s:ext_map = {
            \ 'actionscript': 'as'
            \ }
      call unite#take_action('cd', a:candidates[0])
      try
        call vimproc#system(printf('ctags --recurse=yes -f %s/tags -h %s --languages=%s %s', s:root_dir, s:ext_map[s:filetype], s:filetype, s:root_dir))
      catch
        echomsg 'not supported filetype.'
      endtry
    endif
  endfunction
  call unite#custom_action('file', 'my_project_tag_update', s:action)

  " get previous winnr for unite custom action.
  function! g:my_unite_get_prev_winnr()
    let s:ftypes = ['unite', 'vimshell', 'vimfiler']

    " vimfiler or unite has prev_winnr?
    if exists('b:vimfiler.__prev_winnr')
      let s:nr = b:vimfiler.__prev_winnr
    endif
    if exists('b:unite.__prev_winnr')
      let s:nr = b:unite.__prev_winnr
    endif

    " return b:{vimfiler,unite}.prev_winnr if don't match ftypes.
    if exists('s:nr') && (index(s:ftypes, getwinvar(s:nr, '&filetype')) < 0)
      return s:nr
    endif

    " auto detect.
    let s:winnrs = range(1, winnr('$'))
    if len(s:winnrs) == 1
      return s:winnrs[0]
    endif
    if len(s:winnrs) <= 2
      return filter(s:winnrs, 'getwinvar(v:val, "&filetype") != "vimfiler"')[0]
    endif
    let s:winnrs = filter(s:winnrs, 'index(s:ftypes, getwinvar(v:val, "&filetype")) < 0')
    if empty(s:winnrs)
      return winnr()
    endif
    return s:winnrs[0]
  endfunction
" }}}

" ----------
" neosnippet setting. {{{
" ----------
  if isdirectory($MYVIMRUNTIME. '/bundle/vim-neco-snippets')
    let g:neosnippet#snippets_directory = $MYVIMRUNTIME. '/bundle/vim-neco-snippets'
    let g:neosnippet#disable_runtime_snippets = { '_': 1 }
  endif
" }}}

" ----------
" neocomplete setting. {{[
" ----------
  let g:my_neocomplete_ignore_filenames = ['.vimrc']
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#auto_completion_start_length = 1
" }}}

" ----------
" vimshell setting. {{{
" ----------
  let g:vimshell_popup_height = 40
  let g:vimshell_split_command = 'tabnew'
  let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
  let g:vimshell_disable_escape_highlight = 1
  let g:vimshell_prompt = '$ '
  let g:vimshell_right_prompt = 'versions#info()'
  let g:vimshell_popup_command = 'topleft sp | execute "resize " . g:my_vimshell_popup() | set winfixheight'
  function! g:my_vimshell_popup()
    return winheight(0) * g:vimshell_popup_height / 100
  endfunction
  function! g:my_vimshell_hook_chpwd(args, context)
    call vimshell#execute('ls -al')
  endfunction
" }}}

" ----------
" versions. {{{
" ----------
  let g:versions#type#svn#log#stop_on_copy = 0
  if !exists('g:versions#info')
    let g:versions#info = {}
  endif
  let g:versions#info.git = '(%s) - (%b)'
  let g:versions#info.svn = '(%s) - (%R)'
  let g:versions#type#svn#status#ignore_status = ['X']
  let g:versions#type#git#log#append_is_pushed = 1
  let g:versions#type#git#log#first_parent = 1
" }}}

" ----------
" prettyprint setting. {{{
" ----------
  let g:prettyprint_indent = 2
  let g:prettyprint_width = 50
" }}}

" ----------
" emmet setting. {{{
" ----------
  let g:user_emmet_expandabbr_key= '<C-k>'
  let g:user_emmet_complete_tag = 1
  let g:user_emmet_settings = {}
  let g:user_emmet_settings['html'] = { 'lang': 'ja', 'indentation': '  ' }
  let g:user_emmet_settings['php']  = { 'extends': 'html', 'filters': 'c', 'indentation': '    ' }
  let g:user_emmet_settings['xml']  = { 'extends': 'html', 'indentation': '    ' }
" }}}

" ----------
" trailingwhitespace setting. {{{
" ----------
  let g:trailing_whitespace_fix_events = {}
" }}}

" ----------
" airline setting. {{{
" ----------
  let g:airline_detect_modified = 1
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_theme = 'badwolf'
  let g:airline_detect_paste = 1
" }}}

" ----------
" submode setting. {{{
" ----------
  call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
  call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
  call submode#map('winsize', 'n', '', '>', '<C-w>>')
  call submode#map('winsize', 'n', '', '<', '<C-w><')
  call submode#map('winsize', 'n', '', '+', '<C-w>-')
  call submode#map('winsize', 'n', '', '-', '<C-w>+')
" }}}

if filereadable(expand('$HOME/.vimrc.local'))
  execute 'source ' . expand('$HOME/.vimrc.local')
endif

