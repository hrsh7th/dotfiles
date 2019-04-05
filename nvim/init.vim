if has('vim_starting')
  set encoding=utf-8
endif
scriptencoding utf-8

let g:loaded_matchparen = 1
let g:loaded_python_provider = 1
let g:python_host_skip_check = 1
let g:python_host_prog = 'python3'
let g:python3_host_skip_check = 1
let g:python3_host_prog = 'python3.6'

let $MYVIMRC = resolve(expand('~/.config/nvim/init.vim'))

" ########################################################################################################################
" Install Setting.
" ########################################################################################################################
let dein = {}
let dein.dir = {}
let dein.dir.install = $XDG_CONFIG_HOME . '/dein/repos/github.com/Shougo/dein.vim'
let dein.dir.plugins = $XDG_CONFIG_HOME . '/dein'

if !isdirectory(dein.dir.install)
  call system(printf('git clone https://github.com/Shougo/dein.vim %s', shellescape(dein.dir.install)))
endif

let &runtimepath = &runtimepath . ',' . dein.dir.install

if dein#load_state(dein.dir.install)
  call dein#begin(dein.dir.plugins)
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deol.nvim')
  call dein#add('Shougo/deoplete.nvim', { 'rev': 'callback' })
  call dein#add('Shougo/echodoc.vim')
  call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('hrsh7th/deoplete-vim-lsc')
  call dein#add('hrsh7th/vim-denite-gitto')
  call dein#add('hrsh7th/vim-effort-gf')
  call dein#add('hrsh7th/vim-gitto')
  call dein#add('hrsh7th/vim-locon')
  call dein#add('hrsh7th/vim-neco-calc')
  call dein#add('itchyny/lightline.vim')
  call dein#add('kmnk/denite-dirmark')
  call dein#add('kristijanhusak/defx-icons')
  call dein#add('lambdalisue/vim-findent')
  call dein#add('natebosch/vim-lsc')
  call dein#add('nightsense/cosmic_latte')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('t9md/vim-choosewin')
  call dein#add('t9md/vim-quickhl')
  call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })
  call dein#add('thinca/vim-prettyprint')
  call dein#add('thinca/vim-qfreplace')
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-themis')
  call dein#add('tpope/vim-surround')
  call dein#add('tyru/open-browser.vim')
  call dein#add('w0rp/ale')
  call dein#local('~/Development/workspace/LocalVimPlugins')
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

augroup vimrc
  autocmd!
augroup END

" ########################################################################################################################
" Terminal Colors Setting
" ########################################################################################################################
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let base16colorspace=256
set t_Co=256
let $TERM='xterm256-color'
set termguicolors

" ########################################################################################################################
" General Setting
" ########################################################################################################################
set updatetime=500
set autoread
set hidden
set nobackup
set noswapfile
set virtualedit=all
set scrolloff=3
set sidescrolloff=3
set scrollback=2000
set complete=.
set completeopt-=preview
set noerrorbells
set novisualbell
set t_vb=
set clipboard+=unnamedplus
set isfname-==
set isfname+=\\
set diffopt=filler,iwhite
set wildchar=]
set splitright
set splitbelow
set tags=./tags;,./.tags;
set synmaxcol=512
set mouse=n
if has('persistent_undo')
  set undodir=~/.vimundo
  set undofile
endif
set pastetoggle=<F9>
set shell=bash

" ########################################################################################################################
" Visual Setting.
" ########################################################################################################################
set shortmess+=I
set modeline
set modelines=2
set wildmenu
set wildmode=longest:full
set title
set showtabline=2
set cmdheight=2
set laststatus=2
set nowrap
set number
set list
set listchars=tab:>-,trail:^
set pumheight=50
set nocursorline
set noshowmode
set ambiwidth=double
set fillchars+=vert:\ ,eob:\ 

" ########################################################################################################################
" Search Setting.
" ########################################################################################################################
set incsearch
set hlsearch
set ignorecase
set smartcase
set suffixesadd=.php,.tpl,.ts,.tsx,.css,.scss,.rb,.java,.json,.md,.as,.js,.jpg,.jpeg,.gif,.png,.vim
set matchpairs=(:),[:],{:}
set path+=./;/
set inccommand=split

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

" ########################################################################################################################
" Key Setting.
" ########################################################################################################################
" --------------------
" General.
" --------------------
let mapleader="\<Space>"
nnoremap q :<C-u>q<CR>
nnoremap Q :<C-u>qa!<CR>
nnoremap <Leader>t :<C-u>tabclose<CR>
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
" cnoremap <Tab> <C-l>
nnoremap <expr><silent><Leader><Esc> printf(":\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>",
      \ dein#tap('vim-quickhl') ? 'QuickhlManualReset' : 'nohlsearch',
      \ dein#tap('vim-quickhl') ? 'QuickhlCwordDisable' : 'nohlsearch',
      \ 'nohlsearch',
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
nnoremap <C-h> <C-o>
nnoremap <C-l> <C-i>
nmap <Tab> %
vmap <Tab> %
inoremap <C-l> <C-o>l
inoremap <C-h> <C-o>h
inoremap <expr>] pumvisible() ? "\<C-n>" : "]"
inoremap <expr>} pumvisible() ? "\<C-p>" : "}"
nnoremap <expr>i len(getline('.')) == 0 ? "cc" : "i"

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

" --------------------
" Utility.
" --------------------
" handy replace.
nnoremap <Leader>*  *:<C-u>%s/<C-r>///g<C-f><Left><Left>
vnoremap <Leader>*  y:<C-u>%s/<C-r>"//g<C-f><Left><Left>
vnoremap <expr><CR> printf(':s/%s//g<C-f><Left><Left>', expand('<cword>'))

" replace word by register.
nnoremap cir ciw<C-r>0<Esc>:<C-u>let@/=@1<CR>:noh<CR>

" join line.
nnoremap <C-j> gJ

" gf.
nnoremap gf<CR> :<C-u>EffortGF<CR>
nnoremap gfs :<C-u>split EffortGF<CR>
nnoremap gfv :<C-u>vertical EffortGF<CR>

" pairs.
inoremap <expr><CR> MyPairEnterMapping()
inoremap <expr><BS> MyPairBackSpaceMapping()
imap <expr><Tab> MyPairIsBetween() ? '<Right>' : '<Tab>'
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
" Plugin Mapping.
" --------------------
if dein#tap('vim-quickrun')
  let g:quickrun_no_default_key_mappings = 1
  nnoremap <Leader><Leader>r :<C-u>QuickRun<CR>
endif

if dein#tap('defx.nvim')
  nnoremap <F2> :<C-u>call OpenDefx()<CR>
  function! OpenDefx()
    let path = expand('%:p:h')
    let winnrs = filter(range(1, tabpagewinnr(tabpagenr(), '$')), { i, wnr -> getbufvar(winbufnr(wnr), '&filetype') == 'defx' })
    let choise = choosewin#start(winnrs, { 'auto_choose': 1, 'blink_on_land': 0, 'noop': 1 })
    if len(choise) > 0
      execute printf('%swincmd w', choise[1])
      call defx#call_action('cd', [path])
    else
      Defx -auto-cd -split=vertical -direction=topleft -winwidth=35 `expand('%:p:h')`
    endif
  endfunction
endif

if dein#tap('denite.nvim') && dein#tap('vim-gitto') && dein#tap('vim-denite-gitto')
  nnoremap <Leader><BS> :<C-u>Denite gitto<CR>
endif

if dein#tap('vim-quickhl')
  nmap <Leader>m <Plug>(quickhl-manual-this)
  vmap <Leader>m <Plug>(quickhl-manual-this)
endif

if dein#tap('open-browser.vim')
  nmap <Leader><Leader><CR> <Plug>(openbrowser-smart-search)
endif

if dein#tap('denite.nvim')
  nnoremap <BS> :<C-u>Denite buffer file_mru<CR>
  nnoremap <expr><F3> printf(':<C-u>Denite -auto-resume file/rec:%s<CR>', MyProjectRootDetect(locon#get('get_buffer_path'), {}))
  nnoremap <expr>gr printf(':<C-u>Denite -auto-resume -no-empty grep:%s<CR>', fnameescape(MyProjectRootDetect(locon#get('get_buffer_path'), {})))
  nnoremap <Leader>0 :<C-u>Denite menu<CR>
  nnoremap <Leader><Leader>m :<C-u>Denite -resume<CR>
  nnoremap <Leader>n :<C-u>Denite -resume -immediately -cursor-pos=+1 -no-empty<CR>
  nnoremap <Leader>p :<C-u>Denite -resume -immediately -cursor-pos=-1 -no-empty<CR>
endif


" ########################################################################################################################
" Function.
" ########################################################################################################################
" pairs.
let g:my_pairs = {'(': ')', '[': ']', '{': '}', '"': '"', "'": "'", '<': '>', '>': '<'}
function! MyPairEnterMapping()
  if MyPairIsSandwiched()
    return "\<CR>\<Up>\<End>\<CR>"
  endif
  return "\<CR>"
endfunction
function! MyPairBackSpaceMapping()
  if MyPairIsSandwiched()
    return "\<Right>\<BS>\<BS>"
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
function! MyProjectRootDetect(path, option)
  if exists('t:my_project_root_dir') && !exists('a:option.ignore_project_root_vars')
    return t:my_project_root_dir
  endif

  let path = locon#get('get_buffer_path')()
  let root = locon#get('find_project_root')(path)
  return filereadable(path) && strlen(root) ? root : path " path がファイルであり、root が確定できたなら、root を利用する
endfunction

function! MyProjectRootDecide()
  if exists('t:my_project_root_dir')
    unlet t:my_project_root_dir
  endif

  let t:my_project_root_dir = MyProjectRootDetect(locon#get('get_buffer_path')(), {})
  execute printf('tchdir %s', fnameescape(t:my_project_root_dir))
endfunction

" trim right.
function! s:trim_right(str, trim)
  return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction

" get git branch name.
function! GitBranch()
  try
    return gitto#do('repo#head')()
  catch /.*/
  endtry
  return 'no-git'
endfunction

function! LscStatus()
  let servers = lsc#server#current()
  if len(servers)
    return join(map(servers, { k, v -> printf('LSC:%s', v.status) }), '|')
  endif
  return 'no-lsc'
endfunction

function! CWD()
  if exists('t:my_project_root_dir')
    return fnamemodify(t:my_project_root_dir, ':~')
  endif
  return 'no-cwd'
endfunction

" ########################################################################################################################
" Plugin Setting.
" ########################################################################################################################
" --------------------
"  dein
" --------------------
if dein#tap('dein.vim')
  let g:dein#install_log_filename = '~/dein.log'
endif

" --------------------
"  locon
" --------------------
if dein#tap('vim-themis')
  if has('vim_starting')
    let $PATH = $PATH . ':' . dein#get('vim-themis').rtp . '/bin'
    let $THEMIS_VIM = 'nvim'
  endif
endif

" --------------------
"  locon
" --------------------
if dein#tap('vim-locon')
  function! s:find_project_root(path)
    let path = fnamemodify(a:path, ':p')
    while path !=# ''
      for marker in ['.git', 'tsconfig.json', 'package.json']
        let candidate = resolve(path . '/' . marker)
        if filereadable(candidate) || isdirectory(candidate)
          return path
        endif
      endfor
      let path = substitute(path, '/[^/]*$', '', 'g')
    endwhile
    return ''
  endfunction
  call locon#def('find_project_root', funcref('s:find_project_root'))

  function! s:get_buffer_path()
    if exists('b:denite_context')
      return fnamemodify(bufname(winbufnr(b:denite_context.prev_winid)), ':p')
    endif
    if exists('b:defx')
      return b:defx.paths[0]
    endif
    if exists('t:deol') && &filetype ==# 'deol'
      return t:deol.cwd
    endif
    if exists('t:my_project_root_dir')
      return t:my_project_root_dir
    endif
    return expand('%:p')
  endfunction
  call locon#def('get_buffer_path', funcref('s:get_buffer_path'))

  call locon#def('effort_gf_converters', {})
  call locon#def('ignore_globs', ['.git/', '.svn/', 'img/', 'image/', 'images/', '*.gif', '*.jpg', '*.jpeg', '*.png', '*.svg', 'vendor/', 'node_modules/', '*.po', '*.mo', '*.swf', '*.min.*'])
  call locon#def('ignore_greps', ['\.git', '\.svn', 'node_modules\/', 'vendor\/', '\.min\.'])

  if filereadable(expand('$HOME/.vimrc.local'))
    execute printf('source %s', expand('$HOME/.vimrc.local'))
  endif
endif

" --------------------
"  colorscheme
" --------------------
if dein#tap('cosmic_latte')
  colorscheme cosmic_latte
else
  colorscheme ron
endif

" --------------------
" effort_gf
" --------------------
let g:effort_gf#config = {}
let g:effort_gf#config.converters = locon#get('effort_gf_converters')

" --------------------
"  vim-gitgutter
" --------------------
if dein#tap('vim-gitgutter')
  let g:gitgutter_override_sign_column_highlight = 0
  let g:gitgutter_map_keys = 0
  let g:gitgutter_diff_args = '-w'
  let g:gitgutter_sign_added = "\uf055"
  let g:gitgutter_sign_modified = "\uf459"
  let g:gitgutter_sign_removed = "\uf458"
  let g:gitgutter_sign_removed_first_line = "\uf458"
  let g:gitgutter_sign_modified_removed = "\uf459"
endif

" --------------------
" vim-lsc
" --------------------
if dein#tap('vim-lsc')
  let g:typescript_language_server = {
        \   'command': 'typescript-language-server --stdio',
        \   'suppress_stderr': v:true,
        \   'message_hooks': {
        \     'initialize': {
        \       'rootUri': { method, params -> lsc#uri#documentUri(locon#get('find_project_root')(locon#get('get_buffer_path')())) }
        \     },
        \   }
        \ }
  let g:css_languageserver = {
        \   'command': 'css-languageserver --stdio',
        \   'suppress_stderr': v:true,
        \   'message_hooks': {
        \     'initialize': {
        \       'rootUri': { method, params -> lsc#uri#documentUri(locon#get('find_project_root')(locon#get('get_buffer_path')())) }
        \     },
        \   },
        \ }
  let g:intelephense = {
        \   'command': 'intelephense --stdio',
        \   'suppress_stderr': v:true,
        \   'message_hooks': {
        \     'initialize': {
        \       'initializationOptions': {
        \         'storagePath': expand('~/.cache/intelephense')
        \       },
        \       'rootUri': { method, params -> lsc#uri#documentUri(locon#get('find_project_root')(locon#get('get_buffer_path')())) }
        \     }
        \   }
        \ }
  let g:lsc_server_commands = {
        \   'typescript': g:typescript_language_server,
        \   'typescript.tsx': g:typescript_language_server,
        \   'typescript.jsx': g:typescript_language_server,
        \   'javascript': g:typescript_language_server,
        \   'javascript.tsx': g:typescript_language_server,
        \   'javascript.jsx': g:typescript_language_server,
        \   'php': g:intelephense,
        \   'css': g:css_languageserver
        \ }
  let g:lsc_auto_map = {
        \   'defaults': v:false,
        \   'GoToDefinition': 'gf<CR>',
        \   'GoToDefinitionSplit': ['gfs', 'gfv :vertical'],
        \   'FindReferences': '<Leader>g',
        \   'FindCodeActions': '<Leader><CR>',
        \   'Rename': '<Leader>r',
        \   'ShowHover': '<Leader>i',
        \   'SignatureHelp': '<Leader>o',
        \ }
  let g:lsc_enable_autocomplete = v:false
  let g:lsc_enable_snippet_support = v:true
endif

" --------------------
"  auto-pairs
" --------------------
if dein#tap('ale')
  let g:ale_linters = {}
  if exists('g:lsc_server_commands')
    for s:ft in keys(g:lsc_server_commands)
      let g:ale_linters[s:ft] = []
    endfor
  endif
endif

" --------------------
" vim-gitto
" --------------------
if dein#tap('vim-gitto')
  let g:gitto#config = {}
  let g:gitto#config.get_buffer_path = locon#get('get_buffer_path')
endif

" --------------------
" echodoc.vim.
" --------------------
if dein#tap('echodoc.vim')
  let g:echodoc#enable_at_startup = 1
  let g:echodoc#type = 'echo'
endif

" --------------------
" deoplete.nvim.
" --------------------
if dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#source('lsc', 'rank', 2000)
  call deoplete#custom#source('file', 'enable_buffer_path', v:true)
  call deoplete#custom#source('_', 'min_pattern_length', 1)
  call deoplete#custom#source('_', 'converters', [
        \ 'remove_overlap',
        \ 'converter_truncate_menu',
        \ 'converter_truncate_abbr',
        \ 'converter_remove_paren'])
endif

" --------------------
" neomru.vim.
" --------------------
if dein#tap('neomru.vim')
  let g:neomru#directory_mru_limit = 50
  let g:neomru#file_mru_limit = 50
endif

" --------------------
" deol.nvim.
" --------------------
if dein#tap('deol.nvim')
  let g:deol#prompt_pattern = '.\{-}\$'
  let g:deol#enable_dir_changed = 0

  autocmd! vimrc FileType deol call s:deol_setting()
  function! s:deol_setting()
    setlocal nobuflisted
    nnoremap <buffer><F10> :<C-u>tabnew \| call deol#start(printf('-cwd=%s', locon#get('get_buffer_path')()))<CR>
  endfunction
endif

if dein#tap('defx.nvim')
  if dein#tap('defx-icons')
    let g:defx_icons_enable_syntax_highlight = 1
    let g:defx_icons_column_length = 2
  endif

  call defx#custom#option('_', {
        \   'columns': 'mark:icons:filename:type',
        \ })

  autocmd vimrc FileType defx call s:defx_setting()
  function! s:defx_setting() abort
    setlocal nonumber
    setlocal winfixwidth

    " open
    nnoremap <silent><buffer><expr><Tab>     defx#do_action('call', 'DefxSuitableMove')
    nnoremap <silent><buffer><expr><CR>      defx#do_action('open', 'DefxEdit')
    nnoremap <silent><buffer><expr>v         defx#do_action('open', 'DefxVsplit')
    nnoremap <silent><buffer><expr>s         defx#do_action('open', 'DefxSplit')
    nnoremap <silent><buffer><expr>x         defx#do_action('execute_system')

    " move.
    nnoremap <silent><buffer><expr>h         defx#is_opened_tree() ? defx#do_action('close_tree') : defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr>j         'j'
    nnoremap <silent><buffer><expr>k         'k'
    nnoremap <silent><buffer><expr>l         defx#is_directory() ? defx#do_action('open_tree') . 'j' : defx#do_action('open', 'DefxEdit')
    nnoremap <silent><buffer><expr>~         defx#do_action('cd')
    nnoremap <silent><buffer><expr>\         defx#do_action('cd', ['/'])

    " manimpulates.
    nnoremap <silent><buffer><expr>K         defx#do_action('new_directory')
    nnoremap <silent><buffer><expr>N         defx#do_action('new_file')
    nnoremap <silent><buffer><expr><Leader>N defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr>c         defx#do_action('copy')
    nnoremap <silent><buffer><expr>m         defx#do_action('move')
    nnoremap <silent><buffer><expr>D         defx#do_action('remove')
    nnoremap <silent><buffer><expr>r         defx#do_action('rename')
    nnoremap <silent><buffer><expr>p         defx#do_action('paste')

    nnoremap <silent><buffer><expr>@         defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><BS>            :<C-u>Denite -default-action=change_cwd dirmark directory_mru<CR>
    nnoremap <silent><buffer><expr><F5>      MyProjectRootDecide()
    nnoremap <silent><buffer><expr>.         defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr>@         defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr><C-l>     defx#do_action('redraw')
    nnoremap <silent><buffer><Leader><CR>    :<C-u>new \| Defx -auto-cd -new `expand('%:p:h')`<CR>

    if dein#tap('deol.nvim')
      nnoremap <buffer>H :<C-u>call MyPopupDeol(b:defx.paths[0])<CR>
    endif
  endfunction

  if dein#tap('denite.nvim')
    function! s:action(context)
      if exists('a:context["targets"][0]["action__path"]')
        call defx#call_action('cd', a:context['targets'][0]['action__path'])
        return
      endif

      if exists('a:context["targets"][0]["word"]')
        call defx#call_action('cd', a:context['targets'][0]['word'])
        return
      endif
    endfunction
    call denite#custom#action('dirmark,command,directory', 'change_cwd', function('s:action'))
  endif

  command! -nargs=* -range DefxEdit call DefxOpen('edit', <q-args>)
  command! -nargs=* -range DefxVsplit call DefxOpen('vsplit', <q-args>)
  command! -nargs=* -range DefxSplit call DefxOpen('split', <q-args>)
  function! DefxOpen(cmd, path)
    let s:winnrs = filter(
          \ range(1, tabpagewinnr(tabpagenr(), '$')),
          \ { i, wnr -> index(['deol', 'defx', 'denite'], getbufvar(winbufnr(wnr), '&filetype')) == -1 })

    if len(s:winnrs) > 0
      execute printf('%swincmd w', s:winnrs[0])
      execute printf('%s %s', a:cmd, a:path)
      return
    endif
    execute printf('edit %s', a:path)
  endfunction

  function! DefxSuitableMove(context)
    let current = s:trim_right(b:defx.paths[0], '/')
    let workspace = s:trim_right(MyProjectRootDetect(current, {}), '/')
    let vcs_root = s:trim_right(locon#get('find_project_root')(current), '/')

    if current == workspace
      call defx#call_action('cd', [vcs_root])
      return
    endif
    call defx#call_action('cd', [workspace])
  endfunction

  function! MyPopupDeol(cwd)
    if !exists('t:deol') || bufwinnr(get(t:deol, 'bufnr', -1)) == -1
      topleft 15split
      setlocal winfixheight
      call deol#start(printf('-cwd=%s', a:cwd))
    else
      let t:deol['cwd'] = ''
      call deol#start(printf('-cwd=%s', a:cwd))
    endif
  endfunction
endif

" --------------------
" lightline.
" --------------------
if dein#tap('lightline.vim')
  let g:lightline = {}
  let g:lightline.enable = {}
  let g:lightline.enable.statusline = 1
  let g:lightline.enable.tabline = 1
  let g:lightline.colorscheme = 'cosmic_latte_dark'
  let g:lightline.active = {}
  let g:lightline.active.left = [['readonly', 'filename', 'modified']]
  let g:lightline.active.right = [['lineinfo'], ['percent'], ['filetype'], ['lsc']]
  let g:lightline.tabline = {}
  let g:lightline.tabline.left = [['tabs']]
  let g:lightline.tabline.right = [['cwd', 'branch', 'close']]
  let g:lightline.component_function = {}
  let g:lightline.component_function.branch = 'GitBranch'
  let g:lightline.component_function.lsc = 'LscStatus'
  let g:lightline.component_function.cwd = 'CWD'
  let g:lightline.separator = { 'left': '', 'right': '' }
  let g:lightline.subseparator = { 'left': '', 'right': '' }
  let g:lightline.tabline_separator = { 'left': '', 'right': '' }
  let g:lightline.tabline_subseparator = { 'left': '|', 'right': '|' }
endif

" --------------------
" denite.nvim.
" --------------------
if dein#tap('denite.nvim')
  " common.
  call denite#custom#map('normal', '<Esc>', '<denite:quit>')
  call denite#custom#map('normal', '<Tab>', '<denite:choose_action>')
  call denite#custom#map('normal', '<Space>h', '<denite:wincmd:h>')
  call denite#custom#map('normal', '<Space>j', '<denite:wincmd:j>')
  call denite#custom#map('normal', '<Space>k', '<denite:wincmd:p>')
  call denite#custom#map('normal', '<Space>l', '<denite:wincmd:l>')
  call denite#custom#map('normal', '<C-l>', '<denite:redraw>')
  call denite#custom#map('normal', '<C-h>', '<denite:restore_sources>')
  call denite#custom#map('normal', 'q', '<denite:quit>')
  call denite#custom#map('normal', 'i', '<denite:enter_mode:insert>')
  call denite#custom#map('normal', 'a', '<denite:enter_mode:insert>')
  call denite#custom#map('normal', 'v', '<denite:do_action:vsplitswitch>')
  call denite#custom#map('normal', 's', '<denite:do_action:splitswitch>')
  call denite#custom#map('normal', 'h', '<prompt:move_caret_to_left>')
  call denite#custom#map('normal', 'l', '<prompt:move_caret_to_right>')
  call denite#custom#map('normal', '0', '<prompt:move_caret_to_head>')
  call denite#custom#map('normal', '$', '<prompt:move_caret_to_tail>')
  call denite#custom#map('normal', '@', '<denite:toggle_select_down>')
  call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>')
  call denite#custom#map('insert', '<Tab>', '<denite:choose_action>')

  " file/rec custom
  if executable('ag')
    call denite#custom#var('file/rec', 'command', [
          \   'ag',
          \   '--follow',
          \ ] + map(deepcopy(locon#get('ignore_globs')), { k, v -> '--ignore=' . v }) + [
          \   '--nocolor',
          \   '--nogroup',
          \   '-g',
          \   ''
          \ ])
  endif
  call denite#custom#source('file/rec', 'sorters', ['sorter/word'])

  " grep custom
  if executable('jvgrep')
    call denite#custom#var('grep', 'command', ['jvgrep'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--exclude', join(locon#get('ignore_greps'), '|')])
    call denite#custom#var('grep', 'recursive_opts', ['-R'])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', [])
    call denite#custom#var('grep', 'final_opts', [])
  endif
  call denite#custom#source('grep', 'converters', ['converter/abbr_word'])

  call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', locon#get('ignore_globs'))
  call denite#custom#option('grep', 'quit', v:false)
  call denite#custom#option('_', 'winheight', 12)
  call denite#custom#option('_', 'winminheight', 6)
  call denite#custom#option('_', 'vertical_preview', v:true)
  call denite#custom#option('_', 'mode', 'normal')
  call denite#custom#option('_', 'updatetime', 500)
  call denite#custom#option('_', 'skiptime', 500)
  call denite#custom#option('_', 'auto_resize', v:true)
  call denite#custom#option('_', 'unique', v:true)
  call denite#custom#source('_', 'matchers', ['matcher/regexp'])

  " menu.
  let s:menus = {}
  let s:menus.string = {'description': 'string utilities.'}
  let s:menus.string.command_candidates = [
        \ ['format: reverse lines', 'g/^/m0'],
        \ ['format: remove ^M', '%s///g'],
        \ ['format: querystring', 'silent! %s/&amp;/\&/g | silent! %s/&/\r&/g | silent! %s/=/\r=/g'],
        \ ['format: to smb', 'silent! %s/\\/\//g | silent! %s/^\(smb:\/\/\|\/\/\)\?/smb:\/\//g']
        \ ]
  let s:menus.vim = {'description': 'vim runtime.'}
  let s:menus.vim.command_candidates = [
        \ ['upgrade: dein:deps', 'call dein#update()']
        \ ]
  call denite#custom#var('menu', 'menus', s:menus)

  " gitto/status delete action
  if dein#tap('vim-denite-gitto')
    call denite#custom#action(
          \ 'gitto/status',
          \ 'delete_',
          \ { context -> map(context['targets'], { k, v -> delete(v['action__path'], 'rf') }) },
          \ { 'is_quit': v:false, 'is_redraw': v:true })
  endif

  " qfreplace custom
  if dein#tap('vim-qfreplace')
    function! s:denite_replace_action(context)
      let qflist = a:context['targets']
      let qflist = filter(qflist, { k, v -> has_key(v, 'action__path') })
      let qflist = filter(qflist, { k, v -> has_key(v, 'action__line') })
      let qflist = filter(qflist, { k, v -> has_key(v, 'action__text') })
      let qflist = map(qflist, { k, v -> {
            \   'filename': v.action__path,
            \   'lnum': v.action__line,
            \   'text': v.action__text,
            \ } })
      call setqflist(qflist)
      call qfreplace#start('')
    endfunction
    call denite#custom#action('file', 'qfreplace', function('s:denite_replace_action'))
  endif
endif

" ########################################################################################################################
" AutoCmd Setting.
" ########################################################################################################################
autocmd! vimrc FileType * call s:file_type()
function! s:file_type()
  let s:current_winnr = tabpagewinnr(tabpagenr())
  try
    for s:ft in ['defx', 'deol', 'denite']
      let s:winnrs = range(1, tabpagewinnr(tabpagenr(), '$'))
      if len(s:winnrs) > 1
        for s:winnr in s:winnrs
          if s:ft ==# 'defx' && s:ft == getbufvar(winbufnr(s:winnr), '&filetype')
            execute printf('silent noautocmd %swincmd w', s:winnr)
            execute printf('silent noautocmd vertical resize %s', 35)
            break
          endif
          if s:ft ==# 'deol' && s:ft == getbufvar(winbufnr(s:winnr), '&filetype')
            execute printf('silent noautocmd %swincmd w', s:winnr)
            execute printf('silent noautocmd wincmd K | silent noautocmd resize %s', 12)
            break
          endif
          if s:ft ==# 'denite' && s:ft == getbufvar(winbufnr(s:winnr), '&filetype')
            execute printf('silent noautocmd %swincmd w', s:winnr)
            execute printf('silent noautocmd wincmd J | silent noautocmd resize %s', 12)
            break
          endif
        endfor
      endif
    endfor
    silent noautocmd execute printf('%swincmd w', s:current_winnr)
  catch
  endtry

  " fix indent.
  if filereadable(expand('%')) && exists(':Findent') && &buftype ==# ''
    Findent --no-messages --no-warnings --chunksize=100
  endif
endfunction

" ColorScheme
autocmd! vimrc ColorScheme * call s:color_scheme()
function! s:color_scheme()
  highlight! link VertSplit StatusLineNC
  highlight! link SignColumn StatusLineNC
  highlight! link LineNr StatusLineNC
endfunction
doautocmd ColorScheme

" BufRead
autocmd! vimrc BufRead * call s:buf_read()
function! s:buf_read()
  if line("'\"") > 0 && line("'\"") <= line('$')
    normal! g`""
  endif
endfunction

" TermOpen.
autocmd! vimrc TermOpen term://* call s:term_open()
function! s:term_open()
  tnoremap <buffer><silent><Esc> <C-\><C-n>
endfunction

" WinEnter"
autocmd! vimrc WinEnter * call s:win_enter()
function! s:win_enter()
  if &previewwindow
    setlocal wrap
  endif
endfunction

" CmdwinEnter.
autocmd! vimrc CmdwinEnter * call s:cmdwin_enter()
function! s:cmdwin_enter()
  nnoremap <buffer><silent><Esc> :<C-u>q<CR>
  nnoremap <buffer>a             A
  nnoremap <buffer><silent>dd    :<C-u>call histdel(getcmdwintype(), line('.') - line('$'))<CR>dd
  startinsert!
endfunction

