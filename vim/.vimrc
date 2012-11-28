scriptencoding utf-8
set nocompatible
let s:is_win = has('win32') || has('win64')
let s:is_mac = !s:is_win && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')
let s:is_linux = !s:is_win && !s:is_mac

" ----------
" Environment. {{{
" ----------
  if s:is_win
    set shellslash
    let $MYVIMRUNTIME = expand('~/vimfiles')
  endif
  if s:is_linux
    let $MYVIMRUNTIME = expand('~/.vim')
  endif
  if s:is_mac
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
    call neobundle#rc(expand('$MYVIMRUNTIME/bundle'))
  endif

  NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
  NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
  NeoBundle 'git://github.com/Shougo/neocomplcache.git'
  NeoBundle 'git://github.com/Shougo/neosnippet.git'
  NeoBundle 'git://github.com/Shougo/unite-outline.git'
  NeoBundle 'git://github.com/Shougo/unite.vim.git'
  NeoBundle 'git://github.com/Shougo/vesting.git'
  NeoBundle 'git://github.com/Shougo/vimfiler.git'
  NeoBundle 'git://github.com/Shougo/vimproc.git'
  NeoBundle 'git://github.com/Shougo/vimshell.git'
  NeoBundle 'git://github.com/dannyob/quickfixstatus.git'
  NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
  NeoBundle 'git://github.com/hrsh7th/unite-todo.git'
  NeoBundle 'git://github.com/hrsh7th/vim-better-css-indent.git'
  NeoBundle 'git://github.com/hrsh7th/vim-ft-svn_diff.git'
  NeoBundle 'git://github.com/hrsh7th/vim-hybrid.git'
  NeoBundle 'git://github.com/hrsh7th/vim-neco-calc.git'
  NeoBundle 'git://github.com/hrsh7th/vim-neco-snippets.git'
  NeoBundle 'git://github.com/hrsh7th/vim-trailing-whitespace.git'
  NeoBundle 'git://github.com/hrsh7th/vim-versions.git'
  NeoBundle 'git://github.com/jceb/vim-hier.git'
  NeoBundle 'git://github.com/mattn/webapi-vim.git'
  NeoBundle 'git://github.com/mattn/zencoding-vim.git'
  NeoBundle 'git://github.com/osyo-manga/shabadou.vim.git'
  NeoBundle 'git://github.com/osyo-manga/vim-watchdogs.git'
  NeoBundle 'git://github.com/pasela/unite-webcolorname.git'
  NeoBundle 'git://github.com/t9md/vim-quickhl.git'
  NeoBundle 'git://github.com/thinca/vim-openbuf.git'
  NeoBundle 'git://github.com/thinca/vim-prettyprint.git'
  NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
  NeoBundle 'git://github.com/thinca/vim-quickrun.git'
  NeoBundle 'git://github.com/tpope/vim-surround.git'
  NeoBundle 'git://github.com/triglav/vim-visual-increment.git'
  NeoBundle 'git://github.com/tyru/caw.vim.git'
  NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
  NeoBundle 'git://github.com/vim-jp/vimdoc-ja.git'
  NeoBundle 'git://github.com/vim-jp/vital.vim.git'
  NeoBundle 'git://github.com/vim-scripts/actionscript.vim--Leider.git'
  NeoBundle 'git://github.com/vim-scripts/matchit.zip.git'
  NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'

  syntax on
  filetype plugin on
  filetype indent on
" }}}

" ----------
" General Setting  {{{
" ----------
  set encoding=utf-8
  set updatetime=100
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
  set tags=./.tags;
  if has('persistent_undo')
    set undodir=~/.vimundo
    set undofile
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
  colorscheme hybrid
  function! g:my_tabline()
    let titles = map(range(1, tabpagenr('$')), 'g:my_tabtitle(v:val)')
    let tabpages = join(titles, '').  '%#TabLineFill#%T'
    let info = '[' . (g:my_unite_project_dir == '' ? 'project_dir not detect' : g:my_unite_project_dir) . ']'
    return tabpages . '%=' . info
  endfunction
  function! g:my_tabtitle(tabnr)
    let bufnrs = tabpagebuflist(a:tabnr)
    let highlight = a:tabnr is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
    let curbufnr = bufnrs[tabpagewinnr(a:tabnr) - 1]
    let max_length = 30

    " タイトル文字列の作成
    let fname = a:tabnr . ': ' . fnamemodify(bufname(curbufnr), ':t')
    let title = ' ' . fname . repeat(' ', max_length)
    let title = strpart(title, 0, max_length)
    if strlen(fname) > max_length
      let title = strpart(title, 0, max_length - 4) . '... '
    endif
    return '%' . a:tabnr . 'T' . highlight . title . '%T%#TabLineFill#'
  endfunction
" }}}

" ----------
" Search Setting. {{{
" ----------
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
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
" Key Mapping. {{{
" ----------
  let mapleader="\<Space>"

  " general.
  nnoremap <LEADER>q :<C-u>q<CR>
  nnoremap <LEADER>t :<C-u>tabclose<CR>
  nnoremap <LEADER>! :<C-u>q!<CR>
  nnoremap <LEADER>w :<C-u>w<CR>
  nnoremap j gj
  nnoremap k gk
  nnoremap <expr><silent><LEADER><ESC> printf(":\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>",
        \ 'HierClear',
        \ 'nohlsearch',
        \ 'call feedkeys("\<PLUG>(quickhl-reset)")'
        \ )

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
  nnoremap <LEADER>* *:<C-u>%s/<C-r>///g<LEFT><LEFT>

  " join line.
  nnoremap <C-j> Jx

  " move in insert-mode.
  inoremap <C-l> <C-o>l
  inoremap <C-h> <C-o>h

  " use command line window.
  nnoremap : q:
  xnoremap : q:

  " / -> Unite line.
  nnoremap / :<C-u>Unite -buffer-name=line_fast -start-insert line/fast<CR>
  nnoremap * :<C-u>UniteWithCursorWord -buffer-name=line_fast -no-start-insert line/fast<CR>
  nnoremap n :<C-u>UniteResume -no-start-insert line_fast<CR>

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
  nnoremap <expr>gf g:my_cursor_word_search_command()
  function! g:my_cursor_word_search_command()
    " TODO: search path and classname
    " ex) <script type="text/javascript" src="../../js/app.js"></script> => js.*app.js
    " ex) new App.test.TestClass => testclass
    return printf(":\<C-u>Unite -buffer-name=file_rec/async -input=%s file_rec/async:%s\<CR>",
          \ expand('<cword>'),
          \ (g:my_unite_project_dir != "" ? g:my_unite_project_dir : "!"))
  endfunction

  " open explorer.
  nnoremap <expr><F2> g:my_open_explorer_command()
  function! g:my_open_explorer_command()
    return printf(":\<C-u>VimFilerBufferDir -buffer-name=%s -split -auto-cd -toggle -no-quit -winwidth=%s\<CR>",
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

  " complete.
  inoremap ] <C-n>
  inoremap <expr>} pumvisible() ? "\<C-p>" : "}"

  " move cursor.
  imap <expr><TAB> g:my_cursor_move_or_snippet_expand_command()
  function! g:my_cursor_move_or_snippet_expand_command()
    if neosnippet#expandable()
      return "\<PLUG>(neosnippet_expand_or_jump)"
    endif
    if getline('.')[0:col('.')-1] =~# '^\(\t\|\s\)*$'
      return "\<TAB>"
    endif
    if g:my_pair_is_next_pair()
      return "\<RIGHT>"
    endif
    return "\<C-o>e\<C-o>l"
  endfunction

  " quickrun.
  nnoremap <LEADER>r :<C-u>QuickRun<CR>

  " neosnippet.
  xmap <C-k> <PLUG>(neosnippet_expand_target)

  " caw.
  nmap <LEADER><CR> <PLUG>(caw:i:toggle)
  vmap <LEADER><CR> <PLUG>(caw:i:toggle)

  " quickhl.
  nmap <LEADER>m <PLUG>(quickhl-toggle)
  vmap <LEADER>m <PLUG>(quickhl-toggle)

  " replace word by register.
  nnoremap cir ciw<C-r>0<ESC>:<C-u>let@/=@1<CR>:noh<CR>

  " auto surround.
  nnoremap <expr>cis g:my_surround_command('ci')
  nnoremap <expr>yis g:my_surround_command('yi')
  nnoremap <expr>dis g:my_surround_command('di')
  nnoremap <expr>vis g:my_surround_command('vi')
  function! g:my_surround_command(key)
    let pattern = "'\"{[("
    let front = strpart(getline("."), 0, col("."))
    let max = -1
    for pat in split(pattern, '.\zs')
      let pos = strridx(front, pat)
      if pos > max
        let max = pos
      endif
    endfor
    if max >= 0
      let surround = strpart(front, max, 1)
      return a:key . surround
    endif
  endfunction
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
      edit $MYVIMRC
      setlocal ft=vim
    endif
  endfunction

  " filetype.
  autocmd! BufNewFile,BufRead *.ejs setlocal filetype=html
  autocmd! Filetype ejs setlocal filetype=html
  autocmd! BufNewFile,BufRead *.as setlocal filetype=actionscript
  autocmd! Filetype as setlocal filetype=actionscript
  autocmd! BufNewFile,BufRead *.js setlocal filetype=javascript
  autocmd! Filetype js setlocal filetype=javascript
  autocmd! Filetype smarty setlocal filetype=html
  autocmd! Filetype javascript execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype actionscript execute get(g:my_coding_style, 't4', '')
  autocmd! Filetype coffee execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype vim execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype php execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype html execute get(g:my_coding_style, 't2', '')
  autocmd! Filetype xhtml execute get(g:my_coding_style, 't2', '')
  autocmd! Filetype css execute get(g:my_coding_style, 's2', '')
  autocmd! Filetype scss execute get(g:my_coding_style, 's2', '')

  " command line window.
  autocmd! CmdwinEnter * call g:my_cmdwinenter_settings()
  function! g:my_cmdwinenter_settings()
    nnoremap <buffer><ESC> :<C-u>q<CR>
    startinsert!
  endfunction

  " save previous window.
  autocmd! WinEnter * call g:my_save_previous_window_settings()
  function! g:my_save_previous_window_settings()
    if exists('b:unite')
      let b:unite.prev_winnr = winnr('#')
    endif
    if exists('b:vimfiler')
      let b:vimfiler.prev_winnr = winnr('#')
    endif
  endfunction

  " shadow.
  autocmd! BufWinLeave *.shd call g:my_shd_settings()
  function! g:my_shd_settings()
    enew
    setlocal nobuflisted buftype=nofile bufhidden=hide noswapfile
    execute printf('bdelete! %s', expand('<abuf>'))
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
    let unite = unite#get_current_unite()
    if unite.profile_name == 'todo'
      nnoremap <buffer>N :<C-u>UniteTodoAddSimple<CR>
    endif
  endfunction

  " vimfiler.
  autocmd! FileType vimfiler call g:my_vimfiler_settings()
  function! g:my_vimfiler_settings()
    nmap     <buffer><expr><F11> ':\<C-u>new \| VimFilerCreate -winwidth='. g:my_vimfiler_winwidth. ' -no-quit<CR>'
    nmap     <buffer><expr><CR>  vimfiler#smart_cursor_map("\<PLUG>(vimfiler_expand_tree)", "e")
    nmap     <buffer><TAB>       <PLUG>(vimfiler_choose_action)
    nmap     <buffer>c           <PLUG>(vimfiler_clipboard_copy_file)
    nmap     <buffer>m           <PLUG>(vimfiler_clipboard_move_file)
    nmap     <buffer>p           <PLUG>(vimfiler_clipboard_paste)
    nmap     <buffer>@           <PLUG>(vimfiler_toggle_mark_current_line)
    nmap     <buffer>;           <PLUG>(vimfiler_cd_input_directory)
    nmap     <buffer>j           j<PLUG>(vimfiler_print_filename)
    nmap     <buffer>k           k<PLUG>(vimfiler_print_filename)
    nnoremap <buffer>b           :<C-u>Unite -buffer-name=bookmark-vimfiler_history -default-action=cd -no-start-insert bookmark vimfiler/history<CR>
    nnoremap <buffer>e           :<C-u>call vimfiler#mappings#do_action('nicely_open')<CR>
    nnoremap <buffer>v           :<C-u>call vimfiler#mappings#do_action('nicely_vsplit')<CR>
    nnoremap <buffer>s           :<C-u>call vimfiler#mappings#do_action('nicely_split')<CR>
    nnoremap <buffer><F5>        :<C-u>call vimfiler#mappings#do_current_dir_action('my_project_cd')<CR>
    nnoremap <buffer><F8>        :<C-u>VimFilerTab -double<CR>
    setlocal winfixwidth
  endfunction

  " vimshell.
  autocmd! FileType vimshell call g:my_vimshell_settings()
  function! g:my_vimshell_settings()
    nnoremap <buffer>a G$a
    inoremap <buffer><TAB> <NOP>
    inoremap <buffer><expr><TAB> g:my_cursor_move_or_snippet_expand_command()
    inoremap <buffer><expr><C-l> unite#start_complete(['vimshell/history', 'vimshell/external_history'], {
          \ 'no_start_insert' : 1,
          \ 'default_action': 'insert',
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
    nnoremap <buffer>a G$a
    inoremap <buffer><TAB> <NOP>
    inoremap <buffer><expr><TAB> g:my_cursor_move_or_snippet_expand_command()
    inoremap <buffer><expr><C-l> unite#start_complete(['vimshell/history', 'vimshell/external_history'], {
          \ 'no_start_insert' : 1,
          \ 'default_action': 'insert',
          \ 'input' : vimshell#get_cur_text(),
          \ })
  endfunction
augroup END
" }}}

" ----------
" watchdogs setting. {{{
" ----------
  let g:watchdogs_check_BufWritePost_enable = 1
  let g:quickrun_config = {
        \   'watchdogs_checker/_': {
        \     'hook/close_quickfix/enable_exit': 1,
        \   },
        \ }
  call watchdogs#setup(g:quickrun_config)
" }}}

" ----------
" vimfiler setting. {{{
" ----------
  let g:my_vimfiler_explorer_name = 'explorer'
  let g:my_vimfiler_winwidth = 35
  let g:vimfiler_edit_action = 'nicely_open'
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
  let g:my_unite_project_dir = ""
  let g:unite_enable_start_insert = 0
  let g:unite_split_rule = "botright"
  let g:unite_source_grep_default_opts = '-Hni'
  let g:unite_source_file_mru_filename_format = ''
  let g:unite_source_file_rec_min_cache_files = 0
  let g:unite_source_file_rec_ignore_pattern = ".sass-cache"
  let g:unite_update_time = 100
  let g:unite_winheight = 15
  execute 'let g:unite_data_directory=expand("~/.unite")'
  call unite#set_profile('action', 'context', { 'no_start_insert': 1 })
" }}}

" ----------
" unite menu source. {{{
" ----------
  let g:unite_source_menu_menus = {}
  let g:unite_source_menu_menus.global = { 'description': 'global menu.' }
  let g:unite_source_menu_menus.global.candidates = {
        \ 'NeoSnippetEdit': 'NeoSnippetEdit',
        \ 'Unite neobundle/update': 'Unite neobundle/update',
        \ }
  function! g:unite_source_menu_menus.global.map(key, value)
    return { 'word': a:key, 'kind': 'command', 'action__command': a:value }
  endfunction
" }}}

" ----------
" custom unite filter. {{{
" ----------
  let filter = { 'name' : 'matcher_remove' }
  function! filter.filter(candidates, context)
    let candidates = a:candidates
    for regex in ['*vimfiler*', '*vimshell*']
      let candidates = filter(a:candidates, 'v:val.word !~# "'. regex. '"')
    endfor
    return candidates
  endfunction
  call unite#define_filter(filter)
  call unite#custom_filters('buffer_tab', ['matcher_remove', 'matcher_glob', 'converter_default', 'sorter_default'])
  let filter = { 'name' : 'matcher_unique' }
  function! filter.filter(candidates, context)
    let i = 0
    let candidates = []
    for candidate1 in a:candidates
      let found = 0
      for candidate2 in a:candidates
        if !(candidate1 is candidate2) && candidate1.action__path == candidate2.action__path
          let found = 1
        endif
      endfor
      if !found
        call add(candidates, candidate1)
      endif
    endfor
    return candidates
  endfunction
  call unite#define_filter(filter)
  call unite#custom_filters('vimfiler/history', ['matcher_unique', 'matcher_glob', 'converter_default', 'sorter_default'])
" }}}

" ----------
" custom unite action. {{{
" ----------
  " nicely_open.
  let action = { 'is_selectable' : 1 }
  function! action.func(candidates)
    execute g:my_unite_get_prev_winnr() . 'wincmd w'
    execute 'edit ' . a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'nicely_open', action)

  " nicely_split.
  let action = { 'is_selectable' : 1 }
  function! action.func(candidates)
    execute g:my_unite_get_prev_winnr() . 'wincmd w'
    execute 'split ' . a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'nicely_split', action)

  " nicely_vsplit.
  let action = { 'is_selectable' : 1 }
  function! action.func(candidates)
    execute g:my_unite_get_prev_winnr() . 'wincmd w'
    execute 'vsplit ' . a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'nicely_vsplit', action)

  " my_project_cd.
  let action = { 'is_selectable' : 1 }
  function! action.func(candidates)
    let g:my_unite_project_dir = a:candidates[0].action__directory
  endfunction
  call unite#custom_action('file', 'my_project_cd', action)

  " get previous winnr for unite custom action.
  function! g:my_unite_get_prev_winnr()
    let ftypes = ['unite', 'vimshell', 'vimfiler']

    " vimfiler or unite has prev_winnr?
    if exists('b:vimfiler.prev_winnr')
      let nr = b:vimfiler.prev_winnr
    endif
    if exists('b:unite.prev_winnr')
      let nr = b:unite.prev_winnr
    endif

    " return b:{vimfiler,unite}.prev_winnr if don't match ftypes.
    if exists('nr') && (index(ftypes, getwinvar(nr, '&filetype')) < 0)
      return nr
    endif

    " auto detect.
    let winnrs = range(1, winnr('$'))
    if len(winnrs) == 1
      return winnrs[0]
    endif
    if len(winnrs) <= 2
      return filter(winnrs, 'getwinvar(v:val, "&filetype") != "vimfiler"')[0]
    endif
    let winnrs = filter(winnrs, 'index(ftypes, getwinvar(v:val, "&filetype")) < 0')
    if empty(winnrs)
      return winnr()
    endif
    return winnrs[0]
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
" neocomplcache setting. {{[
" ----------
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_smart_case = 1
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
  let g:neocomplcache_enable_fuzzy_completion = 0 " なぜか動かないので OFF
  let g:neocomplcache_enable_wildcard = 1
  let g:neocomplcache_fuzzy_completion_start_length = 2
  let g:neocomplcache_auto_completion_start_length = 2
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
" }}}

" ----------
" vimshell setting. {{{
" ----------
  let g:vimshell_popup_height = 40
  let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
  let g:vimshell_disable_escape_highlight = 1
  let g:vimshell_prompt = (s:is_win ? $USERNAME : $USER) . ' > '
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
  if !exists('g:versions#info')
    let g:versions#info = {}
  endif
  let g:versions#info.git = '(%s) - (%b)'
  let g:versions#info.svn = '(%s) - (%R)'
  let g:versions#type#svn#status#ignore_status = ['X']
" }}}

" ----------
" prettyprint setting. {{{
" ----------
  let g:prettyprint_indent = 2
  let g:prettyprint_width = 50
" }}}

" ----------
" zencoding setting. {{{
" ----------
  let g:user_zen_expandabbr_key = '<C-k>'
  let g:user_zen_complete_tag = 1
  let g:user_zen_settings = {}
  let g:user_zen_settings['html'] = { 'lang': 'ja', 'indentation': '  ' }
  let g:user_zen_settings['php']  = { 'extends': 'html', 'filters': 'c', 'indentation': '    ' }
  let g:user_zen_settings['xml']  = { 'extends': 'html', 'indentation': '    ' }
" }}}

" ----------
" trailingwhitespace setting. {{{
" ----------
  let g:trailing_whitespace_fix_events = {}
" }}}

" ----------
" shadow setting. {{{
" ----------
  let g:shadow_debug = 1
" }}}

" ----------
" powerline. {{{
" ----------
  let g:Powerline_symbols = 'compatible'
  let g:Powerline_stl_path_style = 'filename'
  let g:Powerline#Functions#versions#GetBranchLifeTime = 5
  call Pl#Theme#RemoveSegment('lineinfo')
  call Pl#Theme#RemoveSegment('scrollpercent')
  call Pl#Theme#InsertSegment('versions:branch', 'after', 'filetype')
" }}}

" ----------
" memo. {{{
" ----------
" 2012-11-27:
" 人生もっと楽しく生きたい。
" vim をいじっている時はたのし～。
" 人生もっと遊びたい。

