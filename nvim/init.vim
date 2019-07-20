if has('vim_starting')
  set encoding=utf-8
endif
scriptencoding utf-8

let $MYVIMRC = resolve(expand('~/.config/nvim/init.vim'))

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
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('cohama/lexima.vim')
  call dein#add('hrsh7th/denite-converter-prioritize-basename')
  call dein#add('hrsh7th/deoplete-fname')
  call dein#add('hrsh7th/vim-denite-gitto')
  call dein#add('hrsh7th/vim-gitto')
  call dein#add('hrsh7th/vim-locon')
  call dein#add('hrsh7th/vim-neco-calc')
  call dein#add('itchyny/lightline.vim')
  call dein#add('kmnk/denite-dirmark')
  call dein#add('kristijanhusak/defx-icons')
  call dein#add('lambdalisue/suda.vim')
  call dein#add('lambdalisue/vim-findent')
  call dein#add('machakann/vim-sandwich')
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('rhysd/git-messenger.vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('t9md/vim-choosewin')
  call dein#add('t9md/vim-quickhl')
  call dein#add('thinca/vim-prettyprint')
  call dein#add('thinca/vim-qfreplace')
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-themis')
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

set termguicolors
set updatetime=500
set autoread
set hidden
set nobackup
set noswapfile
set virtualedit=all
set scrolloff=3
set sidescrolloff=3
set scrollback=2000
set complete=w
set completeopt=menu
set belloff=all
set clipboard=unnamed,unnamedplus
set isfname-==
set isfname+=\\
set diffopt=filler,iwhite,algorithm:histogram,indent-heuristic
set wildchar=<Tab>
set splitright
set splitbelow
set synmaxcol=512
set lazyredraw
set mouse=n
set undodir=~/.vimundo
set undofile
set shell=bash

set nowrap
set number
set cursorline
set modeline
set modelines=2
set wildoptions=pum
set wildmenu
set wildmode=longest:full
set showtabline=2
set cmdheight=2
set laststatus=2
set list
set pumheight=50
set noshowmode
set ambiwidth=double
set title
set shortmess+=I
set listchars=tab:>-,trail:^
set fillchars+=vert:\ ,eob:\ 

set incsearch
set hlsearch
set ignorecase
set smartcase
set suffixesadd=.php,.tpl,.ts,.tsx,.css,.scss,.rb,.java,.json,.md,.as,.js,.jpg,.jpeg,.gif,.png,.vim
set matchpairs=(:),[:],{:}
set inccommand=split

set autoindent
set cindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0
set backspace=2
set regexpengine=1
set whichwrap=b,s,h,l,<,>,[,]

let mapleader="\<Space>"
nnoremap q :<C-u>q<CR>
nnoremap Q :<C-u>qa!<CR>
nnoremap <Leader>t :<C-u>tabclose<CR>
nnoremap <Leader>w :<C-u>w<CR>
nmap ; :
vmap ; :
xmap ; :
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
nnoremap <expr><silent><Leader><Esc> printf(":\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>:\<C-u>%s\<CR>",
      \ dein#tap('vim-quickhl') ? 'QuickhlManualReset' : 'nohlsearch',
      \ dein#tap('vim-quickhl') ? 'QuickhlCwordDisable' : 'nohlsearch',
      \ 'nohlsearch',
      \ 'redraw!')

nnoremap H 20h
nnoremap J 10j
nnoremap K 10k
nnoremap L 20l
vnoremap H 20h
vnoremap J 10j
vnoremap K 10k
vnoremap L 20l

nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <Leader>L :<C-u>tabnext<CR>
nnoremap <Leader>H :<C-u>tabprev<CR>

nnoremap <C-h> <C-o>
nnoremap <C-l> <C-i>

inoremap <C-l> <C-o>l
inoremap <C-h> <C-o>h

nmap <Tab> %
vmap <Tab> %

inoremap <expr>] pumvisible() ? "\<C-n>" : "]"
inoremap <expr>} pumvisible() ? "\<C-p>" : "}"
nnoremap <expr>i len(getline('.')) == 0 ? "cc" : "i"

nnoremap <Leader>*  *:<C-u>%s/<C-r>///g<C-f><Left><Left>
vnoremap <Leader>*  y:<C-u>%s/<C-r>"//g<C-f><Left><Left>
vnoremap <expr><CR> printf(':s/%s//g<C-f><Left><Left>', expand('<cword>'))

nnoremap riw ciw<C-r>0<Esc>:<C-u>let@/=@1<CR>:noh<CR>

nnoremap gj gJ

nnoremap <expr><F5> MyProjectRootDecide()

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
      Defx -split=vertical -direction=topleft -winwidth=35 -session-file=`expand('~/.defx_session')` `expand('%:p:h')`
    endif
  endfunction
endif

if dein#tap('denite.nvim') && dein#tap('vim-gitto') && dein#tap('vim-denite-gitto')
  nnoremap <Leader><BS> :<C-u>DeniteGitto gitto<CR>
endif

if dein#tap('vim-quickhl')
  nmap @ <Plug>(quickhl-manual-this)
  vmap @ <Plug>(quickhl-manual-this)
endif

if dein#tap('open-browser.vim')
  nmap <Leader><Leader><CR> <Plug>(openbrowser-smart-search)
endif

if dein#tap('denite.nvim')
  nnoremap <BS> :<C-u>Denite file_mru<CR>
  nnoremap <expr><F3> printf(':<C-u>Denite file/rec:%s<CR>', MyProjectRootDetect(locon#get('get_buffer_path'), {}))
  nnoremap <expr>gr printf(':<C-u>Denite -no-empty grep:%s<CR>', fnameescape(MyProjectRootDetect(locon#get('get_buffer_path'), {})))
  nnoremap <Leader>0 :<C-u>Denite menu<CR>
  vnoremap <Leader>0 :<C-u>Denite menu<CR>
  nnoremap <Leader>m :<C-u>Denite -resume<CR>
  nnoremap <Leader>n :<C-u>Denite -resume -immediately -cursor-pos=+1 -no-empty<CR>
  nnoremap <Leader>p :<C-u>Denite -resume -immediately -cursor-pos=-1 -no-empty<CR>
endif

if dein#tap('git-messenger.vim')
  nmap gi <Plug>(git-messenger)
endif

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

  execute printf('tcd %s', t:my_project_root_dir)

  if exists('b:defx')
    call defx#call_action('add_session', [b:defx.paths[0]])
  endif

  if dein#tap('neomru.vim')
    call neomru#append(t:my_project_root_dir)
    NeoMRUReload
  endif
endfunction

function! s:trim_right(str, trim)
  return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction

function! GitBranch()
  try
    return gitto#run('repo#head')
  catch /.*/
  endtry
  return 'no git'
endfunction

function! CWD()
  if exists('t:my_project_root_dir')
    return fnamemodify(t:my_project_root_dir, ':~')
  endif
  return 'no cwd'
endfunction

function! LSP()
  if dein#tap('vim-lsp')
    try
      return stridx(lsp#get_server_status(), ': running') >= 0 ? 'running' : 'no lsp'
    catch /.*/
    endtry
  endif
  return 'no lsp'
endfunction

if dein#tap('dein.vim')
  let g:dein#install_log_filename = '~/dein.log'
endif

if dein#tap('lexima.vim')
  let g:lexima_nvim_accept_pum_with_enter = 0

  call lexima#add_rule({ 'char': '<', 'input_after': '>' })
  call lexima#add_rule({ 'char': '>', 'at': '<\%#>', 'leave': 1 })
  call lexima#add_rule({ 'char': '<BS>', 'at': '<\%#>', 'delete': 1 })
  call lexima#add_rule({ 'char': '<BS>', 'at': '< \%# >', 'delete': 1 })
  call lexima#add_rule({ 'char': '<Space>', 'at': '<\%#>', 'input_after': '<Space>' })

  call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*)',   'input': '<Left><C-o>f)<Right>' })
  call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*\}',  'input': '<Left><C-o>f}<Right>' })
  call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*\]',  'input': '<Left><C-o>f]<Right>' })
  call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*>',   'input': '<Left><C-o>f><Right>' })
  call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*`',   'input': '<Left><C-o>f`<Right>' })
  call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*"',   'input': '<Left><C-o>f"<Right>' })
  call lexima#add_rule({ 'char': '<Tab>', 'at': "\\%#\\s*'", 'input': "\<Left>\<C-o>f'\<Right>" })
endif

if dein#tap('git-messenger.vim')
  let g:git_messenger_include_diff = v:true
  let g:git_messenger_always_into_popup = v:true
endif

if dein#tap('vim-devicons')
  let g:webdevicons_enable_denite = v:false
endif

if dein#tap('vim-themis')
  if has('vim_starting')
    let $PATH = $PATH . ':' . dein#get('vim-themis').rtp . '/bin'
    let $THEMIS_VIM = 'nvim'
  endif
endif

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
    if exists('b:defx')
      return b:defx.paths[0]
    endif
    if exists('t:deol') && &filetype ==# 'deol'
      return t:deol.cwd
    endif
    return expand('%:p')
  endfunction
  call locon#def('get_buffer_path', funcref('s:get_buffer_path'))

  call locon#def('ignore_globs', ['.git/', '.svn/', 'img/', 'image/', 'images/', '*.gif', '*.jpg', '*.jpeg', '*.png', 'vendor/', 'node_modules/', '*.po', '*.mo', '*.swf', '*.min.*'])
  call locon#def('ignore_greps', ['\.git', '\.svn', 'node_modules\/', 'vendor\/', '\.min\.'])

  if filereadable(expand('$HOME/.vimrc.local'))
    execute printf('source %s', expand('$HOME/.vimrc.local'))
  endif
endif

if dein#tap('nord-vim')
  colorscheme nord
else
  colorscheme ron
endif

let g:lsp_server_definitions = []
if dein#tap('vim-lsp')
  let g:lsp_signs_error = { 'text' : "\uf071" }
  let g:lsp_signs_warning = { 'text' : "\uf071" }
  let g:lsp_signs_information = { 'text' : "\uf449" }
  let g:lsp_signs_hint = { 'text' : "\uf400" }
  let g:lsp_diagnostics_echo_cursor = v:true

  let g:lsp_server_definitions += [{
        \   'executable': 'typescript-language-server',
        \   'cmd': { server_info -> [&shell, &shellcmdflag, 'typescript-language-server --stdio'] },
        \   'whitelist': ['typescript', 'typescript.tsx', 'javascript', 'javascipt.jsx']
        \ }]
  let g:lsp_server_definitions += [{
        \   'executable': 'diagnostic-languageserver',
        \   'cmd': { server_info -> [&shell, &shellcmdflag, 'diagnostic-languageserver --stdio'] },
        \   'whitelist': ['typescript', 'typescript.tsx', 'javascript', 'javascipt.jsx'],
        \   'initialization_options': {
        \     'linters': {
        \       'eslint': {
        \         'sourceName': 'eslint',
        \         'command': 'eslint_d',
        \         'args': ['--stdin', '--stdin-filename=*.tsx', '--no-color'],
        \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
        \         'formatLines': 1,
        \         'formatPattern': [
        \           '^\s*(\d+):(\d+)\s+([^ ]+)\s+(.*?)\s+([^ ]+)$',
        \           {
        \             'line': 1,
        \             'column': 2,
        \             'message': [4, ' [', 5, ']' ],
        \             'security': 3
        \           }
        \         ]
        \       },
        \     },
        \     'filetypes': {
        \       'javascript': 'eslint',
        \       'javascript.jsx': 'eslint',
        \       'typescript': 'eslint',
        \       'typescript.tsx': 'eslint'
        \     },
        \     'formatters': {
        \       'eslint': {
        \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
        \         'command': 'eslint_d',
        \         'args': ['--fix', '--fix-to-stdout', '--stdin', '--stdin-filename=*.tsx'],
        \         'isStdout': v:true,
        \         'isStderr': v:true,
        \       }
        \     },
        \     'formatFiletypes': {
        \       'javascript': 'eslint',
        \       'javascript.jsx': 'eslint',
        \       'typescript': 'eslint',
        \       'typescript.tsx': 'eslint'
        \     }
        \   }
        \ }]
  let g:lsp_server_definitions += [{
        \   'executable': 'intelephense',
        \   'cmd': { server_info -> [&shell, &shellcmdflag, 'intelephense --stdio'] },
        \   'whitelist': ['php']
        \ }]
  let g:lsp_server_definitions += [{
        \   'executable': 'rls',
        \   'cmd': { server_info -> [&shell, &shellcmdflag, 'rustup run stable rls'] },
        \   'whitelist': ['rust']
        \ }]

  highlight! link LspErrorText ErrorMsg
  highlight! link LspWarningText WarningMsg
  highlight! link LspHintText NormalFloat
  highlight! link LspInformationText Folded

  autocmd! vimrc User lsp_setup call s:setup_lsp()
  function! s:setup_lsp()
    let priority = 0 " Specifying to use server for `LspDocumentFormat`.
    for server in g:lsp_server_definitions
      if executable(server.executable)
        call lsp#register_server({
              \ 'name': priority . '_' . server.executable,
              \ 'cmd': server.cmd,
              \ 'whitelist': server.whitelist,
              \ 'root_uri': { server_info -> lsp#utils#path_to_uri(locon#get('find_project_root')(locon#get('get_buffer_path')())) },
              \ 'initialization_options': get(server, 'initialization_options', {})
              \ })
        let priority = priority + 1
      endif
    endfor
  endfunction
endif

if dein#tap('ale')
  let g:ale_disable_linters = ['css']
  for server in g:lsp_server_definitions
    let g:ale_disable_linters += server.whitelist
  endfor

  let g:ale_linters = {}
  for s:ft in g:ale_disable_linters
    let g:ale_linters[s:ft] = []
  endfor
endif

if dein#tap('vim-gitto')
  let g:gitto#config = {}
  let g:gitto#config.get_buffer_path = locon#get('get_buffer_path')
endif

if dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#source('file', 'enable_buffer_path', v:true)
  call deoplete#custom#source('_', 'min_pattern_length', 1)
endif

if dein#tap('neomru.vim')
  let g:neomru#directory_mru_limit = 50
  let g:neomru#file_mru_limit = 50
endif

if dein#tap('deol.nvim')
  let g:deol#prompt_pattern = '.\{-}\$'
  let g:deol#enable_dir_changed = 0

  autocmd! vimrc FileType deol call s:deol_setting()
  function! s:deol_setting()
    setlocal nobuflisted
    nnoremap <buffer><F10> :<C-u>tabnew \| call deol#start(printf('-cwd=%s', locon#get('get_buffer_path')()))<CR>
  endfunction

  function! DeolPopup(cwd)
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

if dein#tap('defx.nvim')
  call defx#custom#option('_', {
        \   'columns': 'mark:indent:icons:filename:type',
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
    nnoremap <silent><buffer><expr>h         defx#get_candidate()['level'] > 0 ? defx#do_action('close_tree') : (defx#is_opened_tree() ? defx#do_action('close_tree') : defx#do_action('cd', ['..']))
    nnoremap <silent><buffer><expr>j         'j'
    nnoremap <silent><buffer><expr>k         'k'
    nnoremap <silent><buffer><expr>l         defx#is_directory() ? defx#do_action('open_tree') . 'j' : 'l'
    nnoremap <silent><buffer><expr>~         defx#do_action('cd')
    nnoremap <silent><buffer><expr>\         defx#do_action('cd', ['/'])

    " manimpulates.
    nnoremap <silent><buffer><expr>K         defx#do_action('new_directory')
    nnoremap <silent><buffer><expr>N         defx#do_action('new_file')
    nnoremap <silent><buffer><expr>c         defx#do_action('copy')
    nnoremap <silent><buffer><expr>m         defx#do_action('move')
    nnoremap <silent><buffer><expr>D         defx#do_action('remove')
    nnoremap <silent><buffer><expr>r         defx#do_action('rename')
    nnoremap <silent><buffer><expr>p         defx#do_action('paste')

    nnoremap <silent><buffer><expr>@         defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><BS>            :<C-u>Denite -default-action=execute defx/session directory_mru defx/history<CR>
    nnoremap <silent><buffer><expr><F5>      MyProjectRootDecide()
    nnoremap <silent><buffer><expr>.         defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr>@         defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr><C-l>     defx#do_action('redraw')
    nnoremap <silent><buffer><Leader><CR>    :<C-u>new \| Defx -new -session-file=`expand('~/.defx_session')` `expand('%:p:h')`<CR>

    if dein#tap('deol.nvim')
      nnoremap <buffer>H :<C-u>call DeolPopup(b:defx.paths[0])<CR>
    endif
  endfunction

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
endif

if dein#tap('lightline.vim')
  let g:lightline = {}
  let g:lightline.enable = {}
  let g:lightline.enable.statusline = 1
  let g:lightline.enable.tabline = 1
  let g:lightline.colorscheme = 'nord'
  let g:lightline.active = {}
  let g:lightline.active.left = [['readonly', 'filename', 'modified']]
  let g:lightline.active.right = [['lineinfo'], ['percent'], ['filetype'], ['lsp']]
  let g:lightline.tabline = {}
  let g:lightline.tabline.left = [['tabs']]
  let g:lightline.tabline.right = [['cwd', 'branch', 'close']]
  let g:lightline.component_function = {}
  let g:lightline.component_function.branch = 'GitBranch'
  let g:lightline.component_function.cwd = 'CWD'
  let g:lightline.component_function.lsp = 'LSP'
  let g:lightline.separator = { 'left': '', 'right': '' }
  let g:lightline.subseparator = { 'left': '', 'right': '' }
  let g:lightline.tabline_separator = { 'left': '', 'right': '' }
  let g:lightline.tabline_subseparator = { 'left': '|', 'right': '|' }
endif

if dein#tap('denite.nvim')
  autocmd vimrc FileType denite call s:denite_setting()
  function! s:denite_setting() abort
    nnoremap <silent><buffer><expr>i       denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr>a       denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr>q       denite#do_map('quit')
    nnoremap <silent><buffer><expr><Esc>   denite#do_map('quit')
    nnoremap <silent><buffer><expr><Tab>   denite#do_map('choose_action')
    nnoremap <silent><buffer><expr><C-l>   denite#do_map('redraw')
    nnoremap <silent><buffer><expr><C-h>   denite#do_map('restore_sources')
    nnoremap <silent><buffer><expr><CR>    denite#do_map('do_action')
    nnoremap <silent><buffer><expr>v       denite#do_map('do_action', 'vsplitswitch')
    nnoremap <silent><buffer><expr>s       denite#do_map('do_action', 'splitswitch')
    nnoremap <silent><buffer><expr>n       denite#do_map('do_action', 'new')
    nnoremap <silent><buffer><expr>d       denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr>*       denite#do_map('toggle_select_all')
    nnoremap <silent><buffer><expr>@       denite#do_map('toggle_select') . 'j'
  endfunction

  autocmd vimrc FileType denite-filter call s:denite_filter_setting()
  function! s:denite_filter_setting() abort
    nnoremap <silent><buffer><Esc> q
    imap <silent><buffer><Esc> <C-o>0<C-o>D<CR>
  endfunction

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

  " grep custom
  if executable('jvgrep')
    call denite#custom#var('grep', 'command', ['jvgrep'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--exclude', join(locon#get('ignore_greps'), '|')])
    call denite#custom#var('grep', 'recursive_opts', ['-R'])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', [])
    call denite#custom#var('grep', 'final_opts', [])
  endif

  " converters
  call denite#custom#source('grep', 'converters', ['converter/abbr_word'])
  call denite#custom#source('file/rec,file_mru', 'converters', ['converter/prioritize_basename'])

  " sorter
  call denite#custom#source('buffer,file_mru,directory_mru', 'sorters', [])
  call denite#custom#source('_', 'sorters', ['sorter/sublime'])

  " matchers
  call denite#custom#source('buffer,file_mru,directory_mru', 'matchers', ['matcher/ignore_current_buffer', 'matcher/fuzzy'])
  call denite#custom#source('_', 'matchers', ['matcher/fuzzy'])

  " filter
  call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', locon#get('ignore_globs'))

  " option.
  call denite#custom#option('grep', 'quit', v:false)
  call denite#custom#option('_', 'winheight', 8)
  call denite#custom#option('_', 'vertical_preview', v:true)
  call denite#custom#option('_', 'updatetime', 500)
  call denite#custom#option('_', 'skiptime', 500)
  call denite#custom#option('_', 'unique', v:true)

  " menu.
  let s:menus = {}
  let s:menus.string = {'description': 'string utilities.'}
  let s:menus.string.command_candidates = [
        \ ['format: remove empty line', "'<,'>g/^$/d"],
        \ ['format: remove trailling space', "'<,'>s/\\s*$//g"],
        \ ['format: remove ^M', '%s///g'],
        \ ['format: querystring', 'silent! %s/&amp;/\&/g | silent! %s/&/\r&/g | silent! %s/=/\r=/g'],
        \ ['format: to smb', 'silent! %s/\\/\//g | silent! %s/^\(smb:\/\/\|\/\/\)\?/smb:\/\//g']
        \ ]
  let s:menus.vim = {'description': 'vim runtime.'}
  let s:menus.vim.command_candidates = [
        \ ['upgrade: dein:deps', 'call dein#update()']
        \ ]
  call denite#custom#var('menu', 'menus', s:menus)

  " execute custom action.
  function! s:denite_execute_action(context)
    call defx#call_action('cd', [a:context['targets'][0]['action__path']])
  endfunction
  call denite#custom#action('directory', 'execute', function('s:denite_execute_action'))

  " gitto/status delete action
  if dein#tap('vim-denite-gitto')
    function! s:denite_delete_action(context)
      if index(['y', 'ye', 'yes'], input('delete?(yes/no): ')) >= 0
        for target in a:context['targets']
          delete(target['action__path'], 'rf')
        endfor
      endif
    endfunction
    call denite#custom#action('gitto/status', 'delete', function('s:denite_delete_action'), { 'is_quit': v:false, 'is_redraw': v:true })
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

autocmd! vimrc FileType * call s:file_type()
function! s:file_type()
  if dein#tap('vim-findent')
    if filereadable(expand('%')) && &buftype ==# ''
      Findent --no-messages --no-warnings --chunksize=100
    endif
  endif

  if dein#tap('vim-lsp')
    for server in g:lsp_server_definitions
      if executable(server.executable)
        nnoremap <Leader><CR> :<C-u>LspCodeAction<CR>
        nnoremap <Leader>i    :<C-u>LspHover<CR>
        nnoremap <Leader>r    :<C-u>LspRename<CR>
        nnoremap <Leader>g    :<C-u>LspReferences<CR>
        nnoremap <Leader>f    :<C-u>LspDocumentFormatSync<CR>
        nnoremap gf<CR>       :<C-u>LspDefinition<CR>
        nnoremap gfv          :<C-u>vsplit \| LspDefinition<CR>
        nnoremap gfs          :<C-u>split  \| LspDefinition<CR>
      endif
    endfor
  endif
endfunction

autocmd! vimrc ColorScheme * call s:color_scheme()
function! s:color_scheme()
  highlight! link VertSplit StatusLineNC
  highlight! link SignColumn StatusLineNC
  highlight! link LineNr StatusLineNC
endfunction
doautocmd ColorScheme

autocmd! vimrc BufRead * call s:buf_read()
function! s:buf_read()
  if line("'\"") > 0 && line("'\"") <= line('$')
    normal! g`""
  endif
endfunction

autocmd! vimrc TermOpen term://* call s:term_open()
function! s:term_open()
  tnoremap <buffer><silent><Esc> <C-\><C-n>
endfunction

autocmd! vimrc WinEnter * call s:win_enter()
function! s:win_enter()
  if &previewwindow
    setlocal wrap
  endif
endfunction

