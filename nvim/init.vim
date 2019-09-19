if has('vim_starting')
  set encoding=utf-8
endif
scriptencoding utf-8

if &compatible
  set nocompatible
endif

let $MYVIMRC = resolve(expand('~/.config/nvim/init.vim'))

let g:loaded_2html_plugin      = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_logipat           = 1
let g:loaded_logiPat           = 1
let g:loaded_matchparen        = 1
let g:loaded_netrw             = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_rrhelper          = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_sql_completion    = 1
let g:loaded_syntax_completion = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:vimsyn_embed             = 1

let s:dein = {}
let s:dein.dir = {}
let s:dein.dir.install = expand('~/.config/dein/repos/github.com/Shougo/dein.vim') . ''
let s:dein.dir.plugins = expand('~/.config/dein')

if !isdirectory(s:dein.dir.install)
  call system(printf('git clone https://github.com/Shougo/dein.vim %s', shellescape(s:dein.dir.install)))
endif

let &runtimepath = &runtimepath . ',' . s:dein.dir.install . ',' . expand('~/.config/nvim')
if dein#load_state(s:dein.dir.install)
  call dein#begin(s:dein.dir.plugins)
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deol.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('cohama/lexima.vim')
  call dein#add('haya14busa/vim-gtrans')
  call dein#add('hrsh7th/denite-converter-prioritize-basename')
  call dein#add('hrsh7th/deoplete-vsnip')
  call dein#add('hrsh7th/vim-denite-gitto')
  call dein#add('hrsh7th/vim-gitto')
  call dein#add('hrsh7th/vim-locon')
  call dein#add('hrsh7th/vim-neco-calc')
  call dein#add('hrsh7th/vim-vsnip')
  call dein#add('itchyny/lightline.vim')
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
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#local('~/Development/workspace/LocalVimPlugins')
  call dein#local('~/Develop/LocalVimPlugins')
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

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let $TERM = 'xterm256-color'
set termguicolors
set t_Co=256
set updatetime=1000
set autoread
set hidden
set nobackup
set noswapfile
set lazyredraw
set shell=bash
set scrolloff=3
set sidescrolloff=3
set complete=w
set belloff=all
set synmaxcol=512
set undodir=~/.vimundo
set undofile
set isfname-==
set isfname+=\\
set diffopt=filler,iwhite,algorithm:histogram,indent-heuristic

set mouse=n
set virtualedit=all
set termguicolors
set splitright
set splitbelow
set nowrap
set number
set numberwidth=4
set cursorline
set modeline
set modelines=2
set wildmenu
set wildmode=longest:full
set wildchar=<Tab>
set pumheight=50
set showtabline=2
set cmdheight=2
set laststatus=2
set list
set noshowmode
set ambiwidth=double
set title
set shortmess+=I
set listchars=tab:>-,trail:^
set background=dark

set incsearch
set hlsearch
set ignorecase
set smartcase
set suffixesadd=.php,.tpl,.ts,.tsx,.css,.scss,.rb,.java,.json,.md,.as,.js,.jpg,.jpeg,.gif,.png,.vim
set matchpairs=(:),[:],{:}

set autoindent
set cindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0
set backspace=2
set whichwrap=b,s,h,l,<,>,[,]

if has('nvim')
  set wildoptions=pum
  set scrollback=2000
  set clipboard=unnamedplus
  set fillchars+=vert:\ ,eob:\ 
  set inccommand=split
  set completeopt=menu
else
  set clipboard=unnamed
  set fillchars+=vert:\ 
  set completeopt=popup
endif

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

inoremap <C-l> <Right>
inoremap <C-h> <Left>

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

nnoremap <F5> :<C-u>call vimrc#detect_cwd()<CR>

if dein#tap('vim-quickrun')
  let g:quickrun_no_default_key_mappings = 1
  nnoremap <Leader><Leader>r :<C-u>QuickRun<CR>
endif

if dein#tap('defx.nvim')
  nnoremap <F2> :<C-u>call DefxOpen()<CR>
  function! DefxOpen()
    let path = expand('%:p:h')
    let winnrs = filter(range(1, tabpagewinnr(tabpagenr(), '$')), { i, wnr -> getbufvar(winbufnr(wnr), '&filetype') == 'defx' })
    if len(winnrs) > 0
      let choise = choosewin#start(winnrs, { 'auto_choose': 1, 'blink_on_land': 0, 'noop': 1 })
      if len(choise) > 0
        execute printf('%swincmd w', choise[1])
        call defx#call_action('cd', [path])
      endif
    else
      Defx -split=vertical -direction=topleft -winwidth=40 -session-file=`expand('~/.defx_session')` `expand('%:p:h')`
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
  nnoremap <expr><F3> printf(':<C-u>Denite -buffer-name=file_rec file/rec:%s<CR>', vimrc#get_cwd())
  nnoremap <expr>gr printf(':<C-u>Denite -buffer-name=grep -no-empty grep:%s<CR>', vimrc#get_cwd())
  nnoremap <Leader>0 :<C-u>Denite menu<CR>
  vnoremap <Leader>0 :<C-u>Denite menu<CR>
  nnoremap <Leader>m :<C-u>Denite denite -buffer-name=denite<CR>
  nnoremap <Leader>n :<C-u>Denite -resume -buffer-name=grep -immediately -cursor-pos=+1 -no-empty<CR>
  nnoremap <Leader>p :<C-u>Denite -resume -buffer-name=grep -immediately -cursor-pos=-1 -no-empty<CR>
endif

if dein#tap('git-messenger.vim')
  nmap gi <Plug>(git-messenger)
endif

if dein#tap('dein.vim')
  let g:dein#install_log_filename = '~/dein.log'
endif

if dein#tap('lexima.vim')
  let g:lexima_nvim_accept_pum_with_enter = 0
  let g:lexima_no_default_rules = v:true
  call lexima#set_default_rules()

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
  call lexima#add_rule({ 'char': '<Tab>', 'at': '\%#\s*' . "'", 'input': '<Left><C-o>f' . "'" . '<Right>' })
endif

if dein#tap('git-messenger.vim')
  let g:git_messenger_include_diff = v:true
  let g:git_messenger_always_into_popup = v:true
endif

if dein#tap('vim-devicons')
  let g:webdevicons_enable_denite = v:false
endif

if dein#tap('vim-vsnip')
  if dein#tap('lexima.vim')
    imap <expr><Tab> vsnip#expandable_or_jumpable() ? '<Plug>(vsnip-expand-or-jump)' : lexima#expand('<LT>Tab>', 'i')
    smap <expr><Tab> vsnip#expandable_or_jumpable() ? '<Plug>(vsnip-expand-or-jump)' : lexima#expand('<LT>Tab>', 'i')
  else
    imap <expr><Tab> vsnip#expandable_or_jumpable() ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
    smap <expr><Tab> vsnip#expandable_or_jumpable() ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
  endif
endif

if dein#tap('vim-themis')
  if has('vim_starting')
    let $PATH = $PATH . ':' . dein#get('vim-themis').rtp . '/bin'
    let $THEMIS_VIM = 'nvim'
  endif
endif

if dein#tap('vim-locon')
  call locon#def('ignore_globs', ['.git/', '.svn/', 'img/', 'image/', 'images/', '*.gif', '*.jpg', '*.jpeg', '*.png', 'vendor/', 'node_modules/', '*.po', '*.mo', '*.swf', '*.min.*', '*.map'])
  if filereadable(expand('$HOME/.vimrc.local'))
    execute printf('source %s', expand('$HOME/.vimrc.local'))
  endif
endif

if dein#tap('nord-vim')
  let g:nord_bold = v:true
  let g:nord_italic = v:true
  let g:nord_underline = v:true
  let g:nord_italic_comments = v:true
  let g:nord_cursor_line_number_background = v:false
  colorscheme nord
else
  colorscheme ron
endif

if dein#tap('vim-lsp')
"  let g:lsp_log_file = '/tmp/lsp.log'
  let g:lsp_fold_enabled = v:false
  let g:lsp_signs_error = { 'text' : "\uf071" }
  let g:lsp_signs_warning = { 'text' : "\uf071" }
  let g:lsp_signs_information = { 'text' : "\uf449" }
  let g:lsp_signs_hint = { 'text' : "\uf400" }
  let g:lsp_diagnostics_echo_cursor = v:true
  let g:lsp_highlight_references_enabled = v:false

  highlight! LspErrorText guifg=red
  highlight! LspWarningText guifg=yellow
  highlight! LspHintText guifg=darkgray
  highlight! LspInformationText guifg=darkgray

  let g:lsp_server_definitions = []

  " npm install -g typescript-language-server
  let g:lsp_server_definitions += [{
        \   'executable': 'typescript-language-server',
        \   'cmd': { server_info -> [&shell, &shellcmdflag, 'typescript-language-server --stdio'] },
        \   'whitelist': ['typescript', 'typescript.tsx', 'typescript.dts', 'javascript', 'javascipt.jsx']
        \ }]

  " npm install -g javascript-typescript-langserver
"  let g:lsp_server_definitions += [{
"        \   'executable': 'javascript-typescript-langserver',
"        \   'cmd': { server_info -> [&shell, &shellcmdflag, 'javascript-typescript-stdio'] },
"        \   'whitelist': ['typescript', 'typescript.tsx', 'typescript.dts', 'javascript', 'javascipt.jsx']
"        \ }]

  " npm install -g diagnostic-languageserver
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

  " npm install -g vim-language-server
  let g:lsp_server_definitions += [{
        \   'executable': 'vim-language-server',
        \   'cmd': { server_info -> [&shell, &shellcmdflag, 'vim-language-server --stdio'] },
        \   'whitelist': ['vim']
        \ }]

  " npm install -g intelephense@1.0.10
  let g:lsp_server_definitions += [{
        \   'init': { -> !isdirectory(expand('./cache/intelephense')) ? mkdir(expand('~/.cache/intelephense'), 'p') : v:null },
        \   'executable': 'intelephense',
        \   'cmd': { server_info -> [&shell, &shellcmdflag, 'intelephense --stdio'] },
        \   'initialization_options': {
        \     'storagePath': expand('~/.cache/intelephense')
        \   },
        \   'whitelist': ['php']
        \ }]

  " rustup update && rustup component add rls rust-analysis rust-src
  let g:lsp_server_definitions += [{
        \   'executable': 'rls',
        \   'cmd': { server_info -> [&shell, &shellcmdflag, 'rustup run nightly-2019-09-15 rls'] },
        \   'whitelist': ['rust']
        \ }]

  autocmd! vimrc User lsp_setup call s:setup_lsp()
  function! s:setup_lsp()
    let priority = 0 " Specifying to use server for `LspDocumentFormat`.
    for server in get(g:, 'lsp_server_definitions', [])
      if executable(server.executable)
        if has_key(server, 'init')
          call server['init']()
        endif
        call lsp#register_server({
              \ 'name': priority . '_' . server.executable,
              \ 'cmd': server.cmd,
              \ 'whitelist': server.whitelist,
              \ 'root_uri': { server_info -> lsp#utils#path_to_uri(vimrc#get_project_root()) },
              \ 'initialization_options': get(server, 'initialization_options', {})
              \ })
        let priority = priority + 1
      endif
    endfor
  endfunction

  autocmd! vimrc User lsp_float_opened call s:on_lsp_float_opened()
  function! s:on_lsp_float_opened() abort
    let l:winid = lsp#ui#vim#output#getpreviewwinid()
    if l:winid >= 0
      call nvim_win_set_option(l:winid, 'winhl', 'Normal:MyNormalFloat,NormalNC:MyNormalFloat')
    endif
  endfunction
endif

if dein#tap('vim-gitto')
  let g:gitto#config = {}
  let g:gitto#config.get_buffer_path = function('vimrc#get_buffer_path')
endif

if dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#source('_', 'min_pattern_length', 1)
  call deoplete#custom#option('ignore_sources', {
        \ 'denite-filter': ['denite', 'buffer', 'around']
        \ })
endif

if dein#tap('neomru.vim')
  let g:neomru#directory_mru_limit = 50
  let g:neomru#file_mru_limit = 50
endif

if dein#tap('deol.nvim')
  let g:deol#prompt_pattern = '.\{-}\$'
  let g:deol#enable_dir_changed = 0

  autocmd! vimrc FileType deol call s:setup_deol()
  function! s:setup_deol()
    setlocal nobuflisted
    nnoremap <buffer><F10> :<C-u>tabnew \| call deol#start(printf('-cwd=%s', vimrc#get_buffer_path()))<CR>
  endfunction
endif

if dein#tap('defx.nvim')
  call defx#custom#option('_', {
        \   'columns': 'mark:indent:icons:filename:type',
        \ })

  autocmd! vimrc FileType defx call s:setup_defx()
  function! s:setup_defx() abort
    setlocal nonumber
    setlocal winfixwidth

    if has('nvim')
      setlocal winhighlight=Normal:TabLineFill,EndOfBuffer:TabLineFill
    endif

    " open
    nnoremap <silent><buffer><expr><Tab>     defx#do_action('call', 'DefxSuitableMoveAction')
    nnoremap <silent><buffer><expr><CR>      defx#do_action('open', 'DefxEditAction')
    nnoremap <silent><buffer><expr>v         defx#do_action('open', 'DefxVsplitAction')
    nnoremap <silent><buffer><expr>s         defx#do_action('open', 'DefxSplitAction')
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
    nnoremap <silent><buffer><F5>            :<C-u>call vimrc#detect_cwd()<CR>
    nnoremap <silent><buffer><expr>.         defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr>@         defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr><C-l>     defx#do_action('redraw')
    nnoremap <silent><buffer><Leader><CR>    :<C-u>new \| Defx -new -session-file=`expand('~/.defx_session')` `expand('%:p:h')`<CR>
    nnoremap <silent><buffer>H               :<C-u>call DefxTerminal()<CR>
  endfunction

  command! -nargs=* -range DefxEditAction call DefxOpenAction('edit', <q-args>)
  command! -nargs=* -range DefxVsplitAction call DefxOpenAction('vnew', <q-args>)
  command! -nargs=* -range DefxSplitAction call DefxOpenAction('new', <q-args>)
  function! DefxOpenAction(cmd, path)
    call vimrc#open(a:cmd, {
          \ 'path': a:path,
          \ 'line': -1,
          \ 'col': -1
          \ })
    setlocal nowinfixwidth
    setlocal nowinfixheight
  endfunction

  function! DefxSuitableMoveAction(context)
    let current = vimrc#path(b:defx.paths[0], '/')
    let cwd = vimrc#path(vimrc#get_cwd(), '/')
    let root = vimrc#path(vimrc#get_project_root(current), '/')

    if current == cwd || !vimrc#is_parent_path(cwd, current)
      call defx#call_action('cd', [root])
      return
    endif
    call defx#call_action('cd', [cwd])
  endfunction

  function! DefxTerminal()
    let candidate = defx#get_candidate()
    if vimrc#path(b:defx['paths'][0], '/') == vimrc#path(candidate['action__path'], '/')
      let cwd = candidate['action__path']
    else
      if isdirectory(candidate['action__path'])
        let mods = ':p:h:h'
      else
        let mods = ':p:h'
      endif
      let cwd = fnamemodify(candidate['action__path'], mods)
    endif

    if !exists('t:deol') || bufwinnr(get(t:deol, 'bufnr', -1)) == -1
      topleft 12split
      setlocal winfixheight
      call deol#start(printf('-cwd=%s', cwd))
    else
      let t:deol['cwd'] = ''
      call deol#start(printf('-cwd=%s', cwd))
    endif
  endfunction
endif

if dein#tap('lightline.vim')
  let g:lightline = {}
  let g:lightline.colorscheme = 'nord'
  let g:lightline.enable = {}
  let g:lightline.enable.statusline = 1
  let g:lightline.enable.tabline = 1

  let g:lightline.active = {}
  let g:lightline.active.left = [['readonly', 'filename', 'modified']]
  let g:lightline.active.right = [['lineinfo', 'percent', 'filetype', 'lsp']]
  let g:lightline.inactive = g:lightline.active
  let g:lightline.separator = { 'left': '', 'right': '' }
  let g:lightline.subseparator = { 'left': '', 'right': '' }

  let g:lightline.tabline = {}
  let g:lightline.tabline.left = [['tabs']]
  let g:lightline.tabline.right = [['cwd', 'git']]
  let g:lightline.tabline_separator = { 'left': '', 'right': '' }
  let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }

  let g:lightline.component_function = {}
  let g:lightline.component_function.git = 'Git'
  let g:lightline.component_function.cwd = 'CWD'
  let g:lightline.component_function.lsp = 'LSP'

  function! Git()
    if dein#tap('vim-gitto')
      try
        return gitto#run('repo#head')
      catch /.*/
      endtry
    endif
    return 'no git'
  endfunction

  function! CWD()
    return vimrc#get_cwd()
  endfunction

  function! LSP()
    if dein#tap('vim-lsp')
      try
        return stridx(lsp#get_server_status(), ': running') >= 0 ? 'lsp' : 'no lsp'
      catch /.*/
      endtry
    endif
    return 'no lsp'
  endfunction
endif

if dein#tap('vim-hexokinase')
  let g:Hexokinase_ftAutoload = ['javascript.jsx', 'typescript.tsx', 'css', 'scss']
  let g:Hexokinase_refreshEvents = ['BufWritePost', 'TextChanged', 'TextChangedI']
  let g:Hexokinase_virtualText = '■'
endif

if dein#tap('denite.nvim')
  autocmd! vimrc FileType denite call s:setup_denite()
  function! s:setup_denite()
    if exists('+winhighlight')
      setlocal winhighlight=Normal:TabLineFill,EndOfBuffer:TabLineFill
    endif
    nnoremap <silent><buffer><expr>i       denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr>a       denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr>q       denite#do_map('quit')
    nnoremap <silent><buffer><expr><Esc>   denite#do_map('quit')
    nnoremap <silent><buffer><expr><Tab>   denite#do_map('choose_action')
    nnoremap <silent><buffer><expr><C-l>   denite#do_map('redraw')
    nnoremap <silent><buffer><expr><C-h>   denite#do_map('restore_sources')
    nnoremap <silent><buffer><expr><CR>    denite#do_map('do_action')
    nnoremap <silent><buffer><expr>o       denite#do_map('do_action', 'open')
    nnoremap <silent><buffer><expr>v       denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr>s       denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr>n       denite#do_map('do_action', 'new')
    nnoremap <silent><buffer><expr>d       denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr>p       denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr>*       denite#do_map('toggle_select_all')
    nnoremap <silent><buffer><expr>@       denite#do_map('toggle_select') . 'j'
  endfunction

  autocmd! vimrc FileType denite-filter call s:setup_denite_filter()
  function! s:setup_denite_filter()
    let b:lexima_disabled = v:true
    imap <silent><buffer><Esc> <Plug>(denite_filter_quit)
    nnoremap <silent><buffer><Esc> :<C-u>p<CR>
  endfunction

  " source var custom
  if executable('ag')
    call denite#custom#var('file/rec', 'command', ['ag'] + map(deepcopy(locon#get('ignore_globs')), { k, v -> '--ignore=' . v }) + ['--nocolor', '--nogroup', '-g', ''])
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'] + map(deepcopy(locon#get('ignore_globs')), { k, v -> '--ignore=' . v }))
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif

  " filter custom
  call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', locon#get('ignore_globs'))

  " converters
  call denite#custom#source('grep', 'converters', ['converter/abbr_word'])
  call denite#custom#source('file/rec,file_mru', 'converters', ['converter/prioritize_basename', 'converter/abbr_word'])

  " sorter
  call denite#custom#source('buffer,file_mru,directory_mru', 'sorters', [])
  call denite#custom#source('_', 'sorters', ['sorter/sublime'])

  " matchers
  call denite#custom#source('buffer,file_mru,directory_mru', 'matchers', ['matcher/ignore_current_buffer', 'matcher/substring'])
  call denite#custom#source('_', 'matchers', ['matcher/substring'])

  " option.
  call denite#custom#option('grep', 'quit', v:false)
  call denite#custom#option('_', 'winheight', 10)
  call denite#custom#option('_', 'filter_updatetime', 500)
  call denite#custom#option('_', 'highlight_matched_char', 'None')
  call denite#custom#option('_', 'highlight_matched_range', 'None')

  " menu.
  let s:menus = {}
  let s:menus.string = {'description': 'string utilities.'}
  let s:menus.string.command_candidates = [
        \ ['format: remove empty line', "'<,'>g/^$/d"],
        \ ['format: remove trailling space', "'<,'>s/\\s*$//g"],
        \ ['format: querystring', 'silent! %s/&amp;/\&/g | silent! %s/&/\r&/g | silent! %s/=/\r=/g'],
        \ ['format: to smb', 'silent! %s/\\/\//g | silent! %s/^\(smb:\/\/\|\/\/\)\?/smb:\/\//g']
        \ ]
  let s:menus.vim = {'description': 'vim runtime.'}
  let s:menus.vim.command_candidates = [
        \ ['upgrade: dein:deps', 'call dein#update()']
        \ ]
  call denite#custom#var('menu', 'menus', s:menus)

  " execute action.
  function! s:denite_execute_action(context)
    call defx#call_action('cd', [a:context['targets'][0]['action__path']])
  endfunction
  call denite#custom#action('directory', 'execute', function('s:denite_execute_action'))

  " open action.
  function! s:denite_open_action(context)
    for target in a:context['targets']
      call vimrc#open('edit', {
            \ 'path': target['action__path'],
            \ 'line': get(target, 'action__line', -1),
            \ 'col': get(target, 'action__col', -1)
            \ }, a:context['prev_winid'])
    endfor
  endfunction
  call denite#custom#action('openable,file,buffer', 'open', function('s:denite_open_action'), { 'is_quit': v:true, 'is_redraw': v:false })

  " split action.
  function! s:denite_split_action(context)
    for target in a:context['targets']
      call vimrc#open('new', {
            \ 'path': target['action__path'],
            \ 'line': get(target, 'action__line', -1),
            \ 'col': get(target, 'action__col', -1)
            \ }, a:context['prev_winid'])
    endfor
  endfunction
  call denite#custom#action('openable,file,buffer', 'split', function('s:denite_split_action'), { 'is_quit': v:true, 'is_redraw': v:false })

  " vsplit action.
  function! s:denite_vsplit_action(context)
    for target in a:context['targets']
      call vimrc#open('vnew', {
            \ 'path': target['action__path'],
            \ 'line': get(target, 'action__line', -1),
            \ 'col': get(target, 'action__col', -1)
            \ }, a:context['prev_winid'])
    endfor
  endfunction
  call denite#custom#action('openable,file,buffer', 'vsplit', function('s:denite_vsplit_action'), { 'is_quit': v:true, 'is_redraw': v:false })

  " delete action
  if dein#tap('vim-denite-gitto')
    function! s:denite_delete_action(context)
      if index(['y', 'ye', 'yes'], input('delete?(yes/no): ')) >= 0
        for target in a:context['targets']
          call delete(target['action__path'], 'rf')
        endfor
      endif
    endfunction
    call denite#custom#action('gitto/status', 'delete', function('s:denite_delete_action'), { 'is_quit': v:false, 'is_redraw': v:true })
  endif

  " qfreplace action
  if dein#tap('vim-qfreplace')
    function! s:denite_qfreplace_action(context)
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
    call denite#custom#action('file', 'qfreplace', function('s:denite_qfreplace_action'))
  endif
endif

autocmd! vimrc FileType * call s:on_file_type()
function! s:on_file_type()
  let filetype_map = {
        \ '.*\.d\.ts$': 'typescript.dts'
        \ }
  for [k, v] in items(filetype_map)
    if bufname('%') =~ k
      execute printf('setlocal filetype=%s', v)
    endif
  endfor

  if dein#tap('vim-findent')
    if filereadable(expand('%')) && &buftype ==# ''
      Findent --no-messages --no-warnings --chunksize=100
    endif
  endif

  if dein#tap('vim-lsp')
    for server in get(g:, 'lsp_server_definitions', [])
      if executable(server.executable)
        nnoremap <Leader><CR> V<ESC>:<C-u>LspCodeAction<CR>
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

autocmd! vimrc ColorScheme * call s:on_color_scheme()
function! s:on_color_scheme()
  highlight! CursorLine gui=underline guibg=NONE guifg=NONE
  highlight! Pmenu guibg=#666666
  highlight! MyNormalFloat guibg=#494949
  highlight! MyTerminalBackground guibg=#222222
endfunction
call s:on_color_scheme()

autocmd! vimrc BufRead * call s:on_buf_read()
function! s:on_buf_read()
  if line("'\"") > 0 && line("'\"") <= line('$')
    normal! g`""
  endif
endfunction

autocmd! vimrc BufEnter * call s:on_buf_enter()
function! s:on_buf_enter()
  setlocal cursorline
endfunction

autocmd! vimrc BufLeave * call s:on_buf_leave()
function! s:on_buf_leave()
  setlocal nocursorline
endfunction

if has('nvim')
  autocmd! vimrc TermOpen term://* call s:on_term_open()
else
  autocmd! vimrc TerminalOpen term://* call s:on_term_open()
endif
function! s:on_term_open()
  if has('nvim')
    setlocal winhighlight=Normal:MyTerminalBackground,EndOfBuffer:MyTerminalBackground
  endif
  tnoremap <buffer><silent><Esc> <C-\><C-n>
endfunction

autocmd! vimrc BufWinEnter * call s:on_buf_win_enter()
function! s:on_buf_win_enter()
  if &previewwindow
    setlocal wrap
  endif
endfunction

