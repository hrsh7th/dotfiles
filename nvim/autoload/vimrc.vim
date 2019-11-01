let g:vimrc#project_root_markers = ['.git', 'tsconfig.json']

function! vimrc#check_backspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! vimrc#get_buffer_path()
  if exists('b:defx')
    return b:defx.paths[0]
  endif
  if exists('t:deol') && &filetype ==# 'deol'
    return t:deol.cwd
  endif
  return expand('%:p')
endfunction

function! vimrc#get_project_root(...)
  return vimrc#findup(g:vimrc#project_root_markers, '')
endfunction

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

function! vimrc#log(...) abort
  echomsg string(['a:000', a:000])
endfunction

function! vimrc#set_cwd(cwd)
  let t:cwd = a:cwd
  execute printf('tcd %s', fnameescape(a:cwd))
endfunction

function! vimrc#get_cwd()
  if strlen(get(t:, 'cwd', '')) > 0
    return t:cwd
  endif
  return vimrc#get_project_root()
endfunction

function! vimrc#path(str)
  return substitute(a:str, '/$', '', 'g')
endfunction

function! vimrc#is_parent_path(parent, child)
  return stridx(a:parent, a:child) == 0
endfunction

function! vimrc#filter_winnrs(winnrs)
  return filter(a:winnrs, { i, wnr -> index(['deol', 'defx', 'denite'], getbufvar(winbufnr(wnr), '&filetype')) == -1 })
endfunction

function! vimrc#open(cmd, location, ...)
  let prev_winid = get(a:000, 0, win_getid(winnr('#')))

  let winnrs = vimrc#filter_winnrs([win_id2win(prev_winid)])
  if len(winnrs) > 0
    execute printf('%swincmd w', winnrs[0])
    call s:open(a:cmd, a:location)
    return
  endif

  let winnrs = vimrc#filter_winnrs(range(1, tabpagewinnr(tabpagenr(), '$')))
  if len(winnrs) > 0
    execute printf('%swincmd w', winnrs[0])
    call s:open(a:cmd, a:location)
    return
  endif

  call s:open('edit', a:location)
endfunction

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

