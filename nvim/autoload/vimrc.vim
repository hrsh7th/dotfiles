let g:vimrc#project_root_markers = ['.git', 'tsconfig.json']

let s:special_filetypes = ['defx', 'denite', 'deol']

"
" vimrc#ignore_runtime
"
function! vimrc#ignore_runtime() abort
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
endfunction

"
" vimrc#get_buffer_path
"
function! vimrc#get_buffer_path()
  if exists('b:defx')
    return b:defx.paths[0]
  endif
  if exists('t:deol') && &filetype ==# 'deol'
    return t:deol.cwd
  endif
  return expand('%:p')
endfunction

"
" vimrc#get_project_root
"
function! vimrc#get_project_root(...)
  return vimrc#findup(g:vimrc#project_root_markers, '')
endfunction

"
" vimrc#findup
"
function! vimrc#findup(markers, modifier) abort
  let path = get(a:000, 0, vimrc#get_buffer_path())
  let path = fnamemodify(path, ':p')
  while path !=# ''
    for marker in (type(a:markers) == type([]) ? a:markers : [a:markers])
      let candidate = resolve(path . '/' . marker)
      if filereadable(candidate) || isdirectory(candidate)
        return fnamemodify(path, a:modifier)
      endif
    endfor
    let path = substitute(path, '/[^/]*$', '', 'g')
  endwhile
  return ''
endfunction

"
" vimrc#detect_cwd
"
function! vimrc#detect_cwd()
  let path = vimrc#get_buffer_path()
  let root = vimrc#get_project_root()
  let cwd = isdirectory(path) ? path : root

  if exists('b:defx') && !empty(root)
    call defx#call_action('add_session', [root])
  endif

  call vimrc#set_cwd(cwd)
  redraw!
endfunction

"
" vimrc#log
"
function! vimrc#log(...) abort
  echomsg string(['a:000', a:000])
endfunction

"
" vimrc#set_cwd
"
function! vimrc#set_cwd(cwd)
  let t:cwd = a:cwd
  execute printf('tcd %s', fnameescape(a:cwd))
endfunction

"
" vimrc#get_cwd
"
function! vimrc#get_cwd()
  if strlen(get(t:, 'cwd', '')) > 0
    return t:cwd
  endif
  return vimrc#get_project_root()
endfunction

"
" vimrc#path
"
function! vimrc#path(str)
  return substitute(a:str, '/$', '', 'g')
endfunction

"
" vimrc#is_parent_path
"
function! vimrc#is_parent_path(parent, child)
  return stridx(a:parent, a:child) == 0
endfunction

"
" vimrc#find_winnrs
"
function! vimrc#find_winnrs(filetypes)
  return filter(range(1, tabpagewinnr(tabpagenr(), '$')),
        \ { i, wnr -> index(a:filetypes, getbufvar(winbufnr(wnr), '&filetype')) != -1 })
endfunction

"
" vimrc#filter_winnrs
"
function! vimrc#filter_winnrs(filetypes)
  return filter(range(1, tabpagewinnr(tabpagenr(), '$')),
        \ { i, wnr -> index(a:filetypes, getbufvar(winbufnr(wnr), '&filetype')) == -1 })
endfunction

"
" vimrc#open
"
function! vimrc#open(cmd, location)
  let winnrs = vimrc#filter_winnrs(s:special_filetypes)
  if len(winnrs) > 0
    execute printf('%swincmd w', winnrs[0])
    call s:open(a:cmd, a:location)
    return
  endif

  call s:open('edit', a:location)
endfunction

"
" s:open
"
function! s:open(cmd, location)
  try
    execute printf('%s %s', a:cmd, fnameescape(a:location['path']))
  catch /.*/
  endtry
  if a:location['line'] != -1
    if a:location['col'] != -1
      call cursor([a:location['line'], a:location['col']])
    else
      call cursor([a:location['line'], 1])
    endif
  endif
endfunction

