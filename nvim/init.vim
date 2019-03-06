scriptencoding utf-8
if has('vim_starting')
  set encoding=utf-8
endif

let g:loaded_matchparen = 1
let g:loaded_python_provider = 1
let g:python_host_skip_check = 1
let g:python_host_prog = 'python3'
let g:python3_host_skip_check = 1
let g:python3_host_prog = 'python3.6'


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
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deol.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/echodoc.vim')
  call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('StanAngeloff/php.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('hrsh7th/defx.nvim')
  call dein#add('hrsh7th/deoplete-vim-lsp')
  call dein#add('hrsh7th/vim-locon')
  call dein#add('hrsh7th/vim-neco-calc')
  call dein#add('hrsh7th/vim-unmatchparen')
  call dein#add('hrsh7th/vim-versions')
  call dein#add('itchyny/lightline.vim')
  call dein#add('kmnk/denite-dirmark')
  call dein#add('kristijanhusak/defx-icons')
  call dein#add('lambdalisue/vim-findent')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('nightsense/snow')
  call dein#add('pangloss/vim-javascript')
  call dein#add('peitalin/vim-jsx-typescript')
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('t9md/vim-choosewin')
  call dein#add('t9md/vim-quickhl')
  call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })
  call dein#add('thinca/vim-qfreplace')
  call dein#add('thinca/vim-quickrun')
  call dein#add('tpope/vim-fugitive')
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
set completeopt-=preview
set noerrorbells
set novisualbell
set t_vb=
set clipboard+=unnamed
set isfname-==
set isfname+=\\
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
set suffixesadd=.php,.tpl,.ts,.tsx,.css,.scss,.rb,.java,.json,.md,.as,.js
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
nnoremap <expr>gf<CR> MyProjectRootFindFile(expand('<cfile>'), 'edit')
nnoremap <expr>gfs MyProjectRootFindFile(expand('<cfile>'), 'split')
nnoremap <expr>gfv MyProjectRootFindFile(expand('<cfile>'), 'vsplit')

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
    let s:path = expand('%:p:h')
    let s:winnrs = filter(range(1, tabpagewinnr(tabpagenr(), '$')), { i, wnr -> getbufvar(winbufnr(wnr), '&filetype') == 'defx' })
    let s:choise = choosewin#start(s:winnrs, { 'auto_choose': 1, 'blink_on_land': 0, 'noop': 1 })
    if len(s:choise) > 0
      execute printf('%swincmd w', s:choise[1])
      call defx#call_action('cd', [s:path])
    else
      Defx -auto-cd -split=vertical -direction=topleft -winwidth=35 `expand('%:p:h')`
    endif
  endfunction
endif

if dein#tap('unite.vim') && dein#tap('vim-versions')
  nnoremap <expr><Leader>b printf(':<C-u>Unite versions/git/branch:%s<CR>', MyProjectRootDetect(MyExpandCurrentBuffer(':p'), {'ignore_project_root_vars': 1}))
  nnoremap <expr><F6> printf(':<C-u>UniteVersions status:%s<CR>', MyProjectRootDetect(MyExpandCurrentBuffer(':p'), {}))
  nnoremap <F7> :<C-u>UniteVersions log:%<CR>
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
  nnoremap <expr><F3> printf(':<C-u>Denite -auto-resume file/rec:%s<CR>', MyProjectRootDetect(MyExpandCurrentBuffer(':p'), {}))
  nnoremap <expr>gr printf(':<C-u>Denite -auto-resume -no-empty grep:%s<CR>', fnameescape(MyProjectRootDetect(MyExpandCurrentBuffer(':p'), {})))
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
let g:project_root_detectors = ['.svn', '.git', 'package.json', 'composer.json']
function! MyProjectRootDetect(path, option)
  if exists('t:my_project_root_dir') && !exists('a:option.ignore_project_root_vars')
    return t:my_project_root_dir
  endif

  let path = a:path
  let path = exists('b:defx.paths[0]') ? fnamemodify(b:defx.paths[0], ':p') : path
  let path = exists('b:unite.prev_bufnr') ? fnamemodify(bufname(b:unite.prev_bufnr), ':p') : path

  while path != '/'
    for detect in g:project_root_detectors
      let target = printf('%s/%s', s:trim_right(path, '/'), detect)
      if isdirectory(target) || filereadable(target)
        return path
      endif
    endfor
    let path = fnamemodify(path, ':p:h:h')
  endwhile
  return MyExpandCurrentBuffer(':p:h')
endfunction

function! MyExpandCurrentBuffer(opt)
  if &buftype == 'terminal'
    return getcwd()
  endif
  return expand('%' . a:opt)
endfunction

function! MyProjectRootDecide()
  if exists('t:my_project_root_dir')
    unlet t:my_project_root_dir
  endif

  let path = MyProjectRootDetect(MyExpandCurrentBuffer(':p'), {})
  let path = exists('b:defx.paths[0]') ? fnamemodify(b:defx.paths[0], ':p') : path
  let path = exists('b:unite.prev_bufnr') ? fnamemodify(bufname(b:unite.prev_bufnr), ':p') : path
  let t:my_project_root_dir = path

  execute printf('tchdir %s', fnameescape(t:my_project_root_dir))
endfunction

function! MyProjectRootFindFile(filepath, command)
  let path = MyProjectRootDetect(MyExpandCurrentBuffer(''), {'ignore_project_root_vars': 1})
  let filepath = a:filepath
  let filepath = substitute(filepath, '\.[^\.]*$', '', 'g')
  let filepath = substitute(filepath, '\.\|\\', '/', 'g')
  let filepath = substitute(filepath, '^[\./]*', '', 'g')
  for name in keys(locon#get('filename_converters'))
    let filepath = locon#get('filename_converters')[name]({'path': path, 'filepath': filepath})
  endfor

  let filedirs = split(fnamemodify(filepath, ':h'), '/')
  let bufferdirs = split(fnamemodify(expand('%:p:h'), ':h'), '/')
  let search_path = '/' . join(s:remove_tail_paths(bufferdirs, filedirs), '/')

  if exists('g:my_debug')
    echomsg 'target file   name: ' . a:filepath
    echomsg 'modified file name: ' . filepath
    echomsg 'project root   dir: ' . path
    echomsg 'upward start   dir: ' . expand('%:p:h')
    echomsg 'upward end     dir: ' . search_path
  endif

  let result = ''
  let result = result != '' ? result : findfile(filepath, search_path . '**')
  let result = result != '' ? result : findfile(filepath . '/index', search_path . '**')
  let result = result != '' ? result : findfile(filepath, path . '**')
  let result = result != '' ? result : findfile(filepath . '/index', path . '**')
  if strlen(result)
    return printf(":\<C-u>%s %s\<CR>", a:command, fnameescape(result))
  endif
endfunction

" remove tail paths.
function! s:remove_tail_paths(dirs, removes)
  let s:dirs = a:dirs
  for s:r in reverse(a:removes)
    if s:dirs[len(s:dirs) - 1] == s:r
      call remove(s:dirs, len(s:dirs) - 1)
    endif
  endfor
  return s:dirs
endfunction

" trim right.
function! s:trim_right(str, trim)
  return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction

" get git branch name.
function! GitBranch()
  try
    if dein#tap('vim-fugitive')
      if exists('t:my_project_root_dir')
        if fugitive#is_git_dir(fugitive#extract_git_dir(t:my_project_root_dir))
          return fugitive#repo(fugitive#extract_git_dir(t:my_project_root_dir)).head()
        endif
      endif
    endif
  catch /.*/
  endtry
  return ''
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

if dein#tap('vim-locon')
  call locon#def('find_project_root', { path -> fnamemodify(finddir('.git', path . ';'), ':p:h') })
  call locon#def('filename_converters', {})
  call locon#def('ignore_globs', ['.git/', '.svn/', 'img/', 'image/', 'images/', '*.gif', '*.jpg', '*.jpeg', '*.png', '*.svg', 'vendor/', 'node_modules/', '*.po', '*.mo', '*.swf', '*.min.*'])
  call locon#def('ignore_greps', ['\.git', '\.svn', 'node_modules\/', 'vendor\/', '\.min\.'])
  call locon#def('init_lsp_server', { -> '' })

  if filereadable(expand('$HOME/.vimrc.local'))
    execute printf('source %s', expand('$HOME/.vimrc.local'))
  endif
endif

" --------------------
"  colorscheme
" --------------------
if dein#tap('snow')
  colorscheme snow
else
  colorscheme ron
endif

" --------------------
"  vim-unmatchparen
" --------------------
if dein#tap('vim-unmatchparen')
  let g:unmatchparen#disable_filetypes = ['vim']
endif

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
" vim-lsp
" --------------------
if dein#tap('vim-lsp')
  let g:lsp_signs_enabled = 1
  let g:lsp_diagnostics_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 1
  let g:lsp_signs_error = { 'text': "\uf071" }
  let g:lsp_signs_warning = { 'text': "\uf071" }
  let g:lsp_signs_information = { 'text': "\uf449" }
  let g:lsp_signs_hint = { 'text': "\uf400" }
  let g:lsp_insert_text_enabled = 0

  highlight! link LspErrorText SignColumn
  highlight! link LspWarningText SignColumn
  highlight! link LspInformationText SignColumn
  highlight! link LspHintText SignColumn

  let g:my_lsp_language_server_filetypes = {}

  if executable('typescript-language-server')
    let g:my_lsp_language_server_filetypes['typescript-language-server'] = ['typescript', 'typescript.tsx', 'javascript', 'javascript.tsx']
    autocmd! User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': { server_info -> [&shell, &shellcmdflag, 'typescript-language-server --stdio'] },
        \ 'root_uri': { server_info -> lsp#utils#path_to_uri(locon#get('find_project_root')(lsp#utils#get_buffer_path())) },
        \ 'whitelist': g:my_lsp_language_server_filetypes['typescript-language-server']
        \ })
  endif

  autocmd! User lsp_server_init call locon#get('init_lsp_server')()
endif

" --------------------
"  auto-pairs
" --------------------
if dein#tap('ale')
  let g:ale_linters = {}
  for [s:s, s:fts] in items(g:my_lsp_language_server_filetypes)
    for s:ft in s:fts
      let g:ale_linters[s:ft] = []
    endfor
  endfor
endif

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
" vim-versions.
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
  call deoplete#custom#source('lsp', 'rank', 2000)
  call deoplete#custom#source('file', 'enable_buffer_path', v:true)
  call deoplete#custom#source('_', 'min_pattern_length', 1)
  call deoplete#custom#source('_', 'converters', [
        \ 'remove_overlap',
        \ 'converter_truncate_menu',
        \ 'converter_truncate_abbr',
        \ 'converter_remove_paren'])
endif

" --------------------
" deoplete-vim-lsp
" --------------------
if dein#tap('deoplete-vim-lsp')
  let g:deoplete#sources#vim_lsp#show_info = 1
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

  autocmd! FileType deol call s:deol_setting()
  function! s:deol_setting()
    setlocal nobuflisted
    nnoremap <buffer><F10> :<C-u>tabnew \| call deol#start(printf('-cwd=%s', MyExpandCurrentBuffer(':p:h')))<CR>
  endfunction
endif

if dein#tap('defx.nvim')
  call defx#custom#option('_', {
        \ 'columns': 'mark:icons:filename:type',
        \ })
  call defx#custom#column('mark', {
        \ 'directory_icon': '+',
        \ 'readonly_icon': ' ',
        \ 'root_icon': ' ',
        \ 'selected_icon': '*',
        \ 'length': 1,
        \ })

  autocmd FileType defx call s:defx_setting()
  function! s:defx_setting() abort
    setlocal nonumber
    setlocal winfixwidth

    " open
    nnoremap <silent><buffer><expr><CR>    defx#do_action('open', 'DefxEdit')
    nnoremap <silent><buffer><expr>l       defx#do_action('open', 'DefxEdit')
    nnoremap <silent><buffer><expr>v       defx#do_action('open', 'DefxVsplit')
    nnoremap <silent><buffer><expr>s       defx#do_action('open', 'DefxSplit')
    nnoremap <silent><buffer><expr>x       defx#do_action('execute_system')

    " move.
    nnoremap <silent><buffer><expr>h       defx#is_opened_tree() ? defx#do_action('close_tree') : defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr>j       'j'
    nnoremap <silent><buffer><expr>k       'k'
    nnoremap <silent><buffer><expr>l       defx#is_directory() ? defx#do_action('open_tree') . 'j' : defx#do_action('open', 'DefxEdit')
    nnoremap <silent><buffer><expr>~       defx#do_action('cd')
    nnoremap <silent><buffer><expr>\       defx#do_action('cd', ['/'])

    " manimpulates.
    nnoremap <silent><buffer><expr>K       defx#do_action('new_directory')
    nnoremap <silent><buffer><expr>N       defx#do_action('new_file')
    nnoremap <silent><buffer><expr>c       defx#do_action('copy')
    nnoremap <silent><buffer><expr>m       defx#do_action('move')
    nnoremap <silent><buffer><expr>d       defx#do_action('remove')
    nnoremap <silent><buffer><expr>r       defx#do_action('rename')
    nnoremap <silent><buffer><expr>p       defx#do_action('paste')

    nnoremap <silent><buffer><expr>@       defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><BS>          :<C-u>Denite -default-action=change_cwd dirmark directory_mru<CR>
    nnoremap <silent><buffer><expr><F5>    MyProjectRootDecide()
    nnoremap <silent><buffer><expr>.       defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr>@       defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr><C-l>   defx#do_action('redraw')
    nnoremap <silent><buffer><Leader><CR>  :<C-u>new \| Defx -auto-cd -new `expand('%:p:h')`<CR>

    if dein#tap('deol.nvim')
      nnoremap <buffer>H :<C-u>call MyPopupDeol(getcwd())<CR>
    endif
  endfunction

  if dein#tap('denite.nvim')
    " create 'change_cwd' action.
    function! s:action(context)
      " for denite dirmark.
      if exists('a:context["targets"][0]["action__path"]')
        call defx#call_action('cd', a:context['targets'][0]['action__path'])
        return
      endif

      " for defx/history's command.
      if exists('a:context["targets"][0]["word"]')
        call defx#call_action('cd', a:context['targets'][0]['word'])
        return
      endif
    endfunction
    call denite#custom#action('dirmark,command,directory', 'change_cwd', function('s:action'))
  endif

  if dein#tap('defx-icons')
    let g:defx_icons_enable_syntax_highlight = 1
    let g:defx_icons_column_length = 2
  endif

  command! -nargs=* -range DefxEdit call DefxOpen('edit', <q-args>)
  command! -nargs=* -range DefxVsplit call DefxOpen('vsplit', <q-args>)
  command! -nargs=* -range DefxSplit call DefxOpen('split', <q-args>)
  function! DefxOpen(cmd, path)
    let s:winnrs = filter(
          \ range(1, tabpagewinnr(tabpagenr(), '$')),
          \ { i, wnr -> index(['deol', 'defx', 'denite', 'unite'], getbufvar(winbufnr(wnr), '&filetype')) == -1 })

    if len(s:winnrs) > 0
      execute printf('%swincmd w', s:winnrs[0])
      execute printf('%s %s', a:cmd, a:path)
      return
    endif
    execute printf('edit %s', a:path)
  endfunction

  " TODO: not work
  function! DefxSuitableMove(context)
    let s:current = b:defx.paths[0]
    let s:project = MyProjectRootDetect(s:current)
    let s:vsc_root = MyProjectRootDetect(s:current, { 'ignore_project_root_vars': 1 })

    if s:current === s:prject
      call defx#do_action('cd', [s:vcs_root])
      return
    endif
    call defx#do_action('cd', [s:project])
  endfunction

  function! MyPopupDeol(cwd)
    if !exists('t:deol') || bufwinnr(get(t:deol, 'bufnr', -1)) == -1
      topleft 15split
      setlocal winfixheight
    endif
    call deol#start(printf('-cwd=%s', a:cwd))
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

  call unite#custom#profile('default', 'context', {'no_start_insert': 1, 'auto_resume': 1, 'start_insert': 0, 'winheight': 12, 'direction': 'botright', 'max_multi_lines': 1})
  call unite#custom#profile('grep', 'context', {'no_quit' : 1})
  call unite#custom#source('file_rec', 'ignore_pattern', join(['\.git\/', '\.svn\/', '\/\(image\|img\)\/', 'node_modules', 'vendor'], '\|'))
  call unite#custom#default_action('directory', 'cd')

  autocmd! FileType unite call s:unite_setting()
  function! s:unite_setting()
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
" lightline.
" --------------------
if dein#tap('lightline.vim')
  let g:lightline = {}
  let g:lightline.enable = {}
  let g:lightline.enable.statusline = 1
  let g:lightline.enable.tabline = 1
  let g:lightline.colorscheme = 'snow_dark'
  let g:lightline.tabline = {}
  let g:lightline.tabline.left = [['tabs']]
  let g:lightline.tabline.right = [['branch', 'close']]
  let g:lightline.component_function = {}
  let g:lightline.component_function.branch = 'GitBranch'
  let g:lightline.separator = { 'left': '', 'right': '' }
  let g:lightline.subseparator = { 'left': '', 'right': '' }
  let g:lightline.tabline_separator = { 'left': '', 'right': '' }
  let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }
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

  if executable('ag')
    call denite#custom#var('file/rec', 'command', [
          \ 'ag',
          \ '--follow',
          \ ] + map(deepcopy(locon#get('ignore_globs')), { k, v -> '--ignore=' . v }) + [
          \ '--nocolor',
          \ '--nogroup',
          \ '-g',
          \ ''
          \ ])
  endif
  call denite#custom#source('file/rec', 'sorters', ['sorter/word'])

  if executable('jvgrep')
    call denite#custom#var('grep', 'command', ['jvgrep'])
    call denite#custom#var('grep', 'default_opts', [
          \ '-i',
          \ '--exclude',
          \ join(locon#get('ignore_greps'), '|')
          \ ])
    call denite#custom#var('grep', 'recursive_opts', ['-R'])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', [])
    call denite#custom#var('grep', 'final_opts', [])
  endif

  call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', locon#get('ignore_globs'))
  call denite#custom#option('grep', 'quit', v:false)
  call denite#custom#option('_', 'winheight', 12)
  call denite#custom#option('_', 'vertical_preview', v:true)
  call denite#custom#option('_', 'highlight_mode_insert', 'None')
  call denite#custom#option('_', 'highlight_matched_char', 'None')
  call denite#custom#option('_', 'highlight_matched_range', 'None')
  call denite#custom#option('_', 'highlight_preview_line', 'None')
  call denite#custom#option('_', 'mode', 'normal')
  call denite#custom#option('_', 'updatetime', 500)
  call denite#custom#option('_', 'skiptime', 500)
  call denite#custom#source('_', 'matchers', ['matcher/substring'])

  if dein#tap('vim-qfreplace')
    function! s:denite_replace_action(context)
      let s:qflist = []
      for s:target in a:context['targets']
        if !has_key(s:target, 'action__path') | continue | endif
        if !has_key(s:target, 'action__line') | continue | endif
        if !has_key(s:target, 'action__text') | continue | endif

        call add(s:qflist, {
              \ 'filename': s:target['action__path'],
              \ 'lnum': s:target['action__line'],
              \ 'text': s:target['action__text']
              \ })
      endfor
      call setqflist(s:qflist)
      call qfreplace#start('')
    endfunction
    call denite#custom#action('file', 'qfreplace', function('s:denite_replace_action'))
  endif

  " menu.
  let s:menus = {}
  let s:menus.string = {'description': 'string utilities.'}
  let s:menus.string.command_candidates = [
        \ ['format: reverse lines', 'g/^/m0'],
        \ ['format: remove ^M', '%s///g'],
        \ ['format: querystring', 'silent! %s/&amp;/\&/g | silent! %s/&/\r/g | silent! %s/=/\r\t=/g'],
        \ ['format: to smb', 'silent! %s/\\/\//g | silent! %s/^\(smb:\/\/\|\/\/\)\?/smb:\/\//g']
        \ ]
  let s:menus.vim = {'description': 'vim runtime.'}
  let s:menus.vim.command_candidates = [
        \ ['upgrade: dein:deps', 'call dein#update()']
        \ ]
  call denite#custom#var('menu', 'menus', s:menus)
endif

" ########################################################################################################################
" AutoCmd Setting.
" ########################################################################################################################
augroup vimrc
  autocmd!

  autocmd! FileType * call s:file_type()
  function! s:file_type()
    " apply lsp mappings.
    for [s:v, s:filetypes] in items(g:my_lsp_language_server_filetypes)
      if index(s:filetypes, getbufvar(bufnr('%'), '&filetype')) >= 0
        nnoremap <buffer><Leader><CR> :<C-u>LspCodeAction<CR>
        nnoremap <buffer><Leader>g    :<C-u>LspReferences<CR>
        nnoremap <buffer>gf<CR>       :<C-u>LspDefinition<CR>
        nnoremap <buffer>gfs          :<C-u>sp  \| LspDefinition<CR>
        nnoremap <buffer>gfv          :<C-u>vsp \| LspDefinition<CR>
        nnoremap <buffer><Leader>r    :<C-u>LspRename<CR>
        nnoremap <buffer><Leader>i    :<C-u>LspHover<CR>
        setlocal omnifunc=lsp#complete
        break
      endif
    endfor

    " alias filetype.
    if index(['atlas'], getbufvar(bufnr('%'), '&filetype')) >= 0
      setlocal filetype=actionscript
    endif
    if index(['js', 'jsx'], getbufvar(bufnr('%'), '&filetype')) >= 0
      setlocal filetype=javascript
    endif
    if index(['ts', 'tsx', 'as'], getbufvar(bufnr('%'), '&filetype')) >= 0
      setlocal filetype=typescript
    endif
    if index(['log'], getbufvar(bufnr('%'), '&filetype')) >= 0
      setlocal tabstop=28
    endif
    if index(['php'], getbufvar(bufnr('%'), '&filetype')) >= 0
      setlocal noexpandtab
      setlocal completefunc=phpcomplete_extended#CompletePHP
    endif

    " fix layout.
    let s:current_winnr = tabpagewinnr(tabpagenr())
    try
      for s:ft in ['defx', 'deol', 'denite', 'unite']
        let s:winnrs = range(1, tabpagewinnr(tabpagenr(), '$'))
        if len(s:winnrs) > 1
          for s:winnr in s:winnrs
            if s:ft == 'defx' && s:ft == getbufvar(winbufnr(s:winnr), '&filetype')
              execute printf('silent noautocmd %swincmd w', s:winnr)
              execute printf('silent noautocmd vertical resize %s', 35)
              break
            endif
            if s:ft == 'deol' && s:ft == getbufvar(winbufnr(s:winnr), '&filetype')
              execute printf('silent noautocmd %swincmd w', s:winnr)
              execute printf('silent noautocmd wincmd K | silent noautocmd resize %s', 12)
              break
            endif
            if s:ft == 'denite' && s:ft == getbufvar(winbufnr(s:winnr), '&filetype')
              execute printf('silent noautocmd %swincmd w', s:winnr)
              execute printf('silent noautocmd wincmd J | silent noautocmd resize %s', 12)
              break
            endif
            if s:ft == 'unite' && s:ft == getbufvar(winbufnr(s:winnr), '&filetype')
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
    if filereadable(expand('%')) && exists(':Findent')
      Findent --no-messages --no-warnings --chunksize=100
    endif
  endfunction

  " ColorScheme
  autocmd! ColorScheme * call s:color_scheme()
  function! s:color_scheme()
    highlight! link VertSplit StatusLineNC
    highlight! link SignColumn StatusLineNC
    highlight! link LineNr StatusLineNC
  endfunction
  doautocmd ColorScheme

  " BufEnter.
  autocmd! BufEnter * call s:buf_enter()
  function! s:buf_enter()
    if exists('t:my_project_root_dir')
      execute printf('cd! %s', fnameescape(t:my_project_root_dir))
    endif
  endfunction

  " TermOpen.
  autocmd! TermOpen term://* call s:term_open()
  function! s:term_open()
    tnoremap <buffer><silent><Esc> <C-\><C-n>
  endfunction

  " WinEnter"
  autocmd! WinEnter * call s:win_enter()
  function! s:win_enter()
    if &previewwindow
      setlocal wrap
    endif
  endfunction

  " CmdwinEnter.
  autocmd! CmdwinEnter * call s:cmdwin_enter()
  function! s:cmdwin_enter()
    nnoremap <buffer><silent><Esc> :<C-u>q<CR>
    nnoremap <buffer>a             A
    nnoremap <buffer><silent>dd    :<C-u>call histdel(getcmdwintype(), line('.') - line('$'))<CR>dd
    startinsert!
  endfunction

augroup END

