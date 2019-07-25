let g:vimrc#project_root_markers = ['.git']

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
  let path = get(a:000, 0, vimrc#get_buffer_path())
  let path = fnamemodify(path, ':p')
  while path !=# ''
    for marker in g:vimrc#project_root_markers
      let candidate = resolve(path . '/' . marker)
      if filereadable(candidate) || isdirectory(candidate)
        return path
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

  if exists('b:defx')
    call defx#call_action('add_session', [cwd])
  endif

  if dein#tap('neomru.vim')
    call neomru#append(cwd)
  endif

  call vimrc#set_cwd(cwd)
endfunction

function! vimrc#set_cwd(cwd)
  let t:cwd = a:cwd
endfunction

function! vimrc#get_cwd()
  if strlen(get(t:, 'cwd', '')) > 0
    return t:cwd
  endif
  return vimrc#get_project_root()
endfunction

function! vimrc#path(str, trim)
  return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction

function! vimrc#is_parent_path(parent, child)
  return stridx(a:parent, a:child) == 0
endfunction

function! vimrc#filter_winnrs(winnrs)
  return filter(a:winnrs, { i, wnr -> index(['deol', 'defx', 'denite'], getbufvar(winbufnr(wnr), '&filetype')) == -1 })
endfunction

function! vimrc#switch_buffer(cmd, path, ...)
  let prev_winid = get(a:000, 0, win_getid(winnr('#')))

  let winnr = bufwinnr(bufnr(a:path))
  if winnr > -1
    execute printf('%swincmd w', winnr)
    return
  endif

  let winnrs = vimrc#filter_winnrs([win_id2win(prev_winid)])
  if len(winnrs) > 0
    execute printf('%swincmd w', winnrs[0])
    execute printf('%s %s', a:cmd, fnameescape(a:path))
    return
  endif

  let winnrs = vimrc#filter_winnrs(range(1, tabpagewinnr(tabpagenr(), '$')))
  if len(winnrs) > 0
    execute printf('%swincmd w', winnrs[0])
    execute printf('%s %s', a:cmd, fnameescape(a:path))
    return
  endif

  execute printf('edit %s', fnameescape(a:path))
endfunction

