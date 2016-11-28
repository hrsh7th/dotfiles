scriptencoding utf-8
set nocompatible
set encoding=utf-8

" ########################################################################################################################
" Install Setting.
" ########################################################################################################################
let s:dein = {}
let s:dein.dir = {}
let s:dein.dir.install = $XDG_CONFIG_HOME . '/dein/repos/github.com/Shougo/dein.vim'
let s:dein.dir.plugins = $XDG_CONFIG_HOME . '/dein'

if !isdirectory(s:dein.dir.install)
  call system(printf('git clone https://github.com/Shougo/dein.vim %s', shellescape(s:dein.dir.install)))
endif

filetype plugin off
filetype indent off
let &runtimepath = s:dein.dir.install . ',' . &runtimepath

call dein#begin(s:dein.dir.plugins)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/deol.nvim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neco-vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/vimproc', {'build': 'make'})
call dein#add('Shougo/vimshell')
call dein#add('h1mesuke/vim-alignta')
call dein#add('haya14busa/vim-auto-programming')
call dein#add('hrsh7th/vim-versions')
call dein#add('lambdalisue/vim-findent')
call dein#add('leafgarland/typescript-vim')
call dein#add('neomake/neomake')
call dein#add('othree/es.next.syntax.vim')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('othree/yajs.vim')
call dein#add('t9md/vim-quickhl')
call dein#add('thinca/vim-prettyprint')
call dein#add('thinca/vim-qfreplace')
call dein#add('thinca/vim-quickrun')
call dein#add('tyru/open-browser.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('vim-scripts/sudo.vim')
call dein#add('w0ng/vim-hybrid')
call dein#local('~/Development/Repository', {}, [])
call dein#end()

if dein#check_install()
  call dein#install()
endif

syntax enable
filetype plugin on
filetype indent on
syntax on

" ########################################################################################################################
" General Setting
" ########################################################################################################################
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
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
set splitbelow
set tags=./tags;,./.tags;
set mouse=n
if has('persistent_undo')
  set undodir=~/.vimundo
  set undofile
endif
set pastetoggle=<F9>

" ########################################################################################################################
" Visual Setting.
" ########################################################################################################################
let g:impact_transbg=1
set background=dark
set t_Co=256
set termguicolors
set shortmess+=I
set modeline
set modelines=2
set wildmenu
set wildmode=longest:list,list
set title
set showtabline=2
set cmdheight=2
set laststatus=2
set nowrap
set number
set list
set listchars=tab:\|\ ,trail:^
set pumheight=20
" set previewheight=20
set tabline=%!MyTabLine()
set cursorline


" ########################################################################################################################
" Search Setting.
" ########################################################################################################################
set inccommand=nosplit
set incsearch
set hlsearch
set ignorecase
set smartcase
set suffixesadd=.php,.js,.rb,.java,.json,.md,.as
set path+=./;/
set includeexpr=MyIncludeExpr(v:fname)

" ########################################################################################################################
" Edit Setting.
" ########################################################################################################################
set autoindent
set cindent
set smartindent
set shiftwidth=2
set textwidth=0
set expandtab
set tabstop=2
set softtabstop=2
set backspace=2
set whichwrap=b,s,h,l,<,>,[,]
set completefunc=autoprogramming#complete

" ########################################################################################################################
" Key Setting.
" ########################################################################################################################
" --------------------
" General.
" --------------------
let mapleader="\<SPACE>"
nnoremap q :<C-u>q<CR>
nnoremap <Leader>t :<C-u>tabclose<CR>
nnoremap <Leader>! :<C-u>q!<CR>
nnoremap <Leader>w :<C-u>w<CR>
nmap ; :
nmap : ;
nnoremap = ^
vnoremap = ^
nnoremap + =
vnoremap + =
nnoremap @ q
nnoremap j gj
nnoremap k gk
nnoremap < <<<Esc>
nnoremap > >><Esc>
vnoremap < <<<Esc>
vnoremap > >><Esc>
nnoremap <expr><silent><Leader><Esc> printf(":\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>\<CR>",
      \ dein#tap('vim-quickhl') ? 'QuickhlManualReset' : 'nohlsearch',
      \ dein#tap('vim-quickhl') ? 'QuickhlCwordDisable' : 'nohlsearch',
      \ 'nohlsearch',
      \ 'syntax on',
      \ 'redraw!'
      \ )

" --------------------
" Buffer, Window, Tab Moving.
" --------------------
" buffer.
nnoremap H 15h
nnoremap J 8j
nnoremap K 8k
nnoremap L 15l
vnoremap H 15h
vnoremap J 8j
vnoremap K 8k
vnoremap L 15l
nmap <TAB> %
vmap <TAB> %
inoremap <C-l> <C-o>l
inoremap <C-h> <C-o>h
inoremap ] <C-n>
inoremap <expr>} pumvisible() ? "\<C-p>" : "}"

" window.
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" tab.
nnoremap <Leader>L :<C-u>tabnext<CR>
nnoremap <Leader>H :<C-u>tabprev<CR>

" --------------------
" CmdWindow.
" --------------------
nnoremap : q:
xnoremap : q:
vnoremap <CR> :<UP><CR>

" --------------------
" Utility.
" --------------------
" handy replace.
nnoremap <Leader>*  *:<C-u>%s/<C-r>///g<C-f><LEFT><LEFT>
vnoremap <Leader>*  y:<C-u>%s/<C-r>"//g<C-f><LEFT><LEFT>
vnoremap <expr><CR> printf(':s/%s//g<C-f><LEFT><LEFT>', expand('<cword>'))

" replace word by register.
nnoremap cir ciw<C-r>0<Esc>:<C-u>let@/=@1<CR>:noh<CR>

" join line.
nnoremap <C-j> gJ

" gf.
nnoremap gf<CR> gf
nnoremap gfv :<C-u>vsplit<CR>gf
nnoremap gfs :<C-u>split<CR>gf

" pairs.
inoremap <expr><CR> MyPairEnterMapping()
inoremap <expr><BS> MyPairBackSpaceMapping()
imap <expr><TAB> MyPairIsBetween() ? '<RIGHT>' : '<TAB>'
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap < <><Left>

" --------------------
" Project.
" --------------------
nnoremap <expr><F5> MyProjectRootDecide()

" --------------------
" Plugin.
" --------------------
if dein#tap('vimfiler')
  nnoremap <expr><F2> printf(':<C-u>VimFiler -buffer-name=explorer -split -direction=topleft -simple -winwidth=%s -toggle -no-quit %s<CR>', g:my_vimfiler_winwidth, expand('%:p:h'))
endif

if dein#tap('unite.vim')
  nnoremap <expr><F3> printf(':<C-u>Denite file_rec:%s<CR>', MyProjectRootDetect(expand('%:p'), {}))
endif

if dein#tap('unite.vim') && dein#tap('vim-versions')
  nnoremap <expr><Leader><Leader> printf(':<C-u>Unite versions:%s<CR>', MyProjectRootDetect(expand('%:p'), {'ignore_project_root_vars': 1}))
  nnoremap <F6> :<C-u>UniteVersions status:!<CR>
  nnoremap <F7> :<C-u>UniteVersions log:%<CR>
endif

if dein#tap('vim-quickhl')
  nmap <Leader>m <Plug>(quickhl-manual-this)
  vmap <Leader>m <Plug>(quickhl-manual-this)
endif

if dein#tap('incsearch.vim')
  map / <Plug>(incsearch-forward)
  map ? <Plug>(incsearch-backward)
endif

if dein#tap('open-browser.vim')
  nmap <Leader><CR> <Plug>(openbrowser-smart-search)
endif

if dein#tap('denite.nvim')
  nnoremap <Leader>0 :<C-u>Denite menu<CR>
  nnoremap <Leader>i :<C-u>Denite buffer<CR>
  nnoremap <Plug>(my-denite-grep) :<C-u>Denite -buffer-name=grep grep<CR>
  nnoremap <Plug>(my-denite-grep-next) :<C-u>Denite -resume -immediately -select=+1 -no-empty -buffer-name=grep<CR>
  nnoremap <Plug>(my-denite-grep-prev) :<C-u>Denite -resume -immediately -select=-1 -no-empty -buffer-name=grep<CR>
  nmap gr <Plug>(my-denite-grep)
  nmap <Leader>n <Plug>(my-denite-grep-next)
  nmap <Leader>p <Plug>(my-denite-grep-prev)
endif

if dein#tap('unite.vim') && dein#tap('unite-outline')
  nnoremap <F8> :<C-u>Denite unite:outline<CR>
endif

" ########################################################################################################################
" Function.
" ########################################################################################################################
" pairs.
let g:my_pairs = {'(': ')', '[': ']', '{': '}', '"': '"', "'": "'", '<': '>', '>': '<'}
function! MyPairEnterMapping()
  if MyPairIsBetween()
    return "\<CR>\<UP>\<END>\<CR>"
  endif
  return "\<CR>"
endfunction
function! MyPairBackSpaceMapping()
  if MyPairIsSandwiched()
    return "\<RIGHT>\<BS>\<BS>"
  endif
  return "\<BS>"
endfunction
function! MyPairIsSandwiched()
  if exists("g:my_pairs[getline('.')[col('.') - 2]]")
    if getline('.')[col('.') - 1] == g:my_pairs[getline('.')[col('.') - 2]]
      return 1
    endif
  endif
  return 0
endfunction
function! MyPairIsBetween()
  for left_paren in keys(g:my_pairs)
    if getline('.')[col('.') - 1] == g:my_pairs[left_paren]
      return searchpair(left_paren, '', g:my_pairs[left_paren], 'bW')
    endif
  endfor
  return 0
endfunction

" project.
let g:my_project_root_detectors = ['.svn', '.git', 'package.json', 'composer.json']
function! MyProjectRootDetect(path, option)
  if exists('t:my_project_root_dir') && !exists('a:option.ignore_project_root_vars')
    return t:my_project_root_dir
  endif

  let path = a:path
  let path = exists('b:vimfiler.current_dir') ? fnamemodify(b:vimfiler.current_dir, ':p') : path
  let path = exists('b:vimshell.current_dir') ? fnamemodify(b:vimshell.current_dir, ':p') : path
  let path = exists('b:unite.prev_bufnr') ? fnamemodify(bufname(b:unite.prev_bufnr), ':p') : path

  while path != '/'
    for detect in g:my_project_root_detectors
      let target = printf('%s/%s', MyTrimRight(path, '/'), detect)
      if isdirectory(target) || filereadable(target)
        return path
      endif
    endfor
    let path = fnamemodify(path, ':p:h:h')
  endwhile
  return expand('%:p:h')
endfunction

function! MyProjectRootDecide()
  if exists('t:my_project_root_dir')
    unlet t:my_project_root_dir
  endif

  let path = MyProjectRootDetect(expand('%:p'), {})
  let path = exists('b:vimfiler.current_dir') ? fnamemodify(b:vimfiler.current_dir, ':p') : path
  let path = exists('b:vimshell.current_dir') ? fnamemodify(b:vimshell.current_dir, ':p') : path
  let path = exists('b:unite.prev_bufnr') ? fnamemodify(bufname(b:unite.prev_bufnr), ':p') : path
  let t:my_project_root_dir = path

  echomsg t:my_project_root_dir
  execute printf('cd %s', t:my_project_root_dir)

  if dein#tap('unite.vim')
    call unite#do_action('cd')
  endif
  if dein#tap('neomru.vim')
    NeoMRUSave
  endif
endfunction

" tabline.
function! MyTabLine()
  let s:dir = get(t:, 'my_project_root_dir', MyProjectRootDetect(expand('%:p'), {}))

  let s:titles = join(map(range(1, tabpagenr('$')), 'MyTabTitle(v:val)'), '|') . '|'

  let s:branch = 'no detect'
  if dein#tap('vim-versions')
    try
      let s:branch = versions#info({'path': s:dir})
    finally
    endtry
  endif

  return join([s:titles, '%=', s:dir, ' - ', printf('%s', s:branch)], '')
endfunction

function! MyTabTitle(tabnr)
  let bufnrs = MyBufferFilter(tabpagebuflist(a:tabnr))
  return len(bufnrs) <= 0 ? '' : printf(' %s%s: %s',
        \ a:tabnr is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#',
        \ a:tabnr,
        \ printf('%s', MyEllipsis(MyPad(fnamemodify(bufname(bufnrs[0]), ':t'), ' ', 30), 30)),
        \ )
endfunction

" include expr.
function! MyIncludeExpr(fname)
  let fname = a:fname
  let fname = substitute(fname, '^\\/', '', '')
  let fname = join(filter(split(fname, '/'), "v:val =~ '^[0-9A-Za-z_\.-]*$'"), '/')
  return fname
endfunction

" trim.
function! MyTrim(str, trim)
  return MyTrimLeft(MyTrimRight(a:str, a:trim), a:trim)
endfunction
function! MyTrimRight(str, trim)
  return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction
function! MyTrimLeft(str, trim)
  return substitute(a:str, printf('^%s', a:trim), '', 'g')
endfunction

" ellipsis and pad.
function! MyEllipsis(str, max)
  return strpart(a:str, 0, a:max)
endfunction
function! MyPad(str, char, max)
  return a:str . repeat(a:char, a:max)
endfunction

" buffer.
function! MyBufferFilter(bufnrs)
  let bufnrs = []
  for bufnr in a:bufnrs
    if index(["unite", "vimfiler", "vimshell"], getbufvar(bufnr, "&filetype")) < 0
      let bufnrs = add(bufnrs, bufnr)
    endif
  endfor
  return bufnrs
endfunction

" ########################################################################################################################
" Plugin Setting.
" ########################################################################################################################
" --------------------
" vim-hybrid.
" --------------------
if dein#tap('vim-hybrid')
  let g:hybrid_custom_term_colors = 1
  let g:hybrid_reduced_contrast = 1
  colorscheme hybrid
else
  colorscheme ron
endif
hi clear CursorLine | hi CursorLine gui=underline

" --------------------
" vim-versions.
" --------------------
if dein#tap('vim-versions')
  if !exists('g:versions#info')
    let g:versions#info = {}
  endif
  let g:versions#info.git = '%b'
  let g:versions#info.svn = '%b'
endif

" --------------------
" deoplete.nvim.
" --------------------
if dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
endif

" --------------------
" neomru.vim.
" --------------------
if dein#tap('neomru.vim')
  let g:neomru#directory_mru_ignore_pattern = join(['\.config'], '\|')
endif

" --------------------
" vimshell.
" --------------------
if dein#tap('vimshell')
  let g:vimshell_split_command = 'tabnew'
  let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
  let g:vimshell_prompt = '$ '
  let g:vimshell_popup_height = 12
  let g:vimshell_popup_command = join([
        \ 'topleft sp',
        \ 'execute printf("resize %s", g:vimshell_popup_height)',
        \ 'set winfixheight'
        \ ], '|')

  autocmd! FileType vimshell call MyVimShellSetting()
  function! MyVimShellSetting()
    nmap <buffer>a GA
  endfunction
endif

if dein#tap('vimshell') && dein#tap('vim-versions')
  let g:vimshell_right_prompt = 'versions#info()'
endif

" --------------------
" vimfiler.
" --------------------
if dein#tap('vimfiler')
  let g:my_vimfiler_winwidth = 35
  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_directory_display_top = 1
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '-'
  let g:vimfiler_tree_closed_icon = '+'

  call vimfiler#custom#profile('default', 'context', {'auto-cd': 1, 'safe': 0, 'fnamewidth': 0})

  autocmd! FileType vimfiler call MyVimFilerSetting()
  function! MyVimFilerSetting()
    unmap <buffer><Leader>
    nmap <buffer><Esc>       <Plug>(vimfiler_close)
    nmap <buffer>q           <Plug>(vimfiler_close)
    nmap <buffer>:q          <Plug>(vimfiler_close)
    nmap <buffer><Leader>q   <Plug>(vimfiler_close)
    nmap <buffer>c           <Plug>(vimfiler_clipboard_copy_file)
    nmap <buffer>m           <Plug>(vimfiler_clipboard_move_file)
    nmap <buffer>p           <Plug>(vimfiler_clipboard_paste)
    nmap <buffer><TAB>       <Plug>(vimfiler_choose_action)
    nmap <buffer>@           <Plug>(vimfiler_toggle_mark_current_line)
    nmap <buffer>j           j<Plug>(vimfiler_print_filename)
    nmap <buffer>k           k<Plug>(vimfiler_print_filename)
    nmap <buffer>gr          <Plug>(my-denite-grep)
    nmap <buffer><expr><CR>  vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "e")
    nnoremap <silent><buffer>b                  :<C-u>Unite bookmark directory_mru<CR>
    nnoremap <silent><buffer><expr><Leader><CR> printf(':<C-u>new \| VimFiler -create -simple -winwidth=%s -no-quit<CR>', g:my_vimfiler_winwidth)
    nnoremap <silent><buffer><expr><BS>         vimfiler#do_action('cd')
    nnoremap <silent><buffer><expr>v            vimfiler#do_switch_action('vsplit')
    nnoremap <silent><buffer><expr>s            vimfiler#do_switch_action('split')
  endfunction
endif

" --------------------
" unite.vim.
" --------------------
if dein#tap('unite.vim')
  let g:unite_data_directory = expand("~/.unite")
  let g:unite_source_rec_min_cache_files = 0
  let g:unite_source_rec_max_cache_files = 100000
  let g:unite_source_grep_recursive_opt = '-ri'

  call unite#custom#profile('default', 'context', {'no_start_insert': 1, 'start_insert': 0, 'winheight': 12, 'direction': 'botright', 'max_multi_lines': 1})
  call unite#custom#profile('source/grep', 'context', {'no_quit' : 1})
  call unite#custom#source('file_rec/neovim', 'ignore_pattern', join(['\.git\/', '\.svn\/', '\/\(image\|img\)\/', 'node_modules', 'vendor'], '\|'))
  call unite#custom#default_action('directory', 'cd')

  autocmd! FileType unite call MyUniteSetting()
  function! MyUniteSetting()
    unmap <buffer><Leader>
    nmap <buffer><Esc>     <Plug>(unite_all_exit)
    nmap <buffer>q         <Plug>(unite_all_exit)
    nmap <buffer>:q        <Plug>(unite_all_exit)
    nmap <buffer><Leader>q <Plug>(unite_all_exit)
    nmap <buffer>@         <Plug>(unite_toggle_mark_current_candidate)
    nmap <buffer>a         G<Plug>(unite_append_end)
    nmap <buffer>i         <Plug>(unite_insert_enter)
    nnoremap <silent><buffer><expr>v unite#do_action('vsplit')
    nnoremap <silent><buffer><expr>s unite#do_action('split')
  endfunction
endif

" --------------------
" denite.nvim.
" --------------------
if dein#tap('denite.nvim')
  " common.
  call denite#custom#map('normal', '<Esc>', '<denite:quit>')
  call denite#custom#map('normal', '<Tab>', '<denite:choose_action>')
  call denite#custom#map('normal', 'q', '<denite:quit>')
  call denite#custom#map('normal', 'i', '<denite:enter_mode:insert>')
  call denite#custom#map('normal', 'a', '<denite:enter_mode:insert>')
  call denite#custom#map('normal', 'v', '<denite:do_action:vsplit>')
  call denite#custom#map('normal', 's', '<denite:do_action:split>')
  call denite#custom#map('normal', 'h', '<prompt:move_caret_to_left>')
  call denite#custom#map('normal', 'l', '<prompt:move_caret_to_right>')
  call denite#custom#map('normal', '0', '<prompt:move_caret_to_head>')
  call denite#custom#map('normal', '$', '<prompt:move_caret_to_tail>')
  call denite#custom#map('insert', '<Tab>', '<denite:choose_action>')
  call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>')
  call denite#custom#option('default,grep', 'vertical_preview', v:true)
  call denite#custom#option('default,grep', 'mode', 'normal')
  call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])

  " menu.
  let s:menus = {}
  let s:menus.other = {'description': 'other.'}
  let s:menus.other.command_candidates = [
        \ ['open todo', 'e ~/Memo/todo.md'],
        \ ]
  let s:menus.string = {'description': 'string utilities.'}
  let s:menus.string.command_candidates = [
        \ ['format: reverse lines', 'g/^/m0'],
        \ ['format: remove ^M', '%s///g'],
        \ ['format: querystring', 'silent! %s/&amp;/\&/g | silent! %s/&/\r/g | silent! %s/=/\r\t=/g'],
        \ ]
  let s:menus.vim = {'description': 'vim runtime.'}
  let s:menus.vim.command_candidates = [
        \ ['upgrade: dein:deps', 'call dein#update()'],
        \ ['upgrade: nvim:self', '!brew tap neovim/neovim && brew reinstall --HEAD --with-release neovim'],
        \ ['upgrade: pip3:self', '!pip3 install --force-reinstall --upgrade pip'],
        \ ['upgrade: pip3:deps', '!pip3 install --force-reinstall --upgrade neovim'],
        \ ]
  call denite#custom#var('menu', 'menus', s:menus)
	call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [
        \ '*~',
        \ '*.o',
        \ '*.exe',
        \ '*.bak',
        \ '.DS_Store',
        \ '*.pyc',
        \ '*.sw[po]',
        \ '*.class',
        \ '.hg/',
        \ '.git/',
        \ '.bzr/',
        \ '.svn/',
        \ 'tags',
        \ 'tags-*',
        \ 'node_modules/',
        \ '.{jpg,jpeg,gif,png}'
        \ ])
endif

" --------------------
" denite.nvim.
" --------------------
if dein#tap('neomake')
  let g:neomake_open_list = 1
  let g:neomake_list_height = 10
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_typescript_enabled_makers = ['tsc']
endif

" ########################################################################################################################
" AutoCmd Setting.
" ########################################################################################################################
augroup MyAutoCmd
  autocmd!

  autocmd! FileType * call MyFileTypeSetting()
  function! MyFileTypeSetting()
    " alias filetype.
    if index(['atlas'], getbufvar(bufnr('%'), '&filetype')) >= 0
      set filetype=actionscript
      return
    endif
    if index(['js', 'as', 'actionscript'], getbufvar(bufnr('%'), '&filetype')) >= 0
      set filetype=javascript
      return
    endif

    Findent
  endfunction

  " BufEnter.
  autocmd! BufEnter * call MyBufEnterSetting()
  function! MyBufEnterSetting()
    if filereadable(expand('%'))
      execute printf('lcd %s', expand('%:p:h'))
    endif
    let &titlestring = expand('%')
  endfunction

  " TermOpen.
  autocmd! TermOpen term://* call MyTermOpenSetting()
  function! MyTermOpenSetting()
    set filetype=terminal
    tnoremap <buffer><Esc> <C-\><C-n>
    nnoremap <buffer>a     GA
  endfunction

  " WinEnter.
  autocmd! CmdwinEnter * call MyCmdwinEnterSetting()
  function! MyCmdwinEnterSetting()
    nnoremap <buffer><silent><Esc> :<C-u>q<CR>
    nnoremap <buffer>a     A
    startinsert!
  endfunction

  " WinLeave.
  autocmd! WinLeave * call MyWindowSetting()
  function! MyWindowSetting()
    let current_winnr = winnr()

    " vimshell.
    for winnr in range(0, winnr('$'))
      if index(['vimshell', 'terminal'], getbufvar(winbufnr(winnr), '&filetype')) > -1
        execute printf('%swincmd w', winnr)
        execute printf('wincmd K | resize %s', 12)
        break
      endif
    endfor

    silent noautocmd execute printf('%swincmd w', current_winnr)
  endfunction

  " BufWritePost.
  autocmd! BufWritePost * call MyBufWritePostSetting()
  function! MyBufWritePostSetting()
    if dein#tap('neomake')
      Neomake
    endif
  endfunction

augroup END

